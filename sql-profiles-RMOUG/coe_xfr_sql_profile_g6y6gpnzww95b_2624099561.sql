SPO coe_xfr_sql_profile_g6y6gpnzww95b_2624099561.log;
SET ECHO ON TERM ON LIN 2000 TRIMS ON NUMF 99999999999999999999;
REM
REM $Header: 215187.1 coe_xfr_sql_profile_g6y6gpnzww95b_2624099561.sql 11.4.4.4 2022/03/11 carlos.sierra $
REM
REM Copyright (c) 2000-2012, Oracle Corporation. All rights reserved.
REM
REM AUTHOR
REM   carlos.sierra@oracle.com
REM
REM SCRIPT
REM   coe_xfr_sql_profile_g6y6gpnzww95b_2624099561.sql
REM
REM DESCRIPTION
REM   This script is generated by coe_xfr_sql_profile.sql
REM   It contains the SQL*Plus commands to create a custom
REM   SQL Profile for SQL_ID g6y6gpnzww95b based on plan hash
REM   value 2624099561.
REM   The custom SQL Profile to be created by this script
REM   will affect plans for SQL commands with signature
REM   matching the one for SQL Text below.
REM   Review SQL Text and adjust accordingly.
REM
REM PARAMETERS
REM   None.
REM
REM EXAMPLE
REM   SQL> START coe_xfr_sql_profile_g6y6gpnzww95b_2624099561.sql;
REM
REM NOTES
REM   1. Should be run as SYSTEM or SYSDBA.
REM   2. User must have CREATE ANY SQL PROFILE privilege.
REM   3. SOURCE and TARGET systems can be the same or similar.
REM   4. To drop this custom SQL Profile after it has been created:
REM      EXEC DBMS_SQLTUNE.DROP_SQL_PROFILE('coe_g6y6gpnzww95b_2624099561');
REM   5. Be aware that using DBMS_SQLTUNE requires a license
REM      for the Oracle Tuning Pack.
REM   6. If you modified a SQL putting Hints in order to produce a desired
REM      Plan, you can remove the artifical Hints from SQL Text pieces below.
REM      By doing so you can create a custom SQL Profile for the original
REM      SQL but with the Plan captured from the modified SQL (with Hints).
REM
WHENEVER SQLERROR EXIT SQL.SQLCODE;
REM
VAR signature NUMBER;
VAR signaturef NUMBER;
REM
DECLARE
sql_txt CLOB;
h       SYS.SQLPROF_ATTR;
PROCEDURE wa (p_line IN VARCHAR2) IS
BEGIN
DBMS_LOB.WRITEAPPEND(sql_txt, LENGTH(p_line), p_line);
END wa;
BEGIN
DBMS_LOB.CREATETEMPORARY(sql_txt, TRUE);
DBMS_LOB.OPEN(sql_txt, DBMS_LOB.LOB_READWRITE);
-- SQL Text pieces below do not have to be of same length.
-- So if you edit SQL Text (i.e. removing temporary Hints),
-- there is no need to edit or re-align unmodified pieces.
wa(q'[select /* PROFTEST */ * from sales WHERE sale_date >= trunc(sysd]');
wa(q'[ate)]');
DBMS_LOB.CLOSE(sql_txt);
h := SYS.SQLPROF_ATTR(
q'[BEGIN_OUTLINE_DATA]',
q'[IGNORE_OPTIM_EMBEDDED_HINTS]',
q'[OPTIMIZER_FEATURES_ENABLE('19.1.0')]',
q'[DB_VERSION('19.1.0')]',
q'[ALL_ROWS]',
q'[OUTLINE_LEAF(@"SEL$1")]',
q'[INDEX_RS_ASC(@"SEL$1" "SALES"@"SEL$1" ("SALES"."SALE_DATE"))]',
q'[BATCH_TABLE_ACCESS_BY_ROWID(@"SEL$1" "SALES"@"SEL$1")]',
q'[END_OUTLINE_DATA]');
:signature := DBMS_SQLTUNE.SQLTEXT_TO_SIGNATURE(sql_txt);
:signaturef := DBMS_SQLTUNE.SQLTEXT_TO_SIGNATURE(sql_txt, TRUE);
DBMS_SQLTUNE.IMPORT_SQL_PROFILE (
sql_text    => sql_txt,
profile     => h,
name        => 'coe_g6y6gpnzww95b_2624099561',
description => 'coe g6y6gpnzww95b 2624099561 '||:signature||' '||:signaturef||'',
category    => 'DEFAULT',
validate    => TRUE,
replace     => TRUE,
force_match => FALSE /* TRUE:FORCE (match even when different literals in SQL). FALSE:EXACT (similar to CURSOR_SHARING) */ );
DBMS_LOB.FREETEMPORARY(sql_txt);
END;
/
WHENEVER SQLERROR CONTINUE
SET ECHO OFF;
PRINT signature
PRINT signaturef
PRO
PRO ... manual custom SQL Profile has been created
PRO
SET TERM ON ECHO OFF LIN 80 TRIMS OFF NUMF "";
SPO OFF;
PRO
PRO COE_XFR_SQL_PROFILE_g6y6gpnzww95b_2624099561 completed
