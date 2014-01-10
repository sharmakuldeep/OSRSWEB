package com.osrs

import org.hsqldb.jdbc.jdbcDataSource

class DatabaseBackupService {

    static transactional = true

    def takeBackup() {
        println("now taking the backup");
       def d
        String command ="C:\\Program Files\\MySQL\\MySQL Server 5.1\\bin\\mysqldump -u root -proot123 prod_osrs -r backup.sql"
        Process p
        try{
            Runtime runtime=Runtime.getRuntime()
            p = runtime.exec(command)
            println("value of process p is "+p)
            int processComplete =p.waitFor()
            println("process complete value "+processComplete)
            if(processComplete==0){
                println("Backup created successfully")
            }
            else{
                println("Could not create the backup")
            }
        }
       catch(Exception e){
            println("some exception occurred while taking backup "+e);
        }
    }
}
