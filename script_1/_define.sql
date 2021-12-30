set define on                                                    
set echo off                                                     
set verify off

/*===============================================================================
|         Connection string to the ODB
===============================================================================*/
define tnsname                    = ""

/*===============================================================================
|         Connection string to the RDB
===============================================================================*/
define rpt_tnsname           = ""

/*===============================================================================
|         Connection string to the CDB
===============================================================================*/
define tnsname_arm3	          = ""


/*===============================================================================
|         Catalog which houses the database tablespaces ARM-4 
===============================================================================*/
define kais_web_ora_path_dat      = ""
define kais_web_ora_path_idx      = ""
define kais_web_ora_path_lob      = ""

/*===============================================================================
|         Catalog which houses the database tablespaces ARM-4 TO
===============================================================================*/
define kais_web_i_ora_path_dat      = ""
define kais_web_i_ora_path_idx      = ""
define kais_web_i_ora_path_lob      = ""

/*===============================================================================
|          Catalog which houses tablespaces for the scheme with a copy of the tables ARM-3
|          Temporary integration solution CDB - ODB. 
===============================================================================*/
define kais_copy_ora_path_dat     = ""
define kais_copy_ora_path_idx     = ""
define kais_copy_ora_path_lob     = ""

/*===============================================================================
|          Catalog which houses tablespaces for the scheme with a copy of the tables ARM-4
|          Temporary integration solution CDB - ODB.
===============================================================================*/
define kais_web_j_ora_path_dat    = ""
define kais_web_j_ora_path_idx    = ""
define kais_web_j_ora_path_lob    = ""

/*===============================================================================
|         Catalog which houses tablespaces for the scheme background tasks ARM-4.
===============================================================================*/
define kais_web_ora_path_dat      = ""
define kais_web_ora_path_idx      = ""
define kais_web_ora_path_lob      = ""

/*===============================================================================
|         Catalog which houses tablespaces for the reporting system ODB ARM-4.
===============================================================================*/
define kais_web_sr_ora_path_dat    = ""
define kais_web_sr_ora_path_idx    = ""
define kais_web_sr_ora_path_lob    = ""

/*===============================================================================
|         Catalog which houses tablespaces for the scheme of integration ODB ARM-4.
===============================================================================*/
define kais_web_es_ora_path_dat   = ""
define kais_web_es_ora_path_idx   = ""
define kais_web_es_ora_path_lob   = ""

/*===============================================================================
|Catalog which houses tablespaces for the scheme of integration ODB ARM-4 - RSA.
===============================================================================*/
define kais_web_rsa_ora_path_dat   = ""
define kais_web_rsa_ora_path_idx   = ""
define kais_web_rsa_ora_path_lob   = ""

/*===============================================================================
|Catalog which houses tablespaces for the scheme of integration ODB ARM-4 - FTC.
===============================================================================*/
define kais_web_ftc_ora_path_dat   = ""
define kais_web_ftc_ora_path_idx   = ""
define kais_web_ftc_ora_path_lob   = ""

/*===============================================================================
|         Catalog which houses tablespaces for the reporting system RDB ARM-4.
===============================================================================*/
define rpt_rp_ora_path_dat    = ""
define rpt_rp_ora_path_idx    = ""
define rpt_rp_ora_path_lob    = ""

/*===============================================================================
|             Catalog which houses tablespaces support schemes 
|             Replication GoldenGate ODB. 
===============================================================================*/
define kais_web_b_ora_path_dat    = ""
define kais_web_b_ora_path_idx    = ""
define kais_web_b_ora_path_lob    = ""

/*===============================================================================
|             Catalog which houses tablespaces support schemes 
|             Replication GoldenGate RDB. 
===============================================================================*/
define kais_web_sr_ora_path_dat    = ""
define kais_web_sr_ora_path_idx    = ""
define kais_web_sr_ora_path_lob    = ""

/*===============================================================================
|         Name tablespaces basic schema ARM-4 
===============================================================================*/
define kais_web_tspace_dat        = ""
define kais_web_tspace_idx        = ""
define kais_web_tspace_lob        = ""

/*===============================================================================
|         Name of the database schema tablespaces ARM-4 TO
===============================================================================*/
define kais_web_i_tspace_dat        = ""
define kais_web_i_tspace_idx        = ""
define kais_web_i_tspace_lob        = ""

/*===============================================================================
| Name tablespaces scheme with a copy of the tables ARM-3. 
| Temporary integration solution CDB - ODB.
===============================================================================*/
define kais_copy_tspace_dat       = ""
define kais_copy_tspace_idx       = ""
define kais_copy_tspace_lob       = ""

/*===============================================================================
| Name tablespaces scheme with a copy of the tables ARM-4. 
| Temporary integration solution CDB - ODB. 
===============================================================================*/
define kais_web_j_tspace_dat      = ""
define kais_web_j_tspace_idx      = ""
define kais_web_j_tspace_lob      = ""

/*===============================================================================
|         Name tablespaces scheme background tasks ARM-4. 
===============================================================================*/
define kais_web_b_tspace_dat      = ""
define kais_web_b_tspace_idx      = ""
define kais_web_b_tspace_lob      = ""

/*===============================================================================
|         Name of the reporting system tablespaces ODB ARM-4. 
===============================================================================*/
define kais_web_sr_tspace_dat      = ""
define kais_web_sr_tspace_idx      = ""
define kais_web_sr_tspace_lob      = ""

/*===============================================================================
|         Name tablespaces scheme integration ARM-4.
===============================================================================*/
define kais_web_es_tspace_dat      = ""
define kais_web_es_tspace_idx      = ""
define kais_web_es_tspace_lob      = ""

/*===============================================================================
|         Name tablespaces scheme integration ARM-4 - RSA.
===============================================================================*/
define kais_web_rsa_tspace_dat      = ""
define kais_web_rsa_tspace_idx      = ""
define kais_web_rsa_tspace_lob      = ""

/*===============================================================================
|         Name tablespaces scheme integration ARM-4 - FTC
===============================================================================*/
define kais_web_ftc_tspace_dat      = ""
define kais_web_ftc_tspace_idx      = ""
define kais_web_ftc_tspace_lob      = ""

/*===============================================================================
|         Name of the reporting system tablespaces RDB ARM-4. 
===============================================================================*/
define rpt_rp_tspace_dat      = ""
define rpt_rp_tspace_idx      = ""
define rpt_rp_tspace_lob      = ""

/*===============================================================================
|          Name tablespaces support schemes replication GoldenGate ODB. 
===============================================================================*/
define kais_web_gg_tspace_dat     = ""
define kais_web_gg_tspace_idx     = ""
define kais_web_gg_tspace_lob     = ""

/*===============================================================================
|         Name tablespaces support schemes replication GoldenGate RDB. 
===============================================================================*/
define rpt_gg_tspace_dat     = ""
define rpt_gg_tspace_idx     = ""
define rpt_gg_tspace_lob     = ""

/*===============================================================================
|         Name of the temp-tablespace ODB ARM-4 
===============================================================================*/
define kais_web_tspace_tmp        = ""

/*===============================================================================
|         Name of the temp-tablespace RDB ARM-4 
===============================================================================*/
define rpt_tspace_tmp        = ""


/*===============================================================================
|         login/password of the system user database ODB ARM-4 
===============================================================================*/
define usr_sys                    = ""
define usr_sys_pwd                = ""

/*===============================================================================
|         login/password for that system RDB ARM-4
===============================================================================*/
define rpt_usr_sys           = ""
define rpt_usr_sys_pwd       = ""

/*===============================================================================
|         login/password to the main database schema ARM-4
===============================================================================*/
define usr_kais_web               = ""
define usr_kais_web_pwd           = ""

/*===============================================================================
|         login/password for the database schema ARM-4 TO
===============================================================================*/
define usr_kais_web_i               = ""
define usr_kais_web_i_pwd           = ""

/*===============================================================================
| login/password to the scheme with a copy of the tables ARM-3. 
| Temporary integration solution CDB - ODB.
===============================================================================*/
define usr_kais_copy		  = ""
define usr_kais_copy_pwd	  = ""

/*===============================================================================
| login/password to the scheme with a up_copy of the tables ARM-3. 
| Temporary integration solution ODB - CDB.
===============================================================================*/
define usr_kais_up		  = ""
define usr_kais_up_pwd		  = ""

/*===============================================================================
| login/password to the scheme with a copy of the tables ARM-4. 
| Temporary integration solution CDB - ODB.
===============================================================================*/
define usr_kais_web_j             = ""
define usr_kais_web_j_pwd         = ""

/*===============================================================================
|         login/password to the scheme of background tasks ARM-4
===============================================================================*/
define usr_kais_web_b             = ""
define usr_kais_web_b_pwd         = ""

/*===============================================================================
|         login/password to the scheme of WLS ARM-4
===============================================================================*/
define usr_kais_web_w             = ""
define usr_kais_web_w_pwd         = ""

/*===============================================================================
|         login/password to the system of the reporting ODB ARM-4. 
===============================================================================*/
define usr_kais_web_sr             = ""
define usr_kais_web_sr_pwd         = ""

/*===============================================================================
|         login/password to the scheme of integration ARM-4
===============================================================================*/
define usr_kais_web_es             = ""
define usr_kais_web_es_pwd         = ""

/*===============================================================================
|         login/password to the scheme of integration ARM-4
===============================================================================*/
define usr_kais_web_rsa             = ""
define usr_kais_web_rsa_pwd         = ""

/*===============================================================================
|         login/password to the scheme of integration ARM-4
===============================================================================*/
define usr_kais_web_ftc             = ""
define usr_kais_web_ftc_pwd         = ""

/*===============================================================================
|         login/password to the scheme of XML-generation ARM-4
===============================================================================*/
define usr_kais_web_x             = ""
define usr_kais_web_x_pwd         = ""

/*===============================================================================
|         login/password to the scheme of integration ARM-4
===============================================================================*/
define usr_kais_web_lk             = ""
define usr_kais_web_lk_pwd         = ""

/*===============================================================================
|         login/password to the system of the reporting RDB ARM-4. 
===============================================================================*/
define rpt_web_rp             = ""
define rpt_web_rp_pwd         = ""

/*===============================================================================
|         login/password to support replication scheme GoldenGate ODB. 
===============================================================================*/
define usr_kais_web_gg             = ""
define usr_kais_web_gg_pwd         = ""

/*===============================================================================
|         login/password to support replication scheme GoldenGate RDB.
===============================================================================*/
define rpt_usr_gg             = ""
define rpt_usr_gg_pwd         = ""

/*===============================================================================
|         login/password to the scheme parallel downloads.
===============================================================================*/
define xen_usr                = ""
define xen_usr_pwd            = ""


/*===============================================================================
|         Name of a basic scheme (KAIS) CDB ARM-3 
===============================================================================*/
define usr_kais 		  = ""

/*===============================================================================
|         login/password for the replication scheme (MOBILINK) CDB ARM-3
===============================================================================*/
define usr_mobilink 		  = ""
define usr_mobilink_pwd		  = ""

/*===============================================================================
|         login/password for the transitional uploading scheme (KAIS_T) CDB ARM-3
===============================================================================*/
define usr_kais_t 		  = ""
define usr_kais_t_pwd		  = ""

/*===============================================================================
|         login/password for the archive transitional scheme (KAIS_AT) CDB ARM-3
===============================================================================*/
define usr_kais_at 		  = ""
define usr_kais_at_pwd		  = ""

/*===============================================================================
|         Name for the matching scheme (KAISMATCHING) CDB ARM-3
===============================================================================*/
define usr_matching 		  = ""

/*===============================================================================
|         login/password for the integration with BK/SKK
===============================================================================*/
define usr_bk 		          = ""
define usr_bk_pwd	          = ""
define usr_skk 	                  = ""
define usr_skk_pwd	          = ""

/*===============================================================================
|         login/password for the integration with FTC
===============================================================================*/
define usr_ftc 		          = ""
define usr_ftc_pwd	          = ""

/*===============================================================================
| Create DBLINK of ODB in the CDB 
| Tnsname_dblink_arm3 - connection string to the AWS-3 in the format of: (DESCRIPTION = ...) 
| Link2mobilink - name DBLINK 
===============================================================================*/
define tnsname_dblink_arm3        = ""
define link2mobilink 		  = ""

/*===============================================================================
| Create DBLINK of ODB in the BK/SKK databases 
===============================================================================*/
define tnsname_dblink_bk          = ""
define linkname_bk 		  = ""
define tnsname_dblink_skk         = ""
define linkname_skk 		  = ""

/*===============================================================================
| Create DBLINK of ODB in the RSA databases 
===============================================================================*/
define tnsname_dblink_rsa         = ""
define linkname_rsa 		  = ""

/*===============================================================================
| Create DBLINK of ODB to the FTC database
===============================================================================*/
define tnsname_dblink_ftc         = ""
define linkname_ftc 		  = ""

/*===============================================================================
| Name of the subscriber database replication ARM-3 
| Temporary integration solution CDB - ODB. 
===============================================================================*/
define subscriber_id 		  = ""


/*===============================================================================
|         Signs of development place ODB
===============================================================================*/
define dev_mode			  = ""

/*===============================================================================
|         Signs of development place RDB
===============================================================================*/
define rpt_dev_mode          = ""

/*===============================================================================
|         Signs of customer site
===============================================================================*/
define is_customer_site          = ""
