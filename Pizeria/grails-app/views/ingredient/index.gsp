
<%@ page import="com.pizeria.ingredient.Ingredient" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ingredient.label', default: 'Ingredient')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ingredient" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
  				<sec:ifAnyGranted roles="ROLE_ADMIN">
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</sec:ifAnyGranted>
			</ul>
		</div>
		<div id="list-ingredient" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nom" title="${message(code: 'ingredient.nom.label', default: 'Nom')}" />
					
						<g:sortableColumn property="prix" title="${message(code: 'ingredient.prix.label', default: 'Prix')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ingredientInstanceList}" status="i" var="ingredientInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ingredientInstance.id}">${fieldValue(bean: ingredientInstance, field: "nom")}</g:link></td>
					
						<td>${fieldValue(bean: ingredientInstance, field: "prix")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ingredientInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
