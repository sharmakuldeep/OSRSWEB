package com.osrs.education


import com.osrs.User
import com.osrs.Village

class NoOfEnrolmentInOtherTechCourse {

    String name
    Integer noOfStudentEnrolledInBeBtechBoys
    Integer noOfStudentEnrolledInBeBtechGirls
    Integer noOfStudentEnrolledInMbbsBoys
    Integer noOfStudentEnrolledInMbbsGirls
    Integer noOfStudentEnrolledInBvscBoys
    Integer noOfStudentEnrolledInBvscGirls
    Integer noOfStudentEnrolledInAgriMscBoys
    Integer noOfStudentEnrolledInAgriMscGirls
    Integer noOfStudentEnrolledInPolytechDeplomaBoys
    Integer noOfStudentEnrolledInPolytechDeplomaGirls
    Integer noOfStudentEnrolledInITIBoys
    Integer noOfStudentEnrolledInITIGirls
    Integer noOfStudentEnrolledInVocationalCourseBoys
    Integer noOfStudentEnrolledInVocationalCourseGirls
    User userCreated
    User userUpdated
    Date dateCreated
    Date lastUpdated
    Village village
    Integer month
    Integer year
    static belongsTo = Education

    static constraints = {

     name(nullable: true)
     noOfStudentEnrolledInBeBtechBoys(nullable: true)
     noOfStudentEnrolledInBeBtechGirls(nullable: true)
     noOfStudentEnrolledInMbbsBoys(nullable: true)
     noOfStudentEnrolledInMbbsGirls(nullable: true)
     noOfStudentEnrolledInBvscBoys(nullable: true)
     noOfStudentEnrolledInBvscGirls(nullable: true)
     noOfStudentEnrolledInAgriMscBoys(nullable: true)
     noOfStudentEnrolledInAgriMscGirls(nullable: true)
     noOfStudentEnrolledInPolytechDeplomaBoys(nullable: true)
     noOfStudentEnrolledInPolytechDeplomaGirls(nullable: true)
     noOfStudentEnrolledInITIBoys(nullable: true)
     noOfStudentEnrolledInITIGirls(nullable: true)
     noOfStudentEnrolledInVocationalCourseBoys(nullable: true)
     noOfStudentEnrolledInVocationalCourseGirls(nullable: true)
    }
}
