package ro.isi.auth

import org.springframework.security.core.context.SecurityContextHolder as SCH

/**
 * UserService
 * A service class encapsulates the core business logic of a Grails application
 */
class UserService {

    static transactional = true

    def getAuthenticatedUser = {
        return SCH.context?.authentication?.principal
    }

    def getAuthenticatedWaiter = {
        def waiter = getAuthenticatedUser()
        def user = null;
        try {
            for (def role : waiter.authorities) {
                if (role?.authority?.equals(Roles.WAITER)) {
                    user = User.findById(waiter.id)
                    break;
                }
            }
        } catch (Exception ignored) {}
        return user;
    }

    def getWaiters = {
        def waiters = []

        for (User user : User.list()){
            for (Role role : user.authorities){
                if (role?.authority?.equals(Roles.WAITER)){
                    waiters.add user
                    break;
                }
            }

        }

        waiters
    }
}
