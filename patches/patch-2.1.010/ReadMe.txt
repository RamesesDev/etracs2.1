Patch-2.1.010
==================================================================================================

Change Log:

- Add RPAP-RPTA100 Assessor Report
- Normalize liquidation tables
- Normalize remittance tables
- Add  "assessmenttype" fact to bpbilling rule
- Add support for Change Depreciation transaction
- Add facility to post the receipts of the receipts of the subcollector to collector 
- Add status 'DELEGATED' in receipt list


Instruction:

1. Backup JBoss and Production DBs
2. Shutdown JBoss
3. For Mysql 
	3.1. Run SQLYog and open "Patch-2.1.010 DB Script Update.sql" 
     	3.2. Replace all instances of "lguname_" with the name of the LGU e.g. "maribojoc_"
	3.3. Run the scripts.

   For MsSQL
	3.1. Run SQL Management and open "Patch-2.1.010 DB Script Update-mssql.sql" 
     	3.2. Replace all instances of "lguname_" with the name of the LGU e.g. "maribojoc_"
	3.3. Run the scripts.

4. Unzip lguname.zip to temporary folder

5. Copy "lguname" folder from the temporary folder and paste to
   "{JBOSS_HOME}/server" folder. Overwrite existing files.

6. Edit "/lguname.ear/downloads.war/modules/updates.xml" and increment all versions by 1.

7. Run JBoss 

8. After successfully running the server, launch GroovyConsole.

9. Open "Patchv21010.groovy" and set the correct values for app.host and app.context options

10. Run the script by pressing CTRL + R


