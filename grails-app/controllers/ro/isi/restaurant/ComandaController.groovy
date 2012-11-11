package ro.isi.restaurant

import org.springframework.dao.DataIntegrityViolationException

/**
 * ComandaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ComandaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [comandaInstanceList: Comanda.list(params), comandaInstanceTotal: Comanda.count()]
    }

    def create() {
        [comandaInstance: new Comanda(params)]
    }

    def save() {
        def comandaInstance = new Comanda(params)
        if (!comandaInstance.save(flush: true)) {
            render(view: "create", model: [comandaInstance: comandaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'comanda.label', default: 'Comanda'), comandaInstance.id])
        redirect(action: "show", id: comandaInstance.id)
    }

    def show() {
        def comandaInstance = Comanda.get(params.id)
        if (!comandaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'comanda.label', default: 'Comanda'), params.id])
            redirect(action: "list")
            return
        }

        [comandaInstance: comandaInstance]
    }

    def edit() {
        def comandaInstance = Comanda.get(params.id)
        if (!comandaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comanda.label', default: 'Comanda'), params.id])
            redirect(action: "list")
            return
        }

        [comandaInstance: comandaInstance]
    }

    def update() {
        def comandaInstance = Comanda.get(params.id)
        if (!comandaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comanda.label', default: 'Comanda'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (comandaInstance.version > version) {
                comandaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'comanda.label', default: 'Comanda')] as Object[],
                          "Another user has updated this Comanda while you were editing")
                render(view: "edit", model: [comandaInstance: comandaInstance])
                return
            }
        }

        comandaInstance.properties = params

        if (!comandaInstance.save(flush: true)) {
            render(view: "edit", model: [comandaInstance: comandaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'comanda.label', default: 'Comanda'), comandaInstance.id])
        redirect(action: "show", id: comandaInstance.id)
    }

    def delete() {
        def comandaInstance = Comanda.get(params.id)
        if (!comandaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'comanda.label', default: 'Comanda'), params.id])
            redirect(action: "list")
            return
        }

        try {
            comandaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'comanda.label', default: 'Comanda'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'comanda.label', default: 'Comanda'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
