
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'pizza.label', default: 'Pizza')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<table>
		<tr height="100%">
			<td colspan="2" bgcolor="green"><div class="Title">The
					Pizzeria Busmil !!!</div></td>
		</tr>
		<td colspan="2" rowspan="4" bgcolor="blue" /td>
		</tr>
	</table>

	<table>
		<tr>
			<td><a href="ingredient/index"> ${message(code: 'pizza.ingredients.label')}
			</a></td>
		</tr>
		<tr>
			<td><a href="pizza"> ${message(code: 'ingredient.pizzas.label')}
			</a></td>
		</tr>
		<tr>
			<td><sec:ifNotLoggedIn>
					<a href="login">Connection</a>
				</sec:ifNotLoggedIn> <sec:ifLoggedIn>
					<sec:loggedInUserInfo field="username" />
					<a href="logout">Déconnection</a>
				</sec:ifLoggedIn></td>
		</tr>
	</table>
</body>
</html>
