package com.osrs.education

import com.osrs.Village
import com.osrs.User


class NoOfEnrolmentInCollege {
    String name
    Integer noOfStudentEnrolledBoys
    Integer noOfStudentEnrolledGirls
    Integer noOfStudentAttendingBoys
    Integer noOfStudentAttendingGirls
    Integer noOfNewEntrantsEntryBoys
    Integer noOfNewEntrantsEntryGirls
    Integer noOfStudentDiscontinuedStudiesBoys
    Integer noOfStudentDiscontinuedStudiesGirls
    Integer reasonOfDiscontinuationEconomic
    Integer reasonOfDiscontinuationNonEconomic
    Integer noOfStudentsEnrolledInUniversityBoys
    Integer noOfStudentsEnrolledInUniversityGirls
    Village village
    Integer month    // In which Month the data is entered
    Integer year      //Year in which data is entered
    static belongsTo = Education
    User userCreated
    User userUpdated
    Date dateCreated
    Date lastUpdated


    static constraints = {
         name(nullable: true)
         noOfStudentEnrolledBoys(nullable: true)
         noOfStudentEnrolledGirls(nullable: true)
         noOfStudentAttendingBoys(nullable: true)
         noOfStudentAttendingGirls(nullable: true)
         noOfNewEntrantsEntryBoys(nullable: true)
         noOfNewEntrantsEntryGirls(nullable: true)
         noOfStudentDiscontinuedStudiesBoys(nullable: true)
         noOfStudentDiscontinuedStudiesGirls(nullable: true)
         reasonOfDiscontinuationEconomic(nullable: true)
         reasonOfDiscontinuationNonEconomic(nullable: true)
         noOfStudentsEnrolledInUniversityBoys(nullable: true)
         noOfStudentsEnrolledInUniversityGirls(nullable: true)
    }
}
