host @chcp 1251

./config.sql

connect &&usr_kais./&&usr_kais_pwd.@&&tnsname.

column start_time new_value file_time noprint
select to_char(SYSDATE,'yyyymmdd_hh24miss') as start_time from dual;

define path_scripts = "xml_unload_armiv27366.sql"
define path_log     = "logs"
define spool_fn     = "&&path_log./&&path_scripts._&&file_time..log" 

spool &&spool_fn.
whenever sqlerror exit rollback;

PROMPT = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
PROMPT = Define complete
PROMPT = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
PROMPT 

connect &&usr_kais./&&usr_kais_pwd.@&&tnsname.

column start_time new_value file_time noprint
select to_char(SYSDATE,'yyyymmdd_hh24miss') as start_time from dual;

set head off
set linesize 500
set pagesize 0
set echo off
set feedback off
set wrap off 

begin 
 execute immediate 'create table tmp_armiv27366_bid (bid varchar2(5), is_processed number(1) default 0, log_records number default 0, start_date date, finish_date date)';
exception when others then
   null;
end;
/

begin
 execute immediate 'create index inx_armiv27366_bid on tmp_armiv27366_bid(bid)';
exception when others then
   null;
end;
/

begin
  execute immediate 'create table tmp_armiv27366_log (bid varchar2(5), contract_id  varchar2(50), version  number, add_agreement_id varchar2(50), record_date  date, file_id NUMBER, is_processed number default 0)';
exception when others then
   null;
end;
/

begin
  execute immediate 'CREATE TABLE tmp_armiv27366_file ( file_id NUMBER, file_name VARCHAR2(100), is_processed NUMBER DEFAULT 0);';
exception when others then
   null;
end;
/

begin
  execute immediate 'CREATE SEQUENCE seq_file_id start with 1 increment by 1;';
exception when others then
   null;
end;
/

begin
  execute immediate 'CREATE TRIGGER tr_tmp_file
					   before insert on tmp_armiv27366_file for each row
					begin
					   select seq_file_id.nextval into :new.file_id from dual;
					end;';
exception when others then
   null;
end;
/

insert into tmp_armiv27366_bid (bid)
select distinct bid 
  from 
(select column_value bid from table(sys.odcivarchar2list(
'30009','30075','30076','40490','40491','40493','40494','40495','40496','40497','V5236','03313','V5237','41498','41527','41528','41529','41530','41531','41539','44028','42027','03314','40010','40048',
'40232','40233','40234','40235','40236','40237','40238','40239','40240','40241','40242','40243','40244','40245','40246','40247','40248','40249','40250','40251','40252','40253','40254','40255','40256',
'40257','40258','40259','40260','40261','40262','40263','40264','40265','40266','40267','40268','03315','03637','41509','41532','41533','44034','42033','03316','40011','40269','40270','40271','40272',
'40273','40274','40275','40276','40277','40278','40279','40280','40281','40282','40283','40284','40285','40286','40287','40288','40289','40290','40291','40292','40293','40294','40295','40296','40297',
'40298','40299','40300','03317','03638','30002','30014','30026','30028','30027','30029','30030','30031','30032','30033','30034','30077','30078','30236','30237','30238','30239','30240','30241','30242',
'30243','30244','30245','03245','03623','31341','32020','03246','V7056','V7058','V7059','V7061','V7063','V7064','V7073','V7081','30001','30005','30090','30091','30092','30093','30094','30095','30096',
'30097','30098','30099','30100','30101','30102','30103','30104','30105','30106','30107','30108','30109','30110','30111','30112','30113','30114','30115','30116','30118','30119','30120','30121','30122',
'30123','30124','30125','30127','30128','30129','30130','30131','41510','44035','42034','03318','40005','40049','40050','40051','40052','40053','40054','40064','40065','40301','40302','40303','40304',
'40305','40306','40307','40308','40309','40310','40311','40312','40313','40314','40315','40316','40317','40318','40319','40320','40321','40322','40323','40324','40325','40326','40327','40328','40329',
'40330','40331','40332','40333','40334','40335','40336','40337','40338','40340','03319','03639','41511','41512','41513','41514','41515','41516','41517','44036','42035','03320','40006','40066','40067',
'40068','40356','40357','40358','40359','40360','40361','40362','40363','40364','40365','40366','40367','40368','40369','40370','40371','40372','40373','40374','40375','40376','40377','40378','40379',
'40380','40381','40382','40383','30035','30036','30037','30038','30039','30040','30041','30042','30043','30044','30045','30046','30047','30048','30049','30050','30051','30052','30053','30054','30055',
'30056','30057','30151','3U153','30152','3U154','30155','3U156','30157','30158','3U159','3U160','3U161','3U162','30163','30164','30165','30166','3U167','30168','40485','40487','40489','30321','30322',
'30323','30324','30325','30326','30327','30328','30329','30330','30331','30332','30333','30334','03295','03629','31346','34027','32025','03296','41522','V7001','V7002','V7008','V7012','V7013','V7016',
'V7018','V7021','V7023','V7030','V7034','V7043','V7052','90017','90018','90019','90020','90021','90022','90023','90024','90025','90026','90027','90028','90029','90030','90031','90032','90033','90034',
'90035','90036','90037','90038','90039','90040','90041','90042','90043','90044','90045','90046','90047','90048','90049','90050','90051','90052','90053','90054','90055','90056','90057','90058','90059',
'90060','03305','91061','91062','91063','91064','91065','91066','91067','91068','44040','92002','03306','40003','40042','40121','40122','40123','40124','40125','40126','40127','40128','40129','40130',
'40131','40132','40133','40134','40135','40136','40137','40138','40139','40140','40141','40142','40143','40144','40145','40146','30132','3U169','3U170','30171','3U172','3U173','3U174','3U175','3U176',
'3U177','3U178','3U179','30180','3U181','3U182','30183','3U184','3U185','30186','30187','3U188','3U189','3U190','30191','30192','3U193','3U194','3U195','3U196','30197','30198','30199','03280','V2326',
'31336','31357','31358','31359','31360','31361','31362','31363','31364','31365','34025','32016','03281','30011','30089','30088','30289','30290','30287','30291','30288','30292','30286','03284','03628',
'31345','32024','03285','40546','40547','40548','40549','30012','30293','30294','30295','30296','30297','30298','30299','30300','30301','30302','30303','30304','30305','30306','30307','30308','30309',
'30310','30311','30312','30313','30314','30315','30316','30317','30318','30319','30320','40094','40095','40096','40097','40098','03301','03632','41499','44029','42028','03302','40002','40014','40041',
'40099','40100','40101','40102','40103','40104','40105','40106','40107','40108','40109','40110','40111','40112','40113','40114','40115','40116','40117','40118','40119','40120','03303','03633','41500',
'44030','42029','03304','90001','90003','90004','90005','90006','90007','90008','90009','90010','90011','90012','90013','90014','90015','90016','40147','40148','40149','40150','40151','40152','40153',
'40154','03307','03634','41501','41502','41503','41504','44031','42030','03308','40004','40155','40156','40157','40158','40159','40160','40161','40162','40163','40164','40165','40166','40167','40168',
'40169','40170','40171','40172','40173','40174','40175','40176','40177','40178','40179','40180','40181','40182','40183','40184','40185','03309','03635','41505','44032','42031','03310','40009','40043',
'40044','40045','40046','40047','40186','40187','40188','40189','40190','40191','40192','40193','40194','40195','40196','40197','40198','40199','40200','40201','40202','40203','40204','40205','40206',
'40207','40208','40209','40210','40211','40213','40214','40215','40216','40217','40218','40219','40220','40221','40222','40223','30133','30134','30135','30136','30137','30138','30140','30142','30144',
'30145','30146','30147','30148','30149','30150','V6144','03297','03630','31335','31347','31348','31349','31350','31351','31352','31353','34024','32015','03298','80001','80003','80004','80005','80006'))
union all
select column_value from table(sys.odcivarchar2list(
'80007','80008','80009','80010','80011','80012','80013','80014','80015','80016','80017','80018','80019','80020','80021','80022','80023','80024','80025','80026','80028','80029','80030','80031','80032',
'80033','80034','80035','80036','80037','80038','80039','80040','80041','80042','80043','80044','80045','80046','80047','80048','80049','80050','80051','80052','80053','80054','80055','80056','80057',
'80058','80059','80060','80061','80062','80063','80064','80065','80066','80067','80068','80069','80070','80071','80072','80073','80074','03299','81076','81078','81079','81080','81081','81126','81127',
'81128','81129','81125','44039','82002','82143','03300','V3018','V0001','V9003','40008','40040','40084','40085','40086','40087','40088','40089','40090','40091','40092','40093','46555','V9006','V9005',
'40384','03321','03640','41518','41520','41521','41523','42036','03322','46550','46551','46552','46553','46554','40007','40016','40017','40018','40019','40020','40021','40022','40023','40024','40025',
'40026','40069','40070','40071','40072','40073','40074','40075','40076','40077','40078','40079','40080','40081','40082','40083','40385','40386','40387','40388','40390','40392','40393','40394','40396',
'40397','40398','40399','40400','40224','40225','40226','40227','40228','40229','40230','40231','03311','03636','41506','41507','41508','44033','42032','03312','03018','40001','40434','40436','40443',
'40472','40486','40488','40492','40435','40437','40438','40439','40440','40441','40442','40444','40445','40446','40447','40448','40449','40450','40451','40452','40453','40454','40455','40456','40457',
'40458','40459','40460','40461','40462','40463','40464','40465','40466','40467','40468','40469','40470','40471','40473','40474','40475','40476','40477','40478','40479','40480','40481','40482','40483',
'40484','35015','35016','35017','35018','35019','85001','85002','85003','85004','40012','40403','40404','40405','40406','40407','40408','40409','40410','40411','40412','40413','40414','40415','40416',
'40417','40418','40419','40420','40421','40422','40423','40424','40425','40426','40427','40428','85005','03325','03642','45001','45002','45003','41525','44038','45004','42038','03326','45005','45006',
'45007','45021','45022','45023','45024','40401','40402','03323','03641','41524','41535','41536','41538','44037','42037','03324','35001','35002','35012','35013','35014','40429','40430','40431','40432',
'42039','41534','81077','31355','31356','41519','41526','30356','30357','40582','30141','41402','41401','90061','90062','90063','90064','30345','30346','30347','30348','30349','30350','30351','30352',
'30353','30354','30355','30358','30359','30360','30361','30362','40585','45008','45009','45010','45011','45012','45013','45014','45015','45016','45017','45018','45019','45020','40339','41537','40212',
'03256','03250','0U290','40584','30013','30058','30059','30060','30061','30200','30201','30202','30203','30204','30205','30206','03195','03619','31337','03196','40593','80080','80081','80082','30363',
'30364','30365','30366','30367','30368','30369','30370','30371','30372','30373','30374','40550','40551','40552','40553','40554','40555','40556','40557','40558','40559','40560','40561','40562','40563',
'40564','40565','40566','40567','40568','40569','40570','40571','40572','40586','40587','40588','40573','40574','40575','40576','40577','40578','40579','40580','40581','40589','40590','80075','80076',
'80079','03247','03248','03249','03251','03252','03253','03254','03255','03257','0U286','0U287','0U288','0U289','0U291','0U292','0U293','0U294','40583','40389','40391','40395','0U197','0U198','0U199',
'0U200','0U201','0U202','0U203','0U204','0U205','0U206','0U207','30388','30389','32032','32031','32030','40595','40594','40601','30425','30426','30432','40609','40650','40626','40627','40631','40651',
'30471','35021','35028','40636','40637','40638','35022','40639','40640','42042','42043','45026','45033','40611','30437','40635','30460','35041','40592','40675','40672','40674','40677','40673','40676',
'40678','42044','42045','42046','42047','40649','30441','30449','30442','30450','30440','30448','30445','30447','30444','30446','30443','40648','40695','40697','40698','40702','40686','40687','40688',
'40689','40685','30423','40597','45044','40598','40599','40600','32028','32029','42040','42041','30422','42054','45034','30390','30474','45057','45058','30419','40659','40680','40684','40683','40682',
'40681','40679','40643','40641','40642','40644','40645','99998','30418','15047','32027','32035','32037','42048','42050','42052','32036','32038','42049','42051','42053','40606','40607','30430','40660',
'40608','45025','40700','30392','30391','30400','30402','30398','30393','30394','30396','30401','30397','30395','30403','30399','30404','30462','30461','40628','40629','40630','45035','45036','45037',
'45039','45041','45042','45043','40605','40613','30459','35040','35039','40699','45053','45054','35043','45055','45056','30414','40619','40620','40621','40622','40623','40624','40625','45045','45046',
'45048','45050','40615','40616','40617','40618','41540','40612','10668','30408','30407','40694','30472','30466','35037','30458','30455','40652','35035','35034','35036','30453','35038','30456','30454',
'30451','40654','40655','30452','40653','30463','30464','30465','40668','40662','40664','40665','40663','40666','40667','40661','40704','40703','40705','45051','40656','40696','35042','40671','40669',
'40670','40646','40647','45060','40632','40633','40634','32026','30409','30410','31367','40591','45030','45031','45027','45028','45029','40658','40657','40692','40690','40691','30405','30406','40693',
'45032','99127','99131','99134','99135','99137','99157','99161','99109','99090','99094','99107','99117','99121','99123','99124','99140','99143','99144','99158','99006','99010','30416','99022','99046',
'99111','99147','99024','99034','99038','99040','99041','99044','99051','99054','99055','99059','99062','99063','99076','99077','99080','99056','99026','99066','99047','45038','40596','30417','40610',
'45052','30420','39103','30427','40602','40603','40604','40614','40701','30412','30413','30411','45059')))
where bid not in (select bid from tmp_armiv27366_bid);
 
CREATE OR REPLACE PACKAGE pkg_gather_contracts AS


  TYPE t_parallel_row IS RECORD(
    log_records  NUMBER,
    log_bids     NUMBER,
    begin_time   date,
    end_time     date);

  TYPE t_parallel_tab IS TABLE OF t_parallel_row;


  TYPE t_parallel_bid_ref_cursor IS REF CURSOR RETURN tmp_armiv27366_bid%ROWTYPE;


  FUNCTION run(p_cursor IN t_parallel_bid_ref_cursor)
    RETURN t_parallel_tab
    PIPELINED
    PARALLEL_ENABLE(PARTITION p_cursor BY HASH(bid));

  PROCEDURE buildFile;
  
END pkg_gather_contracts;
/


CREATE OR REPLACE PACKAGE BODY pkg_gather_contracts AS
  FUNCTION run(p_cursor IN t_parallel_bid_ref_cursor)
    RETURN t_parallel_tab
    PIPELINED
    PARALLEL_ENABLE(PARTITION p_cursor BY HASH(bid)) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
  
    l_bid        tmp_armiv27366_bid%ROWTYPE;
    l_row        t_parallel_row;
    v_rows       number;
    
  BEGIN
    l_row.log_records := 0;
    l_row.log_bids    := 0;
    
    l_row.begin_time := SYSDATE;
    LOOP
      FETCH p_cursor
        INTO l_bid;
      EXIT WHEN p_cursor%NOTFOUND;

      if l_bid.is_processed=0 then
        l_row.log_bids := l_row.log_bids + 1;
        l_bid.start_date := sysdate;
        
        INSERT INTO /*+ append */ tmp_armiv27366_log
           (bid, contract_id, version, add_agreement_id, record_date)
            SELECT l_bid.bid,
                   contract_id,
                   version,
                   add_agreement_id,
                   record_date
              FROM rsa.contr_log4rsa
             WHERE contract_id LIKE l_bid.bid || '%';
   
        l_bid.log_records := SQL%ROWCOUNT;
        
        UPDATE tmp_armiv27366_bid 
           SET is_processed = 1, 
               log_records = l_bid.log_records,
               start_date = l_bid.start_date,
               finish_date = SYSDATE
         where bid=l_bid.bid;
    
        COMMIT;
        l_row.log_records := l_row.log_records + l_bid.log_records;
      end if;
    END LOOP;
        
    l_row.end_time := SYSDATE;
  
    PIPE ROW(l_row);
  
    RETURN;
  END run;
    
  FUNCTION get_rsa_salt return varchar2 is
  v_source_string varchar2(100);
begin
  --ARMIV-27366 для использования
  --SALT – соль, уникальная строка, которая с наименьшей вероятностью может повториться
  --MD5(microtime() + AAA + RANDOM(1,9999))
  --AAA – код партнёра (85A– ваш код партнера)
  v_source_string:=round((cast((from_tz(systimestamp, 'europe/moscow') at time zone 'GMT') as date) -
               to_date('01.01.1970', 'dd.mm.yyyy')) * (24 * 60 * 60))||
               '85A'||
               dbms_random.value(1,9999);
  return dbms_obfuscation_toolkit.md5(input => utl_i18n.string_to_raw (v_source_string, 'AL32UTF8'));
end;
  
  PROCEDURE buildFile 
  IS
  -- объявляем курсор cur_request:
  CURSOR cur_request 
  IS
  -- Выборка:
  SELECT ROWID as rid FROM tmp_armiv27366_log order by rid;
  -- Коллекция:
  TYPE tableType IS TABLE OF UROWID;
  
  temp_request       tableType;
  -- Переменные:
   v_limit            pls_integer := 20000;
   v_file_name        VARCHAR(100);
   v_file_id          NUMBER;
BEGIN
  -- открываем курсор cur_request:
  OPEN cur_request;
    LOOP 
    FETCH cur_request BULK COLLECT
      INTO temp_request LIMIT v_limit;
     EXIT WHEN temp_request.count = 0;
          
  -- формирование наименовения файла:
  v_file_name := '085A' || '_' || to_char(sysdate, 'yyyymmdd') || '_' || get_rsa_salt();
  
    INSERT INTO tmp_armiv27366_file (file_name) VALUES(v_file_name)
    returning file_id INTO v_file_id;
    
  -- собираем 20.000 записей в сформированные файлы:
  FORALL i IN 1..temp_request.count
    UPDATE tmp_armiv27366_log l
    SET file_id     = v_file_id
    WHERE l.rowid = temp_request(i);
 
    COMMIT;

  END LOOP;
  -- закрываем курсор cur_request:
  CLOSE cur_request;
END;


END pkg_gather_contracts;
/ 


SELECT *
FROM TABLE (pkg_gather_contracts.run(CURSOR(SELECT /*+ parallel(t1, 10) */ * FROM tmp_armiv27366_bid t1 ) ) ) t2;


spool off

PROMPT = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
PROMPT = &&path_scripts. FINISHED
PROMPT = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
PROMPT

disconnect


exit