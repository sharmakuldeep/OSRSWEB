package com.osrs


class FileAssetService {

  static transactional = true
  def springSecurityService


  def setFileAsset(fileInstance,params){
    fileInstance.properties=params

    if(params.ownerGroup=='Public'){
       fileInstance.share=null
    }else if(params.ownerGroup=='Private'){
        fileInstance.share=null
    }else if(params.ownerGroup=='Share'){

    }
    return fileInstance
  }
}
