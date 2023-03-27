/* plan-stats.sql */

-- NOTE this script will not work in SQL Developer WEB!

column ename format a20
column rname format a20

prompt ========================== plan-stats.sql ==========================================
prompt Running a SQL statement with additional statistics, 
prompt  and then showing the plan for that statement
prompt  NOTE: hint added to gather the run time statistics
prompt Press Enter to continue:
accept next1

set echo on
select /*+ gather_plan_statistics */
       e.ename,r.rname
from   employees  e
join   roles       r on (r.id = e.role_id)
join   departments d on (d.id = e.dept_id)
where  e.staffno <= 10
and    d.dname in ('Department Name 1','Department Name 2');

set echo off
prompt Showing explain plan with additional statistics
prompt Press Enter to continue:
accept next1

set linesize 210 tab off pagesize 1000 trims on
column plan_table_output format a200

set echo on
SELECT *
FROM table(DBMS_XPLAN.DISPLAY_CURSOR(FORMAT=>'ALLSTATS LAST +cost +bytes +OUTLINE'));
set echo off
