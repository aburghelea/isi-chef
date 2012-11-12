import ro.isi.auth.Role
import ro.isi.auth.User
import ro.isi.auth.UserRole

class BootStrap {

    def springSecurityService

    def init = { servletContext ->
        def cookRole = Role.findByAuthority('ROLE_COOK') ?: new Role(authority: 'ROLE_COOK').save(failOnError: true)
        def waiterRole = Role.findByAuthority('ROLE_WAITER') ?: new Role(authority: 'ROLE_WAITER').save(failOnError: true)
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)

        def adminUser = User.findByUsername('admin') ?: new User(
                username: 'admin',
                password: 'admin',
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            UserRole.create adminUser, adminRole, true
        }

        def cookUser = User.findByUsername('bucatar') ?: new User(
                username: 'bucatar',
                password: 'bucatar',
                enabled: true).save(failOnError: true)

        if (!cookUser.authorities.contains(cookRole)) {
            UserRole.create cookUser, cookRole, true
        }

        def waiterUser = User.findByUsername('ospatar') ?: new User(
                username: 'ospatar',
                password: 'ospatar',
                enabled: true).save(failOnError: true)

        if (!waiterUser.authorities.contains(waiterRole)) {
            UserRole.create waiterUser, waiterRole, true
        }
    }


    def destroy = {
    }
}
