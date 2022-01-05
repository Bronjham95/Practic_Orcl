host @chcp 1251

PROMPT = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
PROMPT = Define variables
PROMPT = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
PROMPT 

/*define tnsname            = "arm3dev"
  define usr_kais           = "KAIS"
  define usr_kais_pwd       = "KAIS"
*/
  define tnsname            = "kaisprod.rgs.ru"
  define usr_kais           = "TOPS"
  define usr_kais_pwd       = "njgc"
connect &&usr_kais./&&usr_kais_pwd.@&&tnsname.

column start_time new_value file_time noprint
select to_char(SYSDATE,'yyyymmdd_hh24miss') as start_time from dual;

define path_scripts = "main_script.sql"
define path_log     = "logs"
define spool_fn     = "&&path_log./&&path_scripts._&&file_time..log" 

spool &&spool_fn.
whenever sqlerror exit rollback;

PROMPT = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
PROMPT = Define complete
PROMPT = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
PROMPT 

set head off
set linesize 500
set pagesize 0
set echo off
set feedback off
set wrap off 

create table tmp_armiv27366_bid (bid varchar2(5), is_processed number(1), log_records number);

create table tmp_armiv27366_log (bid varchar2(5), contract_id  varchar2(50), version  number, add_agreement_id varchar2(50), record_date  date, file_name varchar2(100), is_processed number);

PROMPT = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
PROMPT = Table complete
PROMPT = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
PROMPT 

set serveroutput on

@@script_data_bid.sql
@@script_pkg.sql 

PROMPT ===============================================================================
PROMPT = Working by user &&usr_kais_web. on &&tnsname.
PROMPT ===============================================================================
PROMPT 

SELECT *
FROM TABLE (parallel_ptf_bid.bid_ptf(CURSOR(SELECT /*+ parallel(t1, 10) */ * FROM tmp_armiv27366_bid t1 ) ) ) t2

spool off

PROMPT = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
PROMPT = &&path_scripts. FINISHED
PROMPT = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
PROMPT

select to_char(SYSDATE,'yyyy-mm-dd hh24:mi:ss') as end_time from dual;
disconnect

exit