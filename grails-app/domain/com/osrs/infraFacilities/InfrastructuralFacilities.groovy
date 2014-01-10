package com.osrs.infraFacilities

import com.osrs.User
import com.osrs.Village


class InfrastructuralFacilities {

    String status
    User userCreated
    User userUpdated
    Date dateCreated
    Date lastUpdated
    Village village

    String isf1
    String isf2
    Integer isf3
    Integer isf4
    Integer isf5
    Integer isf6
    Integer isf7
    Integer isf8
    Integer isf9
    Integer isf10
    Integer isf11
    Integer isf12
    Integer isf13 //TODO not cleared
    Integer isf14
    Integer isf15
    Integer isf16
    Integer isf17 //TODO not cleared
    Integer isf18
    Integer isf19
    Integer isf20
    Integer isf21
    Integer isf22
    Integer isf23
    Integer isf24
    Integer month
    Integer year

    static constraints = {
        isf1(nullable: true)
        isf2(nullable: true)
        isf3(nullable: true)
        isf4(nullable: true)
        isf5(nullable: true)
        isf6(nullable: true)
        isf7(nullable: true)
        isf8(nullable: true)
        isf9(nullable: true)
        isf10(nullable: true)
        isf11(nullable: true)
        isf12(nullable: true)
        isf13(nullable: true)
        isf14(nullable: true)
        isf15(nullable: true)
        isf16(nullable: true)
        isf17(nullable: true)
        isf18(nullable: true)
        isf19(nullable: true)
        isf20(nullable: true)
        isf21(nullable: true)
        isf22(nullable: true)
        isf23(nullable: true)
        isf24(nullable: true)
    }
}
