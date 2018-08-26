/*
 * DBPATHS administrative view - Retrieve database paths
 * https://www.ibm.com/support/knowledgecenter/en/SSEPGG_9.5.0/com.ibm.db2.luw.sql.rtn.doc/doc/r0022037.html
 * 
 * http://www.dbatodba.com/db2/db2-udb-v9/how-to-discover-all-database-paths/
*/

/*
 * 
	 The TYPE column values are:
	
		TBSP_DEVICE - Raw device for a database managed space (DMS) table space.
		TBSP_CONTAINER - File container for a DMS table space.
		TBSP_DIRECTORY - Directory for a system managed space (SMS) table space.
		LOGPATH - Primary log path.
		LOGPATH_DEVICE - Raw device for primary log path.
		MIRRORLOGPATH - Database configuration mirror log path.
		DB_STORAGE_PATH - Automatic storage path.
		DBPATH - Database directory path.
		LOCAL_DB_DIRECTORY - Path to the local database directory.
 */
SELECT 

	    tblDP.PATH
	    
	  , tblDP.TYPE
	  
	  , tblDP.DBPARTITIONNUM
	  
	--  , tblDP.*
	    
FROM SYSIBMADM.DBPATHS tblDP

ORDER BY
	     tblDP.PATH
	  ,  tblDP.TYPE
