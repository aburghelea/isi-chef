package org.codehaus.groovy.grails.plugins.springsecurity.ui

import org.springframework.dao.DataIntegrityViolationException

/**
 * RegistrationCodeController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class RegistrationCodeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [registrationCodeInstanceList: RegistrationCode.list(params), registrationCodeInstanceTotal: RegistrationCode.count()]
    }

    def create() {
        [registrationCodeInstance: new RegistrationCode(params)]
    }

    def save() {
        def registrationCodeInstance = new RegistrationCode(params)
        if (!registrationCodeInstance.save(flush: true)) {
            render(view: "create", model: [registrationCodeInstance: registrationCodeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'registrationCode.label', default: 'RegistrationCode'), registrationCodeInstance.id])
        redirect(action: "show", id: registrationCodeInstance.id)
    }

    def show() {
        def registrationCodeInstance = RegistrationCode.get(params.id)
        if (!registrationCodeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'registrationCode.label', default: 'RegistrationCode'), params.id])
            redirect(action: "list")
            return
        }

        [registrationCodeInstance: registrationCodeInstance]
    }

    def edit() {
        def registrationCodeInstance = RegistrationCode.get(params.id)
        if (!registrationCodeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registrationCode.label', default: 'RegistrationCode'), params.id])
            redirect(action: "list")
            return
        }

        [registrationCodeInstance: registrationCodeInstance]
    }

    def update() {
        def registrationCodeInstance = RegistrationCode.get(params.id)
        if (!registrationCodeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registrationCode.label', default: 'RegistrationCode'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (registrationCodeInstance.version > version) {
                registrationCodeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'registrationCode.label', default: 'RegistrationCode')] as Object[],
                          "Another user has updated this RegistrationCode while you were editing")
                render(view: "edit", model: [registrationCodeInstance: registrationCodeInstance])
                return
            }
        }

        registrationCodeInstance.properties = params

        if (!registrationCodeInstance.save(flush: true)) {
            render(view: "edit", model: [registrationCodeInstance: registrationCodeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'registrationCode.label', default: 'RegistrationCode'), registrationCodeInstance.id])
        redirect(action: "show", id: registrationCodeInstance.id)
    }

    def delete() {
        def registrationCodeInstance = RegistrationCode.get(params.id)
        if (!registrationCodeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'registrationCode.label', default: 'RegistrationCode'), params.id])
            redirect(action: "list")
            return
        }

        try {
            registrationCodeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'registrationCode.label', default: 'RegistrationCode'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'registrationCode.label', default: 'RegistrationCode'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
