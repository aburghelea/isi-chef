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
}
