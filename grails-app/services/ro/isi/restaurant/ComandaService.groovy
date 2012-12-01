package ro.isi.restaurant

import ro.isi.auth.Roles
import ro.isi.auth.User

/**
 * ComandaService
 * A service class encapsulates the core business logic of a Grails application
 */
class ComandaService {

    static transactional = true
    def userService

    def getAuthenticatedWaiter = {
        def waiter = userService.getAuthenticatedUser()

        for (def role : waiter.authorities) {
            if (role?.authority?.equals(Roles.ROLE_WAITER))
                return User.findById(waiter.id)
        }
        return null;
    }

    def getAuthenticatedCook = {
        def waiter = userService.getAuthenticatedUser()

        for (def role : waiter.authorities) {
            if (role?.authority?.equals(Roles.ROLE_COOK))
                return User.findById(waiter.id)
        }
        return null;
    }

    def getTakenOrdersCount() {
        def takenOrders = Comanda.createCriteria().count() {
            or {
                isNull('cook')
                eq 'status', ComandaStatus.TAKEN
            }
        }
        return takenOrders;
    }

    def getPreparedOrdersCount() {
        return "UNIMPLEMENTED"

    }


    def getTakenOrders() {
        def takenOrders = Comanda.createCriteria().list() {
            or {
                eq 'status', ComandaStatus.TAKEN
                isNull('cook')
            }
        }

        takenOrders = takenOrders.collect {
            Comanda it ->
            [
                    id: it.id,
                    waiter: it.waiter?.username,
                    status: it.status?.toString(),
                    preparationTime: it.getPreparationTime(),
                    masa: it.masa?.number
            ]

        }
        return takenOrders;
    }

    def assignOrder(def orderId) {
        def comanda = Comanda.findById(orderId)
        comanda.cook = getAuthenticatedCook();
        comanda.status = ComandaStatus.PREPARING;

        comanda.save(failOnError: true, flush: true)
    }
}
