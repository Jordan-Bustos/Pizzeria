
<%@ page import="com.pizeria.pizza.Pizza" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pizza.label', default: 'Pizza')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pizza" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<sec:ifAnyGranted roles="ROLE_ADMIN">
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</sec:ifAnyGranted>
			</ul>
		</div>
		<div id="list-pizza" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nom" title="${message(code: 'pizza.nom.label', default: 'Nom')}" />
					
						<g:sortableColumn property="prix" title="${message(code: 'pizza.prix.label', default: 'Prix')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pizzaInstanceList}" status="i" var="pizzaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pizzaInstance.id}">${fieldValue(bean: pizzaInstance, field: "nom")}</g:link></td>
					
						<td>${fieldValue(bean: pizzaInstance, field: "prix")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pizzaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
