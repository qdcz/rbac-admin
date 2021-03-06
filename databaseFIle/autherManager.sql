 # RBAC 通用模板
CREATE TABLE AdminUser (
    id bigint(0) NOT NULL AUTO_INCREMENT ,
    uuid varchar(255) NOT NULL COMMENT '业务id',
    account varchar(255) COMMENT '账号',
    password varchar(255) COMMENT '密码',
    lastLoginTime timestamp(6) COMMENT '最后登录时间',
    roleId varchar(50) COMMENT '角色id',
    PRIMARY KEY (id)
) COMMENT='用户表';

CREATE TABLE AdminUserInfo (
    id bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户id 主键',
    uuid varchar(255) NOT NULL COMMENT '业务id',
    name varchar(50) COMMENT '昵称',
    sex varchar(4) COMMENT '性别',
    phone varchar(32) COMMENT '联系方式',
    address varchar(255) COMMENT '住址',
    introduction varchar(255) COMMENT '个人简介',
    registerTime timestamp(6) COMMENT '注册时间',
    avatar varchar(255) COMMENT '用户头像',
    PRIMARY KEY (id)
) COMMENT='用户信息表';

CREATE TABLE AdminUserRole (
    id bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色id 主键',
    uuid varchar(255) NOT NULL COMMENT '业务id',
    roleName varchar(50) COMMENT '角色名字',
    routerId longtext(0) COMMENT '路由id',
    roleMark varchar(255) COMMENT '角色描述',
    PRIMARY KEY (id)
) COMMENT='用户角色表';

CREATE TABLE AdminUserRouter (
    id bigint(0) NOT NULL AUTO_INCREMENT COMMENT '路由id 主键',
    uuid varchar(255) NOT NULL COMMENT '业务id',
    routerName varchar(50) COMMENT '路由名字',
    rootId varchar(50) COMMENT '根级id',
    parentId varchar(50) COMMENT '父级id',
    icon varchar(50) COMMENT '路由图标',
    routerFnId varchar(255) COMMENT '功能id',
    routerSrc varchar(255) COMMENT '路由路径',
    pageSrc varchar(255) COMMENT '页面路径',
    PRIMARY KEY (id)
) COMMENT='用户路由表';

CREATE TABLE AdminUserRouterFunction (
    id bigint(0) NOT NULL AUTO_INCREMENT COMMENT '功能id 主键',
    uuid varchar(255) NOT NULL COMMENT '业务id',
    name varchar(50) COMMENT '功能名字',
    PRIMARY KEY (id)
) COMMENT='用户路由下功能表';

set global log_bin_trust_function_creators=TRUE;

CREATE FUNCTION `AdminUserRouter_GetChildNodesRecursion`(rootId varchar(100))
RETURNS varchar(2000)  
BEGIN   
DECLARE str varchar(2000);  
DECLARE cid varchar(100);   
SET str = '$';   
SET cid = rootId;   
WHILE cid is not null DO   
    SET str = concat(str, ',', cid);   
    SELECT group_concat(uuid) INTO cid FROM AdminUserRouter where FIND_IN_SET(parentId,cid);   
END WHILE;   
RETURN str;   
END