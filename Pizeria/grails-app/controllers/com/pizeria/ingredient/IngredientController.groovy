package com.pizeria.ingredient



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional


@Transactional(readOnly = true)
class IngredientController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	@Secured('permitAll')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Ingredient.list(params), model:[ingredientInstanceCount: Ingredient.count()]
    }
	
	@Secured('permitAll')
    def show(Ingredient ingredientInstance) {
        respond ingredientInstance
    }

	
	@Secured(['ROLE_ADMIN'])
    def create() {
        respond new Ingredient(params)
    }

    @Transactional
	@Secured(['ROLE_ADMIN'])
    def save(Ingredient ingredientInstance) {
        if (ingredientInstance == null) {
            notFound()
            return
        }

        if (ingredientInstance.hasErrors()) {
            respond ingredientInstance.errors, view:'create'
            return
        }

        ingredientInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ingredientInstance.label', default: 'Ingredient'), ingredientInstance.id])
                redirect ingredientInstance
            }
            '*' { respond ingredientInstance, [status: CREATED] }
        }
    }

	@Secured(['ROLE_ADMIN'])
    def edit(Ingredient ingredientInstance) {
        respond ingredientInstance
    }

    @Transactional
	@Secured(['ROLE_ADMIN'])
    def update(Ingredient ingredientInstance) {
        if (ingredientInstance == null) {
            notFound()
            return
        }

        if (ingredientInstance.hasErrors()) {
            respond ingredientInstance.errors, view:'edit'
            return
        }

        ingredientInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Ingredient.label', default: 'Ingredient'), ingredientInstance.id])
                redirect ingredientInstance
            }
            '*'{ respond ingredientInstance, [status: OK] }
        }
    }

    @Transactional
	@Secured(['ROLE_ADMIN'])
    def delete(Ingredient ingredientInstance) {

        if (ingredientInstance == null) {
            notFound()
            return
        }

        ingredientInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Ingredient.label', default: 'Ingredient'), ingredientInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

	@Secured(['permitAll'])
    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingredientInstance.label', default: 'Ingredient'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
