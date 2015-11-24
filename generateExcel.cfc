<cfcomponent>
	<cffunction name="generateExcelFromQuery" access="public" returntype="string">
		<cfargument name="myQuery" type="query" required="yes">

		<cfprocessingdirective suppressWhiteSpace = "Yes">
			<cfset qryData = arguments.myQuery>
			<cfset tabChar = chr(9)>
        		<cfset newLine = chr(13) & chr(10)>
        
        		<cfheader name="Content-Disposition" value="filename=excelFromQuery-#dateformat(now(), 'mmddyy')#.xls">
        		<cfcontent type="application/msexcel">
        
        		<cfloop list="#qryData.columnList#" index="i">
        	    	<cfoutput>#i##tabChar#</cfoutput>
        		</cfloop>
        		<cfoutput>#newLine#</cfoutput>
        
        		<cfloop query="qryData">
        	    		<cfloop list="#qryData.columnList#" index="i">
        	        		<cfset curColVal = Evaluate("qryData." & Trim(i))>
        	       			<cfoutput>#replace(curColVal, newLine, " ", "all")#</cfoutput>
        	        		<cfoutput>#tabChar#</cfoutput>        
         	   		</cfloop>
         	   	<cfoutput>#newLine#</cfoutput>
       			</cfloop>
		</cfprocessingdirective>
	</cffunction>
</cfcomponent>