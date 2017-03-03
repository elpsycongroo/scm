/*===================== ���� ============================================*/  
/*==

  stock_id  varchar(40) not null       ����� , ����  
  sh_id      varchar(10),              ���ڲֿ�,     ��� ( ���� SOTRE_HOUSE �� )      
  goods_id    varchar(36),             ��Ʒ���,     ��� ( ���� goods �� )      
  stock_firstdate   date,               ������Ʒ��һ�����ʱ��    
  stock_lastdate    date,               ������Ʒ���һ�γ���ʱ��,ΪNULL ʱ,������Ʒ����û������   
  stock_amount         int,              ��������   
  stock_price          decimal(12,2),    ��Ȩ�� ,��Ȩ�ۼ򵥿����Ϊƽ���ۣ� ��Ϊһ��ƽ����Ȩ���ƶ�ƽ����Ȩ���������£�һ��ƽ����ȨΪ�µ�һ�μ������ƽ���ɹ��ɱ��� ��ʽ=���³��ɱ�+����ʵ�����ɱ���/���³�����+����������������ƶ�ƽ����ȨΪÿ�����ʱϵͳ���Զ������Ȩƽ���ɱ�����ʽ=���������ǰ�Ŀ��ɱ�+ �������ʵ�ʳɱ���/ (���ǰ����+���������������һ�μ�Ȩ�ɱ���ÿ�¼���һ�Σ� ���ƶ���Ȩ�ɱ���ÿ����ⶼ����һ�εġ�  
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
/*====================================ϵͳ������==============================*/
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


insert into sys_param(sys_param_field,sys_param_value,sys_param_text) values('supType','1','һ����Ӧ��');
insert into sys_param(sys_param_field,sys_param_value,sys_param_text) values('supType','2','������Ӧ��');
insert into sys_param(sys_param_field,sys_param_value,sys_param_text) values('supType','3','��ͨ��Ӧ��');
insert into sys_param(sys_param_field,sys_param_value,sys_param_text) values('goodsColor','1','��ɫ');
insert into sys_param(sys_param_field,sys_param_value,sys_param_text) values('goodsColor','2','��ɫ');
insert into sys_param(sys_param_field,sys_param_value,sys_param_text) values('goodsColor','3','��ɫ');
select * from sys_param;
