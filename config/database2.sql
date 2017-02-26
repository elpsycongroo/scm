drop table supplier;
create table supplier
(
   sup_id               int not null,
   sup_name             varchar(20),
   sup_linkman          varchar(20),
   sup_phone            varchar(11),
   sup_address          varchar(100),
   sup_remark           varchar(100),
   sup_pay              decimal(12,2),
   sup_type             varchar(10),
   primary key (sup_id)
);

/* ����ʻ�����, */
insert into account (acc_login,acc_pass) values ('admin','admin');
insert into account (acc_login,acc_pass) values ('admin2','admin2');
/* ��ӹ�Ӧ������, */
insert into supplier (sup_id,sup_name,sup_linkman,sup_phone,sup_address,sup_remark,sup_pay,sup_type) values (1,'ƻ����Ӧ��','С��','12388888887','���ݻ���','��ͨ��Ӧ��',0,1);
insert into supplier (sup_id,sup_name,sup_linkman,sup_phone,sup_address,sup_remark,sup_pay,sup_type) values (2,'���ǹ�Ӧ��','С��','12388888888','��������','��ͨ��Ӧ��',0,1);
insert into supplier (sup_id,sup_name,sup_linkman,sup_phone,sup_address,sup_remark,sup_pay,sup_type) values (3,'��Ϊ��Ӧ��','С��','12388888889','�㶫����','һ����Ӧ��',0,2);
insert into supplier (sup_id,sup_name,sup_linkman,sup_phone,sup_address,sup_remark,sup_pay,sup_type) values (4,'TCL��Ӧ��','С��','12388888666','��������','��ͨ��Ӧ��',0,1);
insert into supplier (sup_id,sup_name,sup_linkman,sup_phone,sup_address,sup_remark,sup_pay,sup_type) values (5,'Nokia��Ӧ��','С��','12388888777','�㶫����','һ����Ӧ��',0,2);
/*�����Ʒ��Ϣ*/
insert into goods (goods_Id,goods_name,goods_unit,goods_color,goods_remark,goods_sel_price,goods_buy_price)
values('1','note4','��','1','red note4',2500.00,2000.00);
insert into goods (goods_Id,goods_name,goods_unit,goods_color,goods_remark,goods_sel_price,goods_buy_price)
values('2','note5','��','5','red note5',3500.00,3000.00);
insert into goods (goods_Id,goods_name,goods_unit,goods_color,goods_remark,goods_sel_price,goods_buy_price)
values('3','note6','��','6','blue note5',4500.00,4000.00);
/*��Ӳֿ���Ϣ*/
INSERT INTO `store_house` (`sh_id`, `sh_name`, `sh_responsible`, `sh_phone`, `sh_address`, `sh_type`, `sh_remark`) VALUES ('1', '���ֿ�', NULL, NULL, '�㶫ʡ������', NULL, NULL);
INSERT INTO `store_house` (`sh_id`, `sh_name`, `sh_responsible`, `sh_phone`, `sh_address`, `sh_type`, `sh_remark`) VALUES ('2', '���ڷֲֿ�', NULL, NULL, '�㶫ʡ������', NULL, NULL);
INSERT INTO `store_house` (`sh_id`, `sh_name`, `sh_responsible`, `sh_phone`, `sh_address`, `sh_type`, `sh_remark`) VALUES ('3', '���ݷֲֿ�1', NULL, NULL, '�㶫ʡ������', NULL, NULL);
INSERT INTO `store_house` (`sh_id`, `sh_name`, `sh_responsible`, `sh_phone`, `sh_address`, `sh_type`, `sh_remark`) VALUES ('4', '��ɽ�ֲֿ�', '��˾��', '13242526235', '�㶫ʡ��ɽ��', NULL, NULL);
INSERT INTO `store_house` (`sh_id`, `sh_name`, `sh_responsible`, `sh_phone`, `sh_address`, `sh_type`, `sh_remark`) VALUES ('5', '����ֲֿ�', 'PV', NULL, '������', NULL, NULL);
