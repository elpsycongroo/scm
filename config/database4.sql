/*===================== 库存表 ============================================*/  
/*==

  stock_id  varchar(40) not null       库存编号 , 主键  
  sh_id      varchar(10),              所在仓库,     外键 ( 参照 SOTRE_HOUSE 表 )      
  goods_id    varchar(36),             商品编号,     外键 ( 参照 goods 表 )      
  stock_firstdate   date,               此种商品第一次入库时间    
  stock_lastdate    date,               此种商品最后一次出库时间,为NULL 时,此种商品从来没有卖过   
  stock_amount         int,              所存数量   
  stock_price          decimal(12,2),    加权价 ,加权价简单可理解为平均价， 分为一次平均加权和移动平均加权。计算如下：一次平均加权为月底一次计算库存的平均采购成本： 公式=（月初成本+本月实际入库成本）/（月初数量+本月入库数量），移动平均加权为每次入库时系统都自动计算加权平均成本。公式=（本次入库前的库存成本+ 本次入库实际成本）/ (入库前数量+本次入库数量）即一次加权成本是每月计算一次， 而移动加权成本是每次入库都计算一次的。  
==*/
create table stock  
(    
  stock_id   varchar(40) not null, 
  sh_id      varchar(10),     
  goods_id    varchar(36),     
  stock_firstdate   date, 
  stock_lastdate    date, 
  stock_amount         int, 
  stock_price          decimal(12,2),
   primary key (stock_id)
);
select * from stock;

drop table if exists sys_param;
/*====================================系统参数表==============================*/
/*==============================================================*/
/* Table: sys_param                                             */
/*==============================================================*/
/*
create table sys_param
(
   sys_param_id         bigint  auto_increment,
   sys_param_field      varchar(50),
   sys_param_value      varchar(50),
   sys_param_text       varchar(50),
   sys_param_type       varchar(2),
   primary key (sys_param_id)
);
*/
create table sys_param
(
   sys_param_id         bigint  auto_increment,
   sys_param_field      varchar(50),
   sys_param_value      varchar(500),
   sys_param_text       varchar(50),
   sys_param_type       varchar(2),   
   primary key (sys_param_id)
);
insert into sys_param(sys_param_field,sys_param_value,sys_param_type) values('shId','select s.sh_id as sys_param_value,s.sh_name as sys_param_text from store_house s','1');


insert into sys_param(sys_param_field,sys_param_value,sys_param_text) values('supType','1','一级供应商');
insert into sys_param(sys_param_field,sys_param_value,sys_param_text) values('supType','2','二级供应商');
insert into sys_param(sys_param_field,sys_param_value,sys_param_text) values('supType','3','普通供应商');
insert into sys_param(sys_param_field,sys_param_value,sys_param_text) values('goodsColor','1','红色');
insert into sys_param(sys_param_field,sys_param_value,sys_param_text) values('goodsColor','2','绿色');
insert into sys_param(sys_param_field,sys_param_value,sys_param_text) values('goodsColor','3','蓝色');
select * from sys_param;
