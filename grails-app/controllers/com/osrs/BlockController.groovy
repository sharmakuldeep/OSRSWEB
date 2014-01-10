package com.osrs


import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class BlockController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [blockInstanceList: Block.list(params), blockInstanceTotal: Block.count()]
    }

    def create = {
        def blockInstance = new Block()
        blockInstance.properties = params
        return [blockInstance: blockInstance]
    }

    def save = {
        def blockInstance = new Block(params)
        if (blockInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'block.label', default: 'Block'), blockInstance.id])}"
            redirect(action: "show", id: blockInstance.id)
        }
        else {
            render(view: "create", model: [blockInstance: blockInstance])
        }
    }

    def show = {
        def blockInstance = Block.get(params.id)
        if (!blockInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'block.label', default: 'Block'), params.id])}"
            redirect(action: "list")
        }
        else {
            [blockInstance: blockInstance]
        }
    }

    def edit = {
        def blockInstance = Block.get(params.id)
        if (!blockInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'block.label', default: 'Block'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [blockInstance: blockInstance]
        }
    }

    def update = {
        def blockInstance = Block.get(params.id)
        if (blockInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (blockInstance.version > version) {

                    blockInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'block.label', default: 'Block')] as Object[], "Another user has updated this Block while you were editing")
                    render(view: "edit", model: [blockInstance: blockInstance])
                    return
                }
            }
            blockInstance.properties = params
            if (!blockInstance.hasErrors() && blockInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'block.label', default: 'Block'), blockInstance.id])}"
                redirect(action: "show", id: blockInstance.id)
            }
            else {
                render(view: "edit", model: [blockInstance: blockInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'block.label', default: 'Block'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def blockInstance = Block.get(params.id)
        if (blockInstance) {
            try {
                blockInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'block.label', default: 'Block'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'block.label', default: 'Block'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'block.label', default: 'Block'), params.id])}"
            redirect(action: "list")
        }
    }
}
