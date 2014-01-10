package com.osrs.health

import com.osrs.User
import com.osrs.Village



class HealthAndFamilyWelfare {

    String status
    User userCreated
    User userUpdated
    Date dateCreated
    Date lastUpdated
    Village village
    Integer month
    Integer year
    Hospital govHospitals
    Hospital govDispensaries
    Hospital primHealthCenter
    Hospital subCenter
    Hospital commHealthCenter
    Hospital familyWelCenter
    Hospital ayurCenter
    Hospital homeoCells
    Hospital otherCenters

    Integer health39
    Integer health40
    Integer health41
    Integer health42
    Integer health43
    Integer health44
    Integer health45
    Integer health46
    Integer health47
    Integer health48
    Integer health49
    Integer health50
    Integer health51
    Integer health52
    Integer health53
    Integer health54
    Integer health55
    Integer health56
    Integer health57
    Integer health58
    Integer health59
    Integer health60
    Integer health61
    Integer health62
    Integer health63
    Integer health64
    Integer health65
    Integer health66
    Integer health67
    Integer health68
    Integer health69
    Integer health70
    Integer health71

    static constraints = {
     govHospitals(nullable: true)
     govDispensaries(nullable: true)
     primHealthCenter(nullable: true)
     subCenter(nullable: true)
     commHealthCenter(nullable: true)
     familyWelCenter(nullable: true)
     ayurCenter(nullable: true)
     homeoCells(nullable: true)
     otherCenters(nullable: true)
     health39(nullable: true)
     health40(nullable: true)
     health41(nullable: true)
     health42(nullable: true)
     health43(nullable: true)
     health44(nullable: true)
     health45(nullable: true)
     health46(nullable: true)
     health47(nullable: true)
     health48(nullable: true)
     health49(nullable: true)
     health50(nullable: true)
     health51(nullable: true)
     health52(nullable: true)
     health53(nullable: true)
     health54(nullable: true)
     health55(nullable: true)
     health56(nullable: true)
     health57(nullable: true)
     health58(nullable: true)
     health59(nullable: true)
     health60(nullable: true)
     health61(nullable: true)
     health62(nullable: true)
     health63(nullable: true)
     health64(nullable: true)
     health65(nullable: true)
     health66(nullable: true)
     health67(nullable: true)
     health68(nullable: true)
     health69(nullable: true)
     health70(nullable: true)
     health71(nullable: true)
    }
}
