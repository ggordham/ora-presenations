connect perflab/perf$lab&con_pdb

set echo on

exec dbms_stats.delete_column_stats(user,'t1','d',no_invalidate=>false,col_stat_type=>'HISTOGRAM');
exec dbms_stats.delete_column_stats(user,'t2','d',no_invalidate=>false,col_stat_type=>'HISTOGRAM');

set echo off
