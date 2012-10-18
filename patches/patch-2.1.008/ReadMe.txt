PATCH-2.1.008
---------------------------------------------------------------------------

Instruction: 

1. Backup {JBOSS_HOME}/server/lguname folder and production database

2. Open "Patch-2.1.008 DB Script - mssql.sql" file in SQL Management Studio.
   Replace all instances of "lguname_" with the name of the database such as "bayawan_".
   Select all scripts and then execute.

3. Copy contents of "lguname.ear" folder 
   to {JBOSS_HOME}/server/lguname/apps/lguname.ear folder.
   Overwrite existing files

4. Edit "lguname.ear/download.war/modules/updates.xml" file and
   increment the version nos. of rpt2.jar and tc2.jar 

5. Invoke reloadScripts, reloadSchema and flush all reports.

   NOTE: If possible, restart the JBoss Server.


---------------------------------------------------------------------------
Whats New in this Patch !!!!
---------------------------------------------------------------------------

TREASURY/LANDTAX

- Addition of Statement of Revenue simplified format (similar to V1.0)

- Compromise Agreement - support for capturing of payments and credits useful
  when forwarding existing records

- Checking of unposted captured receipts to avoid "gap" in the remittance.

- Addition of Tax Clearance By TDNo facility to simplify issuance of tax clearance.
  Clearance can be issued by searching the property directly 

- Add "LGU" juridical type 

- Add "HYSA" to bank account type



ASSESSOR

- Simplified Provnce FAAS Approval process

- Asynchronous uploading of attachments

- Addition of Transfer of Ownership with Correction transaction. Useful 
  for processing transfer of ownership with changes in the PIN information
  such as lot no, survey no and boundaries.

- Improve remote submission and approval process

- Reactivate remote collection process

- Fix breakage in domain_mssql support 


- Support bidirectional online posting of FAAS annotation transaction

