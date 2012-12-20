package ro.isi.restaurant

import org.springframework.dao.DataIntegrityViolationException

/**
 * RezervareController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class RezervareController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [rezervareInstanceList: Rezervare.list(params), rezervareInstanceTotal: Rezervare.count()]
    }

    def create() {
        [rezervareInstance: new Rezervare(params)]
    }

    def save() {
        def rezervareInstance = new Rezervare(params)
        if (!rezervareInstance.save(flush: true)) {
            render(view: "create", model: [rezervareInstance: rezervareInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'rezervare.label', default: 'Rezervare'), rezervareInstance.id])
        redirect(action: "show", id: rezervareInstance.id)
    }

    def show() {
        def rezervareInstance = Rezervare.get(params.id)
        if (!rezervareInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rezervare.label', default: 'Rezervare'), params.id])
            redirect(action: "list")
            return
        }

        [rezervareInstance: rezervareInstance]
    }

    def edit() {
        def rezervareInstance = Rezervare.get(params.id)
        if (!rezervareInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rezervare.label', default: 'Rezervare'), params.id])
            redirect(action: "list")
            return
        }

        [rezervareInstance: rezervareInstance]
    }

    def update() {
        def rezervareInstance = Rezervare.get(params.id)
        if (!rezervareInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rezervare.label', default: 'Rezervare'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (rezervareInstance.version > version) {
                rezervareInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'rezervare.label', default: 'Rezervare')] as Object[],
                        "Another user has updated this Rezervare while you were editing")
                render(view: "edit", model: [rezervareInstance: rezervareInstance])
                return
            }
        }

        rezervareInstance.properties = params

        if (!rezervareInstance.save(flush: true)) {
            render(view: "edit", model: [rezervareInstance: rezervareInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'rezervare.label', default: 'Rezervare'), rezervareInstance.id])
        redirect(action: "show", id: rezervareInstance.id)
    }

    def delete() {
        def rezervareInstance = Rezervare.get(params.id)
        if (!rezervareInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rezervare.label', default: 'Rezervare'), params.id])
            redirect(action: "list")
            return
        }

        try {
            rezervareInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'rezervare.label', default: 'Rezervare'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'rezervare.label', default: 'Rezervare'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
