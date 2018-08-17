SELECT 

        --  CURRENT_SERVER AS "Database" 
          
		  tblTBU.TBSP_NAME AS "TSNAME"
		  
		, tblTBU.TBSP_ID AS "TSID"		  
		  
		, tblTBU.TBSP_TYPE AS "TSType"
		
		, tblTBU.TBSP_CONTENT_TYPE AS "TSContentType"	
		
		, tblTBU.TBSP_TOTAL_SIZE_KB/1024 AS "TotalSizeMB"
		
		, tblTBU.TBSP_USED_SIZE_KB/1024 AS "SizeMB"		
		
		, tblTBU.TBSP_FREE_SIZE_KB/1024 AS "FreeMB"
		
		, tblTBU.TBSP_UTILIZATION_PERCENT AS "%Util"		
		
		, tblTBU.TBSP_INCREASE_SIZE AS "TBIncreaseSize"
		
		, tblTBU.TBSP_INCREASE_SIZE_PERCENT AS "TBIncreaseSize%"
		
		-- , tblTBU.*
		
FROM   SYSIBMADM.TBSP_UTILIZATION tblTBU

ORDER BY

          tblTBU.TBSP_TOTAL_SIZE_KB DESC
         
		, tblTBU.TBSP_USED_SIZE_KB DESC         
         
        , tblTBU.TBSP_NAME ASC