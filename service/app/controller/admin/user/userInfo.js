'use strict';
const { codeMap, addQuotationMarksForString, flatDataToTreeData } = require('../../../utils/index');

/**
 * 查看/修改用户信息
 *
 * @param ctx
 * @returns {Promise<null|any>}
 */
module.exports = async function(ctx) {
  try {
    let { uuid } = ctx.request.body;
    // 入参有带uuid的查指定uuid的用户的数据   没有携带则查登陆过后token内携带的用户信息


    let authentication = undefined,
        decrypt_authentication = undefined;
    if (!uuid) {
      // 查询token携带的uuid信息
      authentication = ctx.headers['y-authentication'];
      decrypt_authentication = ctx.app.jwt.verify(authentication, ctx.app.config.jwt.secret);
      uuid = decrypt_authentication.uuid;
    }

    if (ctx.request.method == 'POST') { // 查信息
      const UserInfoResult = await ctx.service.adminUser.selUserInfoByUuid(uuid);  // 查询用户信息
      const RoleInfoResult = await ctx.service.adminRole.selRoleInfoByUuid(UserInfoResult[0].roleId); // 查询角色信息
      const routerIds = RoleInfoResult[0].routerId;   // 该角色挂载的路由id
      const routerIdsForSql = addQuotationMarksForString(routerIds); // 字符串处理
      const routerInfoList = await ctx.service.adminRouter.selRouterInfoByUuids(routerIdsForSql); // 该角色包含的路由信息列表
      const allRouterList = await ctx.service.adminRouter.selRouterList(0, 9999); // 数据库中的所有路由信息
      const routerTreeData = flatDataToTreeData(routerInfoList, allRouterList); // 此角色包含的路由信息组合而成的路由树数据


      // 返回数据
      UserInfoResult[0].routerInfo = routerInfoList;
      UserInfoResult[0].routerTreeData = routerTreeData;
      return ctx.body = Object.assign(codeMap('M200'), { data: UserInfoResult[0] });

    } else if (ctx.request.method == 'PUT') { // 更新信息
      const params = ctx.request.body;
      const conn = await ctx.app.mysql.beginTransaction(); // 初始化事务
      try {
        // TODO 改造成sql语句   写联表更新
        await ctx.app.mysql.update('AdminUser', params, {
          where: { uuid },
          columns: [ 'password', 'roleId' ],
        });
        await ctx.app.mysql.update('AdminUserInfo', params, {
          where: { uuid },
          columns: [ 'avatar', 'introduction', 'name', 'phone', 'sex' ],
        });
        await conn.commit();
        return ctx.body = codeMap('M200');
      } catch (err) {
        await conn.rollback();
        throw err;
        return null;
      }
    }
  } catch (e) {
    const txt = '/admin/userInfo 接口异常' + e;
    ctx.body = { msg: txt, code: 500 };
    console.log(txt);
  }
};
