package com.osrs.education

import com.osrs.User
import com.osrs.Village


class NoOfEnrolmentInEdu {
    String name
    String institutionType
    Integer studentEnrolledBoys
    Integer studentEnrolledGirls
    Integer studentAttendingBoys
    Integer studentAttendingGirls
    Integer newEntrantsBoys
    Integer newEntrantsGirls
    Integer studentDiscontinuedStudiesBoys
    Integer studentDiscontinuedStudiesGirls
    Integer reasonOfDiscontinuationEconomic
    Integer reasonOfDiscontinuationNonEconomic
    Integer noOfTeacherMale
    Integer noOfTeacherFemale
    Integer noChildNeverEnrolled
    Integer month    // In which Month the data is entered
    Integer year      //Year in which data is entered
    Village village

    User userCreated
    User userUpdated
    Date dateCreated
    Date lastUpdated

    static constraints = {
     name(nullable: true)
     institutionType(nullable: true)
     studentEnrolledBoys(nullable: true)
     studentEnrolledGirls(nullable: true)
     studentAttendingBoys(nullable: true)
     studentAttendingGirls(nullable: true)
     newEntrantsBoys(nullable: true)
     newEntrantsGirls(nullable: true)
     studentDiscontinuedStudiesBoys(nullable: true)
     studentDiscontinuedStudiesGirls(nullable: true)
     reasonOfDiscontinuationEconomic (nullable: true)
     reasonOfDiscontinuationNonEconomic(nullable: true)
     noOfTeacherMale(nullable: true)
     noOfTeacherFemale (nullable: true)
     noChildNeverEnrolled (nullable: true)
    }
}
