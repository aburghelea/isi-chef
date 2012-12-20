package ro.isi.restaurant

import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException
import ro.isi.auth.Roles
import ro.isi.auth.UserService

import javax.servlet.http.HttpServletResponse

/**
 * ComandaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ComandaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    ComandaService comandaService;
    UserService userService;

    def index() {

        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        def drinks = params.drinks != "false" ? true : false
        def list = drinks == false ? Comanda.list(params) : Comanda.findAll(params, {drinksServerd ==  false})
        [comandaInstanceList: list, comandaInstanceTotal: list.size(), drinks: drinks]
    }

    @Secured([Roles.ROLE_WAITER])
    def create() {
        def comanda = new Comanda(params)
        comanda.waiter = userService.getAuthenticatedWaiter()

        [comandaInstance: comanda, waiters: userService.getWaiters()]
    }

    def save() {
        def comandaInstance = new Comanda(params)
        comandaInstance.status = ComandaStatus.TAKEN;

        if (!comandaInstance.save(flush: true)) {
            comandaService.decrementStoks(comandaInstance)
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

        [comandaInstance: comandaInstance, waiters: userService.getWaiters()]
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

    @Secured([Roles.ROLE_WAITER])
    def listPreparedOrders() {

    }

    def takenOrdersCount = {
        def takenOrders = comandaService.getTakenOrdersCount();

        response.setStatus HttpServletResponse.SC_OK
        render takenOrders
    }

    def preparedOrdersCount = {
        def preparedOrders = comandaService.getPreparedOrdersCount();

        response.setStatus HttpServletResponse.SC_OK
        render preparedOrders
    }

    def unservedDrinksCount = {
        def preparedOrders = comandaService.getUnservedDrinksCount();

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


    def listPreparedOrdersAsJson() {
        response.setStatus HttpServletResponse.SC_OK
        response.setContentType "application/json"

        render comandaService.getPreparedOrders() as JSON
    }

    def deliver() {

        def delivered = comandaService.deliverOrder params.orderId
        if (delivered)
            flash.message = message(code: 'order.delivered.message', args: [params.orderId])
        else
            flash.message = message(code: 'order.not.delivered.message', args: [params.orderId])
        redirect action: 'listPreparedOrders', params: params
    }

    def deliverDrink() {
        def delivered = comandaService.deliverDrink params.orderId

        redirect action: 'list', params: params
    }
}
