package ro.isi.restaurant

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

import javax.servlet.http.HttpServletResponse
import grails.plugins.springsecurity.Secured
import ro.isi.auth.Roles

/**
 * ProdusController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ProdusController {
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def produsService;

    def index() {
        redirect(action: "list", params: params)
    }
//    @Secured([Roles.ADMINISTRATOR])
    def printable() {
        [produsInstanceMap: produsService.getProductMap()]
    }

    def menuPdf() {
        renderPdf(template: "/produs/printable",
                model:  [produsInstanceMap: produsService.getProductMap()],
                filename: "Meniu.pdf")
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [produsInstanceList: Produs.list(params), produsInstanceTotal: Produs.count()]
    }

    def create() {
        [produsInstance: new Produs(params)]
    }

    def save() {
        def produsInstance = new Produs(params)
        if (!produsInstance.save(flush: true)) {
            render(view: "create", model: [produsInstance: produsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'produs.label', default: 'Produs'), produsInstance.id])
        redirect(action: "show", id: produsInstance.id)
    }

    def show() {
        def produsInstance = Produs.get(params.id)
        if (!produsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'produs.label', default: 'Produs'), params.id])
            redirect(action: "list")
            return
        }

        [produsInstance: produsInstance]
    }

    def edit() {
        def produsInstance = Produs.get(params.id)
        if (!produsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'produs.label', default: 'Produs'), params.id])
            redirect(action: "list")
            return
        }

        [produsInstance: produsInstance]
    }

    def update() {
        def produsInstance = Produs.get(params.id)
        if (!produsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'produs.label', default: 'Produs'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (produsInstance.version > version) {
                produsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'produs.label', default: 'Produs')] as Object[],
                        "Another user has updated this Produs while you were editing")
                render(view: "edit", model: [produsInstance: produsInstance])
                return
            }
        }

        produsInstance.properties = params

        if (!produsInstance.save(flush: true)) {
            render(view: "edit", model: [produsInstance: produsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'produs.label', default: 'Produs'), produsInstance.id])
        redirect(action: "show", id: produsInstance.id)
    }

    def delete() {
        def produsInstance = Produs.get(params.id)
        if (!produsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'produs.label', default: 'Produs'), params.id])
            redirect(action: "list")
            return
        }

        try {
            produsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'produs.label', default: 'Produs'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'produs.label', default: 'Produs'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def listJSON() {
        response.setStatus HttpServletResponse.SC_OK
        response.setContentType "application/json"

        Closure criteria = { gt 'stock', 0L }
        def result = produsService.productsByCriteria criteria
        render result as JSON
    }


}
