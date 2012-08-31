<datasources>

   <local-tx-datasource>
      <jndi-name>${data.dsname}</jndi-name>
        <connection-url>jdbc:sqlserver://${data.host};DatabaseName=${data.dbname}</connection-url>
        <driver-class>com.microsoft.sqlserver.jdbc.SQLServerDriver</driver-class>
        <user-name>${data.user}</user-name>
        <password>${data.pwd}</password>
        <min-pool-size>5</min-pool-size>
        <max-pool-size>50</max-pool-size>
         <metadata>
            <type-mapping>MS SQLSERVER</type-mapping>
        </metadata>
        <check-valid-connection-sql>select 1</check-valid-connection-sql>
   </local-tx-datasource>


</datasources>