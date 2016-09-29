--
--***************************************************
--* Copyright (c) 2001-2007 ZE Powergroup Inc. 		*
--* Created by: Stacey Nguyen                  		*
--* Created: Jun 08, 2004                      		*
--* History:										*
--*	Aug 22, 2011 Sandeep Kumar            			*
--* May 07, 2013 Michael Yi: Liquibase & Partition  *
--***************************************************
--
-- 
-- 1) Please fill in the required information below:
--------------------------------------------------
DEFINE DATABASE_NAME = 'ORCL'; --SID
DEFINE DBA_USR = 'system';
DEFINE DBA_PWD = 'manager'; -- SYSTEM PASSWORD
DEFINE SYS_USR = 'sys';
DEFINE SYS_PWD = 'change_on_install'; --SYS PASSWORD
DEFINE TEMPORARY_TABLESPACE = 'TEMP';
DEFINE SQL_PATH = '/tmp/database_creation';

DEFINE ZE_DATA_USR = 'ZE_DATA';
DEFINE ZE_VIEW_USR = 'ZE_VIEW';
DEFINE ZE_UTL_USR = 'ZE_UTL';
DEFINE ZE_METADATA_USR = 'ZE_METADATA';
DEFINE ZE_SECURITY_V3_USR = 'ZE_SECURITY_V3';
DEFINE ZE_CURVE_USR = 'ZE_CURVE';
DEFINE ZE_DASHBOARD_USR = 'ZE_DASHBOARD';
DEFINE ZE_DV_USR = 'ZE_DV';
DEFINE ZE_JOB_USR = 'ZE_JOB';
DEFINE ZE_LOGGING_USR = 'ZE_LOGGING';
DEFINE ZE_UPDATE_USR = 'ZE_UPDATE';
DEFINE ZE_DM_USR = 'ZE_DM';

--THIS SECTION BELOW IS FOR THE SCHEMA PASSWORDS THEY WANT TO USE PER SCHEMA
DEFINE ZE_DATA_PWD = 'changeme';
DEFINE ZE_VIEW_PWD = 'changeme';
DEFINE ZE_UTL_PWD = 'changeme';
DEFINE ZE_METADATA_PWD = 'changeme';
DEFINE ZE_SECURITY_V3_PWD = 'changeme';
DEFINE ZE_CURVE_PWD = 'changeme';
DEFINE ZE_DASHBOARD_PWD = 'changeme';
DEFINE ZE_DV_PWD = 'changeme';
DEFINE ZE_JOB_PWD = 'changeme';
DEFINE ZE_LOGGING_PWD = 'changeme';
DEFINE ZE_UPDATE_PWD = 'changeme';
DEFINE ZE_DM_PWD = 'changeme';

SET SQLBLANKLINES ON;

ALTER SESSION SET NLS_DATE_FORMAT = 'yyyyMMdd_hh24mi';

CONNECT &DBA_USR/&DBA_PWD;
@&SQL_PATH/create_users_base.sql;

--***************************************************************
-- Following required for Liquibase installation		*
--***************************************************************
CONNECT &DBA_USR/&DBA_PWD;

@&SQL_PATH/create_liquibase_users.sql;

DISCONNECT;
spool off;
 
quit;
