/*
 * 1) SYSIBMADM.ENV_INST_INFO
 * 
 *    a) Get DB2 instance name using SQL
 *       https://stackoverflow.com/questions/45330968/get-db2-instance-name-using-sql
 * 
 *    b) ENV_INST_INFO administrative view - Retrieve information about the current instance
 *       https://www.ibm.com/support/knowledgecenter/en/SSEPGG_9.5.0/com.ibm.db2.luw.sql.rtn.doc/doc/r0022040.html
 */
WITH cteESR
(
	  NAME
	, VALUE
)
AS
(
			select 
					  NAME AS NAME
					, VALUE AS VALUE
			
			FROM   SYSIBMADM.ENV_SYS_RESOURCES tblESR
			
			WHERE tblESR.NAME = 'HOST_NAME'
			
)
SELECT 

		  tblESR.VALUE AS "Host"
		, tblII.INST_NAME AS "instance"
		, tblII.NUM_DBPARTITIONS AS "# of Partitions"
		, tblII.SERVICE_LEVEL AS "serviceLevel"
		, tblII.FIXPACK_NUM AS "fixPack"
		, tblII.NUM_MEMBERS AS "# of Members"	

FROM sysibmadm.env_inst_info tblII

--CROSS JOIN  SYSIBMADM.ENV_SYS_RESOURCES tblESR
--create a derived table
, LATERAL 
	(
		select 
			      NAME AS NAME
				, VALUE AS VALUE
			
		FROM   cteESR
		
    ) tblESR


