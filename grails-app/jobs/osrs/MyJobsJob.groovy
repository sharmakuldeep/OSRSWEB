package osrs
import com.osrs.DatabaseBackupService


class MyJobsJob {
    def databaseBackupService
    static triggers = {
//        println("back to triggers")
//      simple repeatInterval: 100000, startDelay:30000 // execute job once in 5 seconds
    }
    def group="MyGroup"
    def execute() {
        println "Job run!"
        databaseBackupService.takeBackup()

    }
}
