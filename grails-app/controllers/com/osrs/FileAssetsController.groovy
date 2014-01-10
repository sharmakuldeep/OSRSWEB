package com.osrs

import org.apache.commons.io.FilenameUtils
import grails.plugins.springsecurity.Secured
import com.macrobit.grails.plugins.attachmentable.util.AttachmentableUtil

@Secured(['ROLE_USER'])
class FileAssetsController {

    def attachmentableService
    def springSecurityService
    def fileAssetService

    def index = { }

    def create={
    def fileAssetInstance = new FileAsset()
    fileAssetInstance.properties = params


     [fileAssetInstance: fileAssetInstance]
    }

    //for data export functionality
    def export= {}

    def save={
        def user = springSecurityService.currentUser
    def fileAssetInstance = new FileAsset(params)

    fileAssetInstance.user = user
    def file = params.doucment.main
    def okContents = ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'csv', 'asc', 'dlis', 'xml', 'jpg', 'jpeg', 'png', 'bmp', 'gif', 'tiff']

    def fileName = file.getOriginalFilename()
    if(!((FileAsset.findByName(params.name))==null)){
      flash.message = "<b>Name Should be Unique</b><br>Document with named <b>${params.name}</b>  already exist : Try Again With different Name"
      render(view: "create", model: [fileAssetInstance: fileAssetInstance])
    }
    else if (!okContents.contains(FilenameUtils.getExtension(fileName))) {
      flash.message = "<b>Upload file must be one of :</b> ${okContents}"
      render(view: "create", model: [fileAssetInstance: fileAssetInstance])
    }
    else if (fileAssetInstance.name == '') {
      flash.message = "File name should not NULL"
      render(view: "create", model: [fileAssetInstance: fileAssetInstance])
    }
    else {
      if (fileAssetInstance.save(flush: true)) {
        attachUploadedFilesTo(fileAssetInstance)

       /* def acl = aclService.updateAcl(user, fileAssetInstance, FileAsset.PERM_DOCUMENT_OWNER)
        fileAssetInstance.addToAcls(acl)*/

        flash.message = "${message(code: 'default.created.message', args: [message(code: 'fileAsset.label', default: 'FileAsset'), fileAssetInstance.id])}"
        redirect(action: "show", params: [fileId: fileAssetInstance.id])
      }
      else {
          log.debug("fileAssetInstance.errors"+fileAssetInstance.errors)
        render(view: "create", model: [fileAssetInstance: fileAssetInstance])
      }
    }
    }

    def show = {
        def fileAssetInstance = FileAsset.get(params.fileId)
        def user=User.findByUsername(springSecurityService.currentUser.username)
        if (!fileAssetInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fileAsset.label', default: 'FileAsset'), params.id])}"
            redirect(action: "list")
        }
        else {
            [fileAssetInstance: fileAssetInstance,cUser:user]
        }
    }
    def viewUploadedFiles={
        def user=User.findByUsername(springSecurityService.currentUser.username)
        def fileList=FileAsset.findAllByUser(user)


        [fileAssetInstanceList:fileList]
    }

    def viewPublicFiles={
        def user=User.findByUsername(springSecurityService.currentUser.username)
        def fileList=FileAsset.findAllByOwnerGroup('Public')

        [fileAssetInstanceList:fileList]
    }

    def viewPrivateFiles={
        def user=User.findByUsername(springSecurityService.currentUser.username)
        def fileList=FileAsset.findAllByUser(user)

        [fileAssetInstanceList:fileList]
    }

    def viewShareFiles={
        def user=User.findByUsername(springSecurityService.currentUser.username)
        def fileList=FileAsset.findAllByOwnerGroup('Share')
        def finalList=FileAsset.findAllByOwnerGroup('Share')
        fileList.each{f->
          if(!f.share.contains(user)){
              finalList.remove(f)
          }
        }
        [fileAssetInstanceList:finalList]
    }

    def edit = {
        def shareTo = User.list()
        shareTo.remove(User.findByUsername(springSecurityService.currentUser.username))
        def fileAssetInstance = FileAsset.get(params.id)
        if (!fileAssetInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fileAsset.label', default: 'FileAsset'), params.id])}"
            redirect(action: "index", controller: 'home')
        }
        else {
            [fileAssetInstance: fileAssetInstance, shareTo: shareTo]
        }
    }

    def update = {
    //log.debug "params ----: ${params}"
    def fileAssetInstance = FileAsset.get(params.id)
    def duplicateFile=0
    def file = params.doucment.main
    def okContents = ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'csv', 'asc', 'las', 'lis', 'dlis', 'xml', 'jpg', 'jpeg', 'png', 'bmp', 'gif', 'tiff']

    def fileName = file.getOriginalFilename()
     fileAssetInstance.attachments.each{a->
       params.version=params.version+1
       if((a.toString())==fileName){duplicateFile=1}
    }
    if (!okContents.contains(FilenameUtils.getExtension(fileName)) && fileName != "") {
      flash.message = "Upload file must be one of: ${okContents}"
      render(view: "edit", model: [fileAssetInstance: fileAssetInstance])
    }
     else if (duplicateFile==1) {
      flash.message = "File with named <b>${fileName}</b>  already exist : Try Again With different File"
      render(view: "edit", model: [fileAssetInstance: fileAssetInstance])
    }
    else if (!((FileAsset.findByName(params.name)) == null) && fileAssetInstance.name!=params.name) {
      flash.message = "<b>Name Should be Unique</b><br>Document with named <b>${params.name}</b>  already exist : Try Again With different Name"
      render(view: "edit", model: [fileAssetInstance: fileAssetInstance])
    }
    else if (params.name == '') {
      flash.message = "File name should not NULL"
      render(view: "edit", model: [fileAssetInstance: fileAssetInstance])
    }

    else {
      if (fileAssetInstance) {
        if (params.version) {
          def version = params.version.toLong()
          if (fileAssetInstance.version > version) {

            fileAssetInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'fileAsset.label', default: 'FileAsset')] as Object[], "Another user has updated this FileAsset while you were editing")
            render(view: "edit", model: [fileAssetInstance: fileAssetInstance])
            return
          }
        }
        fileAssetInstance = fileAssetService.setFileAsset(fileAssetInstance, params)

        if (!fileAssetInstance.hasErrors() && fileAssetInstance.save(flush: true)) {
          attachUploadedFilesTo(fileAssetInstance)
          flash.message = "${message(code: 'default.updated.message', args: [message(code: 'fileAsset.label', default: 'FileAsset'), fileAssetInstance.id])}"
          redirect(action: "show",  params: [fileId: fileAssetInstance.id])
        }
        else {
          render(view: "edit", model: [fileAssetInstance: fileAssetInstance])
        }

      }
      else {
        flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fileAsset.label', default: 'FileAsset'), params.id])}"
        redirect(action: "list")
      }
    }
  }

    def delete = {
    def fileAssetInstance = FileAsset.get(params.id)
    if (fileAssetInstance) {
      try {
        if (AttachmentableUtil.isAttachmentable(fileAssetInstance)) {
          def attachments = fileAssetInstance.attachments
          attachments.each {a ->
            attachmentableService.removeAttachment((a.id) as Long)
          }
        }

        fileAssetInstance.delete(flush: true)
        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'fileAsset.label', default: 'FileAsset'), params.id])}"
        redirect(action: "index", controller: 'home')
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'fileAsset.label', default: 'FileAsset'), params.id])}"
        redirect(action: "show", id: params.id)
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fileAsset.label', default: 'FileAsset'), params.id])}"
      redirect(action: "index", controller: 'home')
    }
  }

}
