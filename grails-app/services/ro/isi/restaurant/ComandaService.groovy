package ro.isi.restaurant

import ro.isi.auth.Roles
import ro.isi.auth.User
import ro.isi.auth.UserRole
import ro.isi.auth.Role

/**
 * ComandaService
 * A service class encapsulates the core business logic of a Grails application
 */
class ComandaService {

    static transactional = true
    def userService

    def getAuthenticatedWaiter = {
        def waiter = userService.getAuthenticatedUser()

        for (def role : waiter.authorities){
            if (role?.authority?.equals(Roles.ROLE_WAITER))
                return User.findById(waiter.id)
        }
        return null;
    }
    def addProductToTableOrder(def tableId = null, def productId = null) {

    }
}
