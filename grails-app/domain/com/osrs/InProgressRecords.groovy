package com.osrs

class InProgressRecords {

    Village village
    Integer month
    Integer year
    User userCreated
    User userUpdated
    Date dateCreated
    Date lastUpdated


     static constraints = {
        userCreated(nullable: false)
        userUpdated(nullable: false)
    }

}
