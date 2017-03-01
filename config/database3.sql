/*=================================进货模块===================================*/

drop table if exists account_records;

drop table if exists buy_order;

drop table if exists buy_order_detail;

drop table if exists return_order;

drop table if exists return_order_deatil;

/*==============================================================*/
/* Table: account_records   
编号		ar_id,
供货商编号	sup_id，
日期		ar_date，
单号(不同类型单号不一样）ad_order_id，
类型(业务类型）ar_bus_type，
应付		ar_payable，
实付		ar_paid，
欠款		ar_arrears，
优惠金额	ar_discount，
经办人		ar_attn，
操作员		ar_operator。
备注		ar_remark
                                    */
/*==============================================================*/
create table account_records
(
   ar_id                varchar(36) not null,
   sup_id               int,
   ar_date              date,
   ar_order_id          varchar(36),
   ar_bus_type          varchar(10),
   ar_payable           decimal(12,2),
   ar_paid              decimal(12,2),
   ar_arrears           decimal(12,2),
   ar_discount          decimal(12,2),
   ar_attn              varchar(20),
   ar_operator          int,
   ar_remark            varchar(100),
   primary key (ar_id)
);

/*==============================================================*/
/* Table: buy_order  
单号     	bo_id，
供货商  	sup_id，
仓库      	sh_id，
收货日期  	bo_date，
应付（实付+欠款+优惠）bo_payable，
实付      	bo_paid，
欠款		bo_Arrears，
原始单号	bo_original_id，
备注		bo_remark，
经办人		bo_attn，
操作员		operator

                                           */
/*==============================================================*/
create table buy_order
(
   bo_id                varchar(36) not null,
   sup_id               int,
   sh_id                varchar(10),
   bo_date              date,
   bo_payable           decimal(12,2),
   bo_paid              decimal(12,2),
   bo_arrears           decimal(12,2),
   bo_original          varchar(20),
   bo_remark            varchar(100),
   bo_attn              varchar(20),
   bo_operator          int,
   primary key (bo_id)
);

/*==============================================================*/
/* Table: buy_order_detail     
编号		bod_id：
商品ID	goods_id，备用
 goods_name           varchar(20),
   goods_type           varchar(10),
   goods_color          varchar(10),
单位		goods_unit，
数量 		bod_amount，
进价		bod_buy_price，
总金额（可无）bod_total_price，
 采购单号	bo_id，
手机串号列表（##分隔）bod_IMEI_list
                                 */
/*==============================================================*/
create table buy_order_detail
(
   bod_id               varchar(36) not null,
   goods_id             varchar(36),
   goods_name           varchar(20),
   goods_unit           varchar(10),
   goods_type           varchar(10),
   goods_color          varchar(10),
   bod_amount           int,
   bod_buy_price        decimal(12,2),
   bod_total_price     decimal(12,2),
   bo_id                varchar(36),
   bod_imei_list        text,
   primary key (bod_id)
);

/*==============================================================*/
/* Table: return_order   
单号		roId，
供货商	sup_id，
仓库		sh_id，
退货日期	ro_date，
应退金额	ro_payable，
实退金额	ro_Paid，
备注，	ro_remark,
经办人	ro_attn，
操作员	ro_operator


                                       */
/*==============================================================*/
create table return_order
(
   ro_id                varchar(36) not null,
   sup_id               int,
   sh_id                varchar(10),
   ro_date              date,
   ro_payable           decimal(12,2),
   ro_paid              decimal(12,2),
   ro_remark            varchar(100),
   ro_attn              varchar(20),
   ro_operator          int,
   primary key (ro_id)
);

/*==============================================================*/
/* Table: return_order_deatil      
编号		rod_id：
商品		goods_id，//备用
 goods_name           varchar(20),
   goods_type           varchar(10),
   goods_color          varchar(10),
单位		goods_unit，
数量		rod_amount，
退货单价	rod_return_price，
总金额（可无）rod_total_price，
 手机串号列表（##分隔）rod_imei_list
                             */
/*==============================================================*/
create table return_order_detail
(
   rod_id              varchar(36) not null,
   goods_id             varchar(36),
   goods_unit           varchar(10),
    goods_name           varchar(20),
   goods_type           varchar(10),
   goods_color          varchar(10),
   rod_amount           int,
   rod_return_price     decimal(12,2),
   rod_total_price      decimal(12,2),
   rod_imei_list        text,
   ro_id                varchar(36),
   primary key (rod_id)
);
