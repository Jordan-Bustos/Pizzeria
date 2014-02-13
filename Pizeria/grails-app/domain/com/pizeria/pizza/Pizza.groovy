package com.pizeria.pizza

import com.pizeria.ingredient.Ingredient

class Pizza {

	static hasMany = [ingredients: Ingredient]
	
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
