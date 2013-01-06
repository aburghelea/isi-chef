package ro.isi.auth

import grails.plugins.springsecurity.Secured

@Secured([Roles.ADMINISTRATOR])
class UserController extends grails.plugins.springsecurity.ui.UserController {

    def userService

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def show() {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def emailClients() {

    }

    def email() {
        userService.sendEmails(params.text, params.subject ?: null)

        redirect action: 'emailClients'
    }

}
