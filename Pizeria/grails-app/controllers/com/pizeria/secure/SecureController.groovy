package com.pizeria.secure

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class SecureController {
    
	def springSecurityService
	
    def index() {
      render 'Secure access only'
   }
}