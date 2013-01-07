package ro.isi.restaurant

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException
import ro.isi.auth.Roles

/**
 * MasaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured([Roles.ADMINISTRATOR])
class MasaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [masaInstanceList: Masa.list(params), masaInstanceTotal: Masa.count()]
    }

    def create() {
        [masaInstance: new Masa(params)]
    }

    def save() {
        def masaInstance = new Masa(params)
        if (!masaInstance.save(flush: true)) {
            render(view: "create", model: [masaInstance: masaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'masa.label', default: 'Masa'), masaInstance.id])
        redirect(action: "show", id: masaInstance.id)
    }
    @Secured(['IS_AUTHENTICATED_A'])
    def show() {
        def masaInstance = Masa.get(params.id)
        if (!masaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'masa.label', default: 'Masa'), params.id])
            redirect(action: "list")
            return
        }

        [masaInstance: masaInstance]
    }

    def edit() {
        def masaInstance = Masa.get(params.id)
        if (!masaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'masa.label', default: 'Masa'), params.id])
            redirect(action: "list")
            return
        }

        [masaInstance: masaInstance]
    }

    def update() {
        def masaInstance = Masa.get(params.id)
        if (!masaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'masa.label', default: 'Masa'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (masaInstance.version > version) {
                masaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'masa.label', default: 'Masa')] as Object[],
                        "Another user has updated this Masa while you were editing")
                render(view: "edit", model: [masaInstance: masaInstance])
                return
            }
        }

        masaInstance.properties = params

        if (!masaInstance.save(flush: true)) {
            render(view: "edit", model: [masaInstance: masaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'masa.label', default: 'Masa'), masaInstance.id])
        redirect(action: "show", id: masaInstance.id)
    }

    def delete() {
        def masaInstance = Masa.get(params.id)
        if (!masaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'masa.label', default: 'Masa'), params.id])
            redirect(action: "list")
            return
        }

        try {
            masaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'masa.label', default: 'Masa'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'masa.label', default: 'Masa'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
