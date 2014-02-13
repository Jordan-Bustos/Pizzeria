package com.pizeria.pizza



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
@Transactional(readOnly = true)
class PizzaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	@Secured('permitAll')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Pizza.list(params), model:[pizzaInstanceCount: Pizza.count()]
    }
	
	@Secured('permitAll')
    def show(Pizza pizzaInstance) {
        respond pizzaInstance
    }
	
	@Secured(['ROLE_ADMIN'])
    def create() {
        respond new Pizza(params)
    }

	@Secured(['ROLE_ADMIN'])
    @Transactional
    def save(Pizza pizzaInstance) {
        if (pizzaInstance == null) {
            notFound()
            return
        }

        if (pizzaInstance.hasErrors()) {
            respond pizzaInstance.errors, view:'create'
            return
        }

        pizzaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pizzaInstance.label', default: 'Pizza'), pizzaInstance.id])
                redirect pizzaInstance
            }
            '*' { respond pizzaInstance, [status: CREATED] }
        }
    }

	@Secured(['ROLE_ADMIN'])
    def edit(Pizza pizzaInstance) {
        respond pizzaInstance
    }

	@Secured(['ROLE_ADMIN'])
    @Transactional
    def update(Pizza pizzaInstance) {
        if (pizzaInstance == null) {
            notFound()
            return
        }

        if (pizzaInstance.hasErrors()) {
            respond pizzaInstance.errors, view:'edit'
            return
        }

        pizzaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Pizza.label', default: 'Pizza'), pizzaInstance.id])
                redirect pizzaInstance
            }
            '*'{ respond pizzaInstance, [status: OK] }
        }
    }

	@Secured(['ROLE_ADMIN'])
    @Transactional
    def delete(Pizza pizzaInstance) {

        if (pizzaInstance == null) {
            notFound()
            return
        }

        pizzaInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Pizza.label', default: 'Pizza'), pizzaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

	
	@Secured('permitAll')
    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pizzaInstance.label', default: 'Pizza'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
