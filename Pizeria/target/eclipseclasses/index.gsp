<!DOCTYPE html>
<html>
<head>
<title>Welcome to The Pizeria Busmil !!!</title>
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
			<td colspan="2" bgcolor="green"><div class="Title">The Pizeria Busmil !!!</div></td>
			<td>
				<div>
					<span>Login :</span>
					<input type="text"/>
					<span>Mdp :</span>
					<input type="password"/>
				</div>
			</td>
		</tr>
		<tr>
			<td rowspan="2">
				
			</td>
			<td colspan="2" rowspan="4"  bgcolor="blue"> </td>
		</tr>
		<tr>
			<td rowspan="2"></td>
		</tr>
	</table>
	
			<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						&nbsp;&nbsp;&nbsp;
						<g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
						</br></br>
			</g:each>
</body>
</html>
