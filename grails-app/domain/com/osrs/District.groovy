package com.osrs

class District {

    String name
    String code
    String description
    User userCreated
    User userUpdated
    Date dateCreated
    Date lastUpdated
    State state

    static hasMany = [block:Block]

     static constraints = {
        userCreated(nullable: false)
        userUpdated(nullable: false)
    }
}
