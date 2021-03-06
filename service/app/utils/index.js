// eslint-disable-next-line strict
const { codeMap } = require('../../config/staticConfig');
const create_token = function(leng) {
  leng = leng == undefined ? 32 : leng;	// 默认32位
  const chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz23456789';
  let token = '';
  for (let i = 0; i < leng; ++i) token += chars.charAt(Math.floor(Math.random() * chars.length));
  return token;
};
module.exports = {
  codeMap(code) {
    console.log(code, codeMap[code]);
    return JSON.parse(JSON.stringify({ msg: codeMap[code], code }));
  },
  create_token,
  // 字符串加单引号  "55,66,77"  =  "'55','66','77'"
  addQuotationMarksForString(str) {
    let newStr = '';
    const splitArr = str.split(',');
    splitArr.forEach(i => newStr += `'${i}',`);
    return newStr.slice(0, -1);
  },
  /**
     * 将扁平数据串联成 树数据（路由树数据）   // （elementUi的树组件给出的数据有缺陷不完美）
     * @param {*} flatData      需要串联的数据
     * @param {*} totalData     总数据
     */
  flatDataToTreeData(flatData, totalData) {
    const d1 = JSON.parse(JSON.stringify(flatData)),
      d2 = JSON.parse(JSON.stringify(totalData)),
      d3 = []; // returnData
    // children判断拆解出来
    d1.forEach(i => {
      i.children = [];

      // 字段添加
      i.path = i.routerSrc || create_token(10);
      i.name = i.routerSrc || create_token(10);
      i.meta = {
        title: i.routerName,
        icon: i.icon,
      };
      // i.component = i.pageSrc ?
      //     (i.pageSrc !='Layout' ? `() => import(${i.pageSrc})` : i.pageSrc)
      //     : ((!i.rootId && !i.parentId) ? 'Layout' : null);
    });
    const recur = () => {
      try {
        d1.forEach((i, j) => {
          if (!i.rootId || !i.parentId) { // 根级，直接弹出
            d3.push(d1.splice(j, 1)[0]);
            throw Error('根级，直接弹出');
          } else {
            // d1（自身）数组内寻找是否有父节点
            const selfHasParent_index = d1.findIndex(_i => _i.uuid == i.parentId);
            if (selfHasParent_index != -1) {
              d1[selfHasParent_index].children.push(d1.splice(j, 1)[0]);
              throw Error('自身有父级，直接弹出');
            }
            // d3数组内寻找是否有父节点
            const d3HasParent_index = d3.findIndex(_i => _i.uuid == i.parentId);
            if (d3HasParent_index != -1) {
              d3[d3HasParent_index].children.push(d1.splice(j, 1)[0]);
              throw Error('d3有父级，直接弹出');
            }
            // 总路由信息内寻找父节点
            for (let _i = 0; _i < d2.length; _i++) {
              const _item = d2[_i];
              if (_item.uuid == i.parentId) {
                const deepClone = { // 可以换成深克隆
                  uuid: _item.uuid,
                  routerName: _item.routerName,
                  routerFnId: _item.routerFnId,
                  rootId: _item.rootId,
                  parentId: _item.parentId,
                  icon: _item.icon,
                  children: [ d1.splice(j, 1)[0] ],


                  // 字段添加
                  path: _item.routerSrc || create_token(10),
                  name: _item.routerSrc || create_token(10),
                  meta: {
                    title: _item.routerName,
                    icon: _item.icon,
                  },
                  // component:_item.pageSrc ?
                  //         (_item.pageSrc !='Layout' ? `() => import(${_item.pageSrc})` : _item.pageSrc)
                  //         : ((!_item.rootId && !_item.parentId) ? 'Layout' : null)
                };
                d1.push(deepClone);
                throw Error('新组合，直接弹出');
              }
            }
          }
        });
      } catch (e) {
        // console.log('终止循环', e);
        recur();
      }
    };
    recur();
    return d3;
  },
  // create_AccessToken(){
  //     const token = await app.jwt.sign({
  //         data,
  //         exp: created + 60 * 30,
  //         iat: created,
  //     }, app.config.jwt.secret);
  //     console.log("token",token)
  // }
};
