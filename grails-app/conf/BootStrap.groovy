import ro.isi.auth.Role
import ro.isi.auth.User
import ro.isi.auth.UserRole

class BootStrap {

    def springSecurityService

    def init = { servletContext ->
        def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)

        def adminUser = User.findByUsername('admin') ?: new User(
                username: 'admin',
                password: 'admin',
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            UserRole.create adminUser, adminRole
        }

        def simpleUser = User.findByUsername('user') ?: new User(
                username: 'user',
                password: 'user',
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(userRole)) {
            UserRole.create simpleUser, userRole
        }


    }
    def destroy = {
    }
}
