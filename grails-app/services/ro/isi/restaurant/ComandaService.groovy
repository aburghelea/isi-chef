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
        def user = null;
        try {
            for (def role : waiter.authorities) {
                if (role?.authority?.equals(Roles.ROLE_WAITER)) {
                    user = User.findById(waiter.id)
                    break;
                }
            }
        } catch (Exception ignored) {}
        return user;
    }

    def getAuthenticatedCook = {
        def waiter = userService.getAuthenticatedUser()
        def user = null;
        try {
            for (def role : waiter.authorities) {
                if (role?.authority?.equals(Roles.ROLE_COOK)) {
                    user = User.findById(waiter.id)
                    break;
                }
            }
        } catch (Exception ignored) {}
        return user;
    }

    def getUnservedDrinksCount() {
        def unservedDrinks = Comanda.createCriteria().count() {
            eq 'drinksServerd', false
        }
        return unservedDrinks;
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
        def preparedOrdersCount = Comanda.createCriteria().count() {
            and {
                eq 'waiter', getAuthenticatedWaiter()
                eq 'status', ComandaStatus.PREPARED
            }
        }

        return preparedOrdersCount

    }


    def getTakenOrders() {
        Closure takenFilter = {
            or {
                eq 'status', ComandaStatus.TAKEN;
                isNull('cook')
            }
        }

        return getOrders(takenFilter)
    }

    def getPreparedOrders() {
        Closure prepared = {
            and {
                eq 'status', ComandaStatus.PREPARED;
                eq 'waiter', getAuthenticatedWaiter()
            }
        }

        return getOrders(prepared)
    }

    private def getOrders(def restrictions) {
        def takenOrders = Comanda.createCriteria().list restrictions
        takenOrders = takenOrders.collect {
            Comanda it ->
                [
                        id: it.id,
                        waiter: it.waiter?.username != null ? it.waiter?.username : '',
                        cook: it.cook?.username != null ? it.cook?.username : '',
                        table: it.masa?.getNumber(),
                        preparationTime: it.getPreparationTime(),
                        status: it.status?.toString() != null ? it.status?.toString() : ''
                ]
        }
        return takenOrders;
    }

    def assignOrder(def orderId) {
        def comanda = getOrderAssignedToCurrentCook()
        if (comanda)
            return false;

        comanda = Comanda.findById(orderId)
        comanda.cook = getAuthenticatedCook();
        comanda.status = ComandaStatus.PREPARING;
        comanda.save(failOnError: true, flush: true)

        return true;
    }

    def deliverOrder(def orderId) {
        def comanda = Comanda.findById(orderId)
        if (comanda.status != ComandaStatus.PREPARED)
            return false;
        comanda.status = ComandaStatus.DELIVERED;
        comanda.save(failOnError: true, flush: true)

        return true;
    }

    def deliverDrink(def orderId) {
        def comanda = Comanda.findById(orderId)
        comanda.drinksServerd = true;
        comanda.save(failOnError: true, flush: true)

        return true;
    }
    def getOrderAssignedToCurrentCook() {
        def comanda = Comanda.findAllByCookAndStatus(getAuthenticatedCook(), ComandaStatus.PREPARING);
        if (comanda?.size() > 0)
            return comanda.first();

        return null
    }

    def markAsPrepared(def orderId) {
        def comanda = Comanda.get(orderId);

        comanda?.status = ComandaStatus.PREPARED;
        comanda?.save(failOnError: true, flush: true)
    }
}
