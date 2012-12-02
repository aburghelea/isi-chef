package ro.isi.restaurant

import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException
import ro.isi.auth.Roles

import javax.servlet.http.HttpServletResponse

/**
 * ComandaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ComandaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    ComandaService comandaService;

    def index() {

        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [comandaInstanceList: Comanda.list(params), comandaInstanceTotal: Comanda.count()]
    }

    @Secured([Roles.ROLE_WAITER])
    def create() {
        def comanda = new Comanda(params)
        comanda.waiter = comandaService.getAuthenticatedWaiter()

        [comandaInstance: comanda]
    }

    def save() {
        def comandaInstance = new Comanda(params)
        comandaInstance.status = ComandaStatus.TAKEN;

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

    @Secured([Roles.ROLE_COOK])
    def listTakenOrders() {
        [comandaInstance: comandaService.getOrderAssignedToCurrentCook()]
    }

    def takenOrdersCounter = {
        def takenOrders = comandaService.getTakenOrdersCount();

        response.setStatus HttpServletResponse.SC_OK
        render takenOrders
    }

    def preparedOrdersCount = {
        def preparedOrders = comandaService.getPreparedOrdersCount();

        response.setStatus HttpServletResponse.SC_OK
        render preparedOrders
    }


    def listTakenOrdersAsJson() {
        response.setStatus HttpServletResponse.SC_OK
        response.setContentType "application/json"

        render comandaService.getTakenOrders() as JSON
    }

    def assignOrder() {

        def alreadyAssignedCommand = comandaService.assignOrder params.orderId
        if (alreadyAssignedCommand)
            flash.message = message(code: 'order.exists.message', args: [message(code: 'comanda.label', default: 'Comanda')])
        redirect action: 'listTakenOrders', params: params
    }

    def markAsPrepared() {
        comandaService.markAsPrepared params.id

        flash.message = message(code: 'order.prepared.message', default: "CONTACT ADMINISTRATOR")
        redirect action: "listTakenOrders"
    }
}
