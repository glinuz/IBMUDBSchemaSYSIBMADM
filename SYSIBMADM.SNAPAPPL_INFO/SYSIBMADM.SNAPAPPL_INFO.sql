SELECT 

         tblAppInfo.PRIMARY_AUTH_ID
       , tblAppInfo.APPL_NAME         
      -- , tblAppInfo.DB_NAME
       , tblAppInfo.CLIENT_NNAME

       , tblAppSnap.ROWS_READ
       , tblAppSnap.ROWS_WRITTEN       
       
       , tblAppInfo.TPMON_CLIENT_WKSTN
       , tblAppInfo.TPMON_CLIENT_APP
       , tblAppInfo.CLIENT_PLATFORM
       , tblAppInfo.CLIENT_PROTOCOL
       
       , tblAppInfo.IS_SYSTEM_APPL
       

FROM   SYSIBMADM.SNAPAPPL tblAppSnap

INNER JOIN SYSIBMADM.SNAPAPPL_INFO tblAppInfo

	on tblAppSnap.AGENT_ID = tblAppInfo.AGENT_ID

ORDER BY

     (
     	  tblAppSnap.ROWS_READ
     	  
     	+ tblAppSnap.ROWS_WRITTEN
     )	
     desc