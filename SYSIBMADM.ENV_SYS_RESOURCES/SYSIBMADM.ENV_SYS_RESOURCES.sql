SELECT  * 
         
FROM  SYSIBMADM.ENV_SYS_RESOURCES tblSR

WHERE  tblSR.NAME IN
(
           'CPU_TOTAL'
         , 'CPU_SPEED'           
         , 'MEMORT_TOTAL'
         , 'MEMORY_FREE'
         , 'CPU_USAGE_TOTAL'

)


