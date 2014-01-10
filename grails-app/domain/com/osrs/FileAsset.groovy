package com.osrs

import com.macrobit.grails.plugins.attachmentable.core.Attachmentable

class FileAsset implements Attachmentable {

  static final String attachmentName = "doucment.main"

  static final Long PERM_DOCUMENT_OWNER = 201
  static final Long PERM_DOCUMENT_EDITOR = 212
  static final Long PERM_DOCUMENT_VIEWER = 213
  static final Long PERM_DOCUMENT_SHARE = 213


  String name
  String uri
  String comment
  Date dateCreated
  Date lastUpdated
  String ownerGroup
  User user

  static hasMany = [share:User]

  static constraints = {
    name nullable: false, blank: false
    comment widget: 'textarea', nullable: true
    uri nullable: true
    ownerGroup inList: ['Public', 'Private', 'Share'], nullable: true
  }

}
