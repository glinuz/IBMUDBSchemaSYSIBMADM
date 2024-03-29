/*
 * 1a) PD_GET_DIAG_HIST table function - Return records from a given facility
 https://www.ibm.com/support/knowledgecenter/en/SSEPGG_9.5.0/com.ibm.db2.luw.sql.rtn.doc/doc/r0052903.html
 
*/

WITH cteESR
 (
    hostname
 )
 AS
 (
    SELECT 
            MAX
            (
                DECODE
                (
                      NAME
                    , 'HOST_NAME'
                    , VALUE
                )
            ) AS "hostname"

    
    FROM   SYSIBMADM.ENV_SYS_RESOURCES tblESR
    
    WHERE  tblESR.NAME IN
            (
               'HOST_NAME'
            )
            
 
 )

, cteTableReorg
as
(
	SELECT *
	
	FROM   SYSIBMADM.SNAPTAB_REORG tblR

)

SELECT 
		  cteTR.TABSCHEMA 		AS "schema"
		, cteTR.TABNAME   		AS "table"
		, cteTR.PAGE_REORGS		AS "pageReOrgs"
		, cteTR.REORG_TYPE      AS "type"
		, cteTR.REORG_STATUS    AS "status"
		, cteTR.REORG_START     AS "tsStart"
		, cteTR.REORG_END       AS "tsEnd"
		, cteTR.REORG_INDEX_ID  AS "ind_id"
		, cteTR.REORG_TBSPC_ID  AS "tsID"
		
		--, cteTR.*
		

FROM cteTableReorg cteTR

CROSS JOIN cteESR

CROSS JOIN sysibmadm.env_inst_info tblEII
        
FETCH FIRST 100 ROWS ONLY