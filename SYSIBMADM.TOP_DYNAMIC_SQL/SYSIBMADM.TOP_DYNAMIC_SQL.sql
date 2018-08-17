SELECT 

       -- ( tblTDS.NUM_EXECUTIONS * tblTDS.AVERAGE_EXECUTION_TIME_S ) AS "weight"

         tblTDS.AVERAGE_EXECUTION_TIME_S AS "AverageExecTimeInSec"
       
       , tblTDS.NUM_EXECUTIONS AS "# of Executions"
     
       , tblTDS.STMT_TEXT AS "SQL"
   
       , tblTDS.STMT_SORTS AS "StmtSorts"
       
       , tblTDS.SORTS_PER_EXECUTION AS "SortsPerExec"      
     
       
FROM   SYSIBMADM.TOP_DYNAMIC_SQL tblTDS


ORDER BY
         ( tblTDS.NUM_EXECUTIONS * tblTDS.AVERAGE_EXECUTION_TIME_S ) DESC
       , tblTDS.AVERAGE_EXECUTION_TIME_S DESC
       , tblTDS.NUM_EXECUTIONS DESC
       
FETCH FIRST 100 ROWS ONLY

;       