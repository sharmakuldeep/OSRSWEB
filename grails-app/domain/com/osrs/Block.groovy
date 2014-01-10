package com.osrs

class Block {

    String name
    String code
    String description
    User userCreated
    User userUpdated
    Date dateCreated
    Date lastUpdated
    District district

    static hasMany = [gramPanchayat:GramPanchayat]

     static constraints = {
        userCreated(nullable: false)
        userUpdated(nullable: false)
    }
}