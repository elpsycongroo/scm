/*=================================����ģ��===================================*/

drop table if exists account_records;

drop table if exists buy_order;

drop table if exists buy_order_detail;

drop table if exists return_order;

drop table if exists return_order_deatil;

/*==============================================================*/
/* Table: account_records   
���		ar_id,
�����̱��	sup_id��
����		ar_date��
����(��ͬ���͵��Ų�һ����ad_order_id��
����(ҵ�����ͣ�ar_bus_type��
Ӧ��		ar_payable��
ʵ��		ar_paid��
Ƿ��		ar_arrears��
�Żݽ��	ar_discount��
������		ar_attn��
����Ա		ar_operator��
��ע		ar_remark
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
����     	bo_id��
������  	sup_id��
�ֿ�      	sh_id��
�ջ�����  	bo_date��
Ӧ����ʵ��+Ƿ��+�Żݣ�bo_payable��
ʵ��      	bo_paid��
Ƿ��		bo_Arrears��
ԭʼ����	bo_original_id��
��ע		bo_remark��
������		bo_attn��
����Ա		operator

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
���		bod_id��
��ƷID	goods_id������
 goods_name           varchar(20),
   goods_type           varchar(10),
   goods_color          varchar(10),
��λ		goods_unit��
���� 		bod_amount��
����		bod_buy_price��
�ܽ����ޣ�bod_total_price��
 �ɹ�����	bo_id��
�ֻ������б�##�ָ���bod_IMEI_list
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
����		roId��
������	sup_id��
�ֿ�		sh_id��
�˻�����	ro_date��
Ӧ�˽��	ro_payable��
ʵ�˽��	ro_Paid��
��ע��	ro_remark,
������	ro_attn��
����Ա	ro_operator


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
���		rod_id��
��Ʒ		goods_id��//����
 goods_name           varchar(20),
   goods_type           varchar(10),
   goods_color          varchar(10),
��λ		goods_unit��
����		rod_amount��
�˻�����	rod_return_price��
�ܽ����ޣ�rod_total_price��
 �ֻ������б�##�ָ���rod_imei_list
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
