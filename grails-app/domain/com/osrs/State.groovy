package com.osrs

class State {
    String name
    String code
    String description

    User userCreated
    User userUpdated
    Date dateCreated
    Date lastUpdated
        static hasMany = [district:District]

     static constraints = {
        userCreated(nullable: false)
        userUpdated(nullable: false)
    }
}
