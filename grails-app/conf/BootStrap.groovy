import ro.isi.auth.Role
import ro.isi.auth.User
import ro.isi.auth.UserRole
import ro.isi.restaurant.Comanda
import ro.isi.restaurant.ComandaStatus
import ro.isi.restaurant.Masa
import ro.isi.restaurant.Produs
import ro.isi.auth.Roles

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        bootStrapUsers()
        bootStrapProducts()
        bootStrapTables();
        bootStrapOrders();
    }

    def destroy = {
    }


    private def bootStrapUsers = {
        def cookRole = Role.findByAuthority(Roles.COOK) ?: new Role(authority: Roles.COOK).save(failOnError: true)
        def waiterRole = Role.findByAuthority(Roles.WAITER) ?: new Role(authority: Roles.WAITER).save(failOnError: true)
        def adminRole = Role.findByAuthority(Roles.ADMINISTRATOR) ?: new Role(authority: Roles.ADMINISTRATOR).save(failOnError: true)

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

    private def bootStrapProducts = {
//        for (int i = 0; i < 20; i++) {
//
//            def produs = new Produs(
//                    name: i + " Yummy",
//                    price: i * 100,
//                    description: "Produsul " + i,
//                    preparationTime: i * 13,
//                    code: i * Math.sqrt(i),
//                    type: 'COMESTIBIL').save(failOnError: true, flush: true);
//        }
    }

    private def bootStrapTables = {
        for (int i = 0; i < 20; i++) {
            new Masa(
                    number: i,
                    description: "Masa - " + i
            ).save(failOnError: true, flush: true);
        }
    }

    private def bootStrapOrders = {
        def waiter = User.findByUsername("ospatar");

        for (int i = 0; i < 20; i++) {
            new Comanda(
                    waiter: waiter,
                    produses: [Produs.findById(1)],
                    masa: Masa.findById(1),
                    status: ComandaStatus.TAKEN
            ).save(failOnError: true, flush: true);
        }
    }
}
