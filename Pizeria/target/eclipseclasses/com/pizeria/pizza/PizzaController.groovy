package com.pizeria.pizza



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PizzaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Pizza.list(params), model:[pizzaInstanceCount: Pizza.count()]
    }

    def show(Pizza pizzaInstance) {
        respond pizzaInstance
    }

    def create() {
        respond new Pizza(params)
    }

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

    def edit(Pizza pizzaInstance) {
        respond pizzaInstance
    }

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
