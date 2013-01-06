package ro.isi.auth

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.core.context.SecurityContextHolder as SCH

/**
 * UserService
 * A service class encapsulates the core business logic of a Grails application
 */
class UserService {

    static transactional = true

    def mailService
    def grailsApplication

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
        getUsers(Roles.WAITER)
    }

    def getClients = {

        getUsers(Roles.CLIENT)
    }

    def getUsers(String authority) {
        def users = []

        for (User user : User.list()) {
            for (Role role : user.authorities) {
                if (role?.authority?.equals(authority)) {
                    users.add user
                    break;
                }
            }
        }

        users
    }

    def sendEmails(def body, def subiect) {

        for (User user : getClients()) {
            def text = body
            if (text.contains('#user')) {
                text = text.replaceAll("#user", user.username)
            }
            def conf = SpringSecurityUtils.securityConfig
            mailService.sendMail {
                to user.email
                from conf.ui.register.emailFrom
                subject subiect ?: "NewsLetter ${grailsApplication.metadata['app.name']}"
                html text.toString()
            }
        }

    }

}
