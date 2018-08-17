/*
	APPLICATIONS administrative view - Retrieve connected database application information 
    https://www.ibm.com/support/knowledgecenter/en/SSEPGG_9.5.0/com.ibm.db2.luw.sql.rtn.doc/doc/r0022011.html
 */
SELECT 
           tblApp.DB_NAME AS "database"
         , tblApp.AUTHID "userID"
         , tblApp.APPL_NAME AS "applicationName"
        
         , tblApp.CLIENT_NNAME AS "clientHost"
         , tblApp.TPMON_CLIENT_WKSTN AS "clientWorkStation"
         , tblApp.TPMON_CLIENT_APP AS "clientApp"         
         , tblApp.CLIENT_PLATFORM AS "clientPlatform"    
         , tblApp.CLIENT_PROTOCOL AS "clientProtocol"
         
         , tblApp.APPL_STATUS AS "applStatus"
         , tblApp.APPL_ID AS "applicationID"
--         , tblApp.*
         
FROM SYSIBMADM.APPLICATIONS tblApp

ORDER by
           tblApp.DB_NAME ASC
         , tblApp.AUTHID ASC           
		 , tblApp.APPL_NAME