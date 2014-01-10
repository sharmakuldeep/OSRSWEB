package com.osrs


import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class VillageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [villageInstanceList: Village.list(params), villageInstanceTotal: Village.count()]
    }

    def create = {
        def villageInstance = new Village()
        villageInstance.properties = params
        return [villageInstance: villageInstance]
    }

    def save = {
        def villageInstance = new Village(params)
        if (villageInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'village.label', default: 'Village'), villageInstance.id])}"
            redirect(action: "show", id: villageInstance.id)
        }
        else {
            render(view: "create", model: [villageInstance: villageInstance])
        }
    }

    def show = {
        def villageInstance = Village.get(params.id)
        if (!villageInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'village.label', default: 'Village'), params.id])}"
            redirect(action: "list")
        }
        else {
            [villageInstance: villageInstance]
        }
    }

    def edit = {
        def villageInstance = Village.get(params.id)
        if (!villageInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'village.label', default: 'Village'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [villageInstance: villageInstance]
        }
    }

    def update = {
        def villageInstance = Village.get(params.id)
        if (villageInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (villageInstance.version > version) {

                    villageInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'village.label', default: 'Village')] as Object[], "Another user has updated this Village while you were editing")
                    render(view: "edit", model: [villageInstance: villageInstance])
                    return
                }
            }
            villageInstance.properties = params
            if (!villageInstance.hasErrors() && villageInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'village.label', default: 'Village'), villageInstance.id])}"
                redirect(action: "show", id: villageInstance.id)
            }
            else {
                render(view: "edit", model: [villageInstance: villageInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'village.label', default: 'Village'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def villageInstance = Village.get(params.id)
        if (villageInstance) {
            try {
                villageInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'village.label', default: 'Village'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'village.label', default: 'Village'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'village.label', default: 'Village'), params.id])}"
            redirect(action: "list")
        }
    }
}
