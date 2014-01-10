package com.osrs

class GramPanchayat {

     String name
     String code
     String description
     User userCreated
     User userUpdated
     Date dateCreated
     Date lastUpdated
     Block block

     static hasMany = [village:Village]

    static constraints = {
        userCreated(nullable: false)
        userUpdated(nullable: false)
    }
}
