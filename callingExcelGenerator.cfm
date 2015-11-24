<cfquery name="qryResults" datasource="yourDSN">
	Select *
	From Your_Table
</cfquery>

<cfinvoke component="generateExcel" method="generateExcelFromQuery">
	<cfinvokeargument name="myQuery" value="#qryResults#">
</cfinvoke>