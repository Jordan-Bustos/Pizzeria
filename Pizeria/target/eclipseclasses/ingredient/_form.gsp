<%@ page import="com.pizeria.ingredient.Ingredient" %>



<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="ingredient.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" maxlength="30" required="" value="${ingredientInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'prix', 'error')} required">
	<label for="prix">
		<g:message code="ingredient.prix.label" default="Prix" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="prix" value="${fieldValue(bean: ingredientInstance, field: 'prix')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'pizzas', 'error')} ">
	<label for="pizzas">
		<g:message code="ingredient.pizzas.label" default="Pizzas" />
		
	</label>
	
</div>

