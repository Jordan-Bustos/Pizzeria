<%@ page import="com.pizeria.pizza.Pizza" %>



<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="pizza.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" maxlength="30" required="" value="${pizzaInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'prix', 'error')} required">
	<label for="prix">
		<g:message code="pizza.prix.label" default="Prix" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="prix" value="${fieldValue(bean: pizzaInstance, field: 'prix')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'ingredients', 'error')} ">
	<label for="ingredients">
		<g:message code="pizza.ingredients.label" default="Ingredients" />
		
	</label>
	<g:select name="ingredients" from="${com.pizeria.ingredient.Ingredient.list()}" multiple="multiple" optionKey="id" size="5" value="${pizzaInstance?.ingredients*.id}" class="many-to-many"/>
</div>

