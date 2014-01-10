package com.osrs.health

import com.osrs.User



class Hospital {

    User userCreated
    User userUpdated
    Date dateCreated
    Date lastUpdated
    String type
    Integer noOfDoctors
    Integer noOfNurses
    Integer noOfBeds
    Integer noOfMaleCasesTreated
    Integer noOfFemaleCasesTreated


    static constraints = {
     type(nullable: true)
     noOfDoctors(nullable: true)
     noOfNurses(nullable: true)
     noOfBeds(nullable: true)
     noOfMaleCasesTreated(nullable: true)
     noOfFemaleCasesTreated(nullable: true)
    }
}
