package com.osrs

class UserProfile {

    static belongsTo = User
    String profileName
    String firstName
    String middleName
    String lastName
    String address
    String street
    String city
    String state
    String postalCode
    String country
    String homePhone
    String mobilePhone
    String workPhone
    Date lastUpdated

    static constraints = {
        profileName ( nullable: true, maxSize: 64 )
        firstName ( nullable: true, maxSize: 64 )
        middleName ( nullable: true, maxSize: 64 )
        lastName ( nullable: true, maxSize: 64 )
        address ( nullable: true, maxSize: 256 )
        street ( nullable:true, maxSize: 64 )
        city ( nullable: true, maxSize: 64 )
        state ( nullable: true, maxSize: 64 )
        postalCode ( nullable: true, maxSize: 40 )
        country ( nullable: true, maxSize: 64 )
        homePhone ( nullable: true, maxSize: 10, minSize: 10 )
        mobilePhone ( nullable: true, maxSize: 10, minSize: 10 )
        workPhone ( nullable: true, maxSize: 10, minSize: 10 )

    }
}
