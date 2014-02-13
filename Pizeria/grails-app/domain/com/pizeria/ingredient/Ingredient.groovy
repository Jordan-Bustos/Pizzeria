package com.pizeria.ingredient

import com.pizeria.pizza.Pizza

class Ingredient {

	static hasMany = [pizzas: Pizza]
	static belongsTo = Pizza

	float prix

	String nom
	
    static constraints = {
    	nom(blank: false, maxSize: 30)
		prix(min: 0f, scale: 2)
    }
    
    public String toString()
    {
    	return nom;
    }
}
