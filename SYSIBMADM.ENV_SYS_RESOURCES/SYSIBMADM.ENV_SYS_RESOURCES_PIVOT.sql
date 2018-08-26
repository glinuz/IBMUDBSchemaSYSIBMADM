/*
 * 1a) ENV_SYS_RESOURCES administrative view - Return system information
 * 	   https://www.ibm.com/support/knowledgecenter/SSEPGG_9.5.0/com.ibm.db2.luw.sql.rtn.doc/doc/r0052815.html
 * 
 */
SELECT

 	 	  MAX
 	 	  (
 	 	  	DECODE
 	 	  		(
 	 	  			  NAME
 	 	  			, 'HOST_NAME'
 	 	  			, VALUE
 	  			)
  			) AS "HOST"
 	 	  
 		, MAX
 			(
 				DECODE
 				(
 					  NAME
 					, 'OS_NAME'
 					, VALUE
				)
			) AS "OS"
 		
 	 	, MAX
 	 		(
 	 			DECODE
 	 			(
 	 				  NAME
 	 				, 'OS_VERSION'
 	 				, VALUE
 				)
			) AS "OSVersion"
 	 	
 	 	, MAX
 	 		(
 	 			DECODE
 	 			(
 	 				  NAME
 	 				, 'OS_RELEASE'
 	 				, VALUE
 				)
			) AS "OSRelease"
 	 	
 	 	, MAX
 	 		(
 	 			DECODE
 	 			(
 	 				  NAME
 	 				, 'OS_LEVEL'
 	 				, VALUE
 				)
			) AS "OSLevel"
 	 	
 	 	, MAX
 	 		(
 	 			DECODE
 	 			(
 	 				  NAME
 	 				, 'CPU_TOTAL'
 	 				, VALUE
 				)
			) AS "CPUTotal"
 	 	
 	 	, MAX
 	 		(
 	 			DECODE
 	 			(
 	 				  NAME
 	 				, 'CPU_ONLINE'
 	 				, VALUE
 				)
			) AS "CPUOnline"
 	 	
 	 	, MAX(
 	 			DECODE
 	 			(
 	 				  NAME
 	 				, 'CPU_SPEED'
 	 				, VALUE
 	 				)
 				) 
			AS "CPUSpeed"
 	 	
 	 	, MAX(
 	 			DECODE
 	 			(
 	 				  NAME
 	 				, 'CPU_CORES_PER_SOCKET'
 	 				, VALUE
 				)
 			 ) 
 			 AS "CPUCoresPerSocket"
 	 	
 	 	, ROUND
 	 	  (
 	 			(
 	 				MAX
 	 				(
 	 					DECODE
 	 					(NAME, 'MEMORY_TOTAL', VALUE)
 					)
 	 				/ 1024
				) 	 				
 	          , 2
          ) AS "MemoryTotalGB"
          
 	 	, ROUND
 	 	  (
 	 			(
 	 				MAX
 	 				(
 	 					DECODE(NAME, 'MEMORY_FREE', VALUE)
 					)
 	 				/ 1024
				) 	 				
 	          , 2
          ) AS "MemoryFreeGB"
          
 	 	, (
 				MAX
 				(
 					DECODE(NAME, 'CPU_USAGE_TOTAL', VALUE)
				)
		  ) 	 				
 	   	 	AS "CPUUsage%"
 	   	 	
FROM   SYSIBMADM.ENV_SYS_RESOURCES tblESR 

