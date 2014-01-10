package com.osrs.education

import com.osrs.User
import com.osrs.Village



class Education {

    String status
    User userCreated
    User userUpdated
    Date dateCreated
    Date lastUpdated
    Village village
    String edu1       //Name of GP
    String edu2       //Name of Village
    Integer edu3      //No. of Adult education center functioning
    Integer edu4      //No. of Adult educated
    Integer edu5      // No of Pre-Primary School
    Integer edu6      // No of Primary School
    Integer edu7      // No of Middle School
    Integer edu8      // No of Secondary School
    Integer edu9      // No of Higher Secondary School
    Integer edu10     // Distance of College with degree course from the village
    Integer edu11     // Distance of College with Master degree course from the village
    Integer edu12     // Distance of College with Industrial Training Institute from the village
    Integer edu13     // Distance of  Non-Formal Education Centre from the village
    Integer edu14     // Distance of Special School For Blind from the village
    Integer edu15     // Distance of Special School for Mentally Retarded from the village
    Integer edu16     // Distance of Vocational Training Centre from the village
    Integer edu17     // Distance of Institution for rehabilitation of disable person  from the village
    Integer month    // In which Month the data is entered
    Integer year      //Year in which data is entered
    static hasMany = [prePrimary:NoOfEnrolmentInEdu,primary:NoOfEnrolmentInEdu,middle:NoOfEnrolmentInEdu,highSchool:NoOfEnrolmentInEdu,seniorSecSchool:NoOfEnrolmentInEdu,college:NoOfEnrolmentInEdu]
    NoOfEnrolmentInCollege noOfEnrolmentInCollege
    NoOfEnrolmentInOtherTechCourse noOfEnrolmentInOtherTechCourse
    NoOfEnrolmentInEdu prePrimaryTotal
    NoOfEnrolmentInEdu primaryTotal
    NoOfEnrolmentInEdu middleTotal
    NoOfEnrolmentInEdu  highSchoolTotal
    NoOfEnrolmentInEdu seniorSecSchoolTotal
    NoOfEnrolmentInEdu collegeTotal

    //static transients = ['prePrimaryTotal','primaryTotal','middleTotal','highSchoolTotal','seniorSecSchoolTotal','collegeTotal']

    static constraints = {
        edu1(nullable: true)
        edu2(nullable: true)
        edu3(nullable: true)
        edu4(nullable: true)
        edu5(nullable: true)
        edu6(nullable: true)
        edu7(nullable: true)
        edu8(nullable: true)
        edu9(nullable: true)
        edu10(nullable: true)
        edu11(nullable: true)
        edu12(nullable: true)
        edu13(nullable: true)
        edu14(nullable: true)
        edu15(nullable: true)
        edu16(nullable: true)
        edu17(nullable: true)
        noOfEnrolmentInCollege(nullable: true)
        noOfEnrolmentInOtherTechCourse(nullable: true)
        prePrimaryTotal(nullable: true)
        primaryTotal(nullable: true)
        middleTotal(nullable: true)
        highSchoolTotal(nullable: true)
        seniorSecSchoolTotal(nullable: true)
        collegeTotal(nullable: true)
    }
}
