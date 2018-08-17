SELECT 

         tblAppInfo.PRIMARY_AUTH_ID AS "AuthorizationID"

        , sum(tblAppSnap.ROWS_READ) AS "RowsRead"
        
        , sum(tblAppSnap.ROWS_WRITTEN) AS "RowsWritten"
        
FROM   SYSIBMADM.SNAPAPPL tblAppSnap

INNER JOIN SYSIBMADM.SNAPAPPL_INFO tblAppInfo

	on tblAppSnap.AGENT_ID = tblAppInfo.AGENT_ID

GROUP BY
         tblAppInfo.PRIMARY_AUTH_ID
         
ORDER BY
     sum
     	(
     		  tblAppSnap.ROWS_READ
     		+ tblAppSnap.ROWS_WRITTEN
 		) desc