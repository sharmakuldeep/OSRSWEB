package com.osrs

class Village {
    String name
    String code
    ///String gramPanchayt
    String description
    User userCreated
    User userUpdated
    Date dateCreated
    Date lastUpdated
    GramPanchayat gramPanchayat

    static constraints = {
        userCreated(nullable: false)
        userUpdated(nullable: false)
    }
}
