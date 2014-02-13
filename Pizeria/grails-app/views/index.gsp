
<!DOCTYPE html>
<html>
<head>
<title>Welcome to The Pizzeria Busmil !!!</title>
<style type="text/css">
.Title {
	font-size: 5em;
	text-align: center;
}
</style>
</head>
<body>
	<table>
		<tr height="100%"> 
			<td colspan="2" bgcolor="green"><div class="Title">The Pizzeria Busmil !!!</div></td>
		</tr>
			<td colspan="2" rowspan="4"  bgcolor="blue" /td>
		</tr>
	</table>
	
	<table >
		<tr>
			<td>
				<a href="ingredient/index">Ingrédients</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="pizza">Pizzas</a>
			</td>
		</tr>
	</table>
	
	<sec:ifNotLoggedIn>
		<a href="login">Connection</a>
	</sec:ifNotLoggedIn>	
	<sec:ifLoggedIn>
  		<sec:loggedInUserInfo field="username"/>			
		<a href="logout">Déconnection</a> 
	</sec:ifLoggedIn>
	
</body>
</html>
