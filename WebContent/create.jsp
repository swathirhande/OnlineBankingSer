<%@page import="g.*"%>
<%
	UserDetails userDetails = (UserDetails) request.getSession().getAttribute("UserDetails");
	if (userDetails != null) {
%>
<script type="text/javascript">
	window.location.assign("/OnlineBankingServ");
</script>
<%
	}
%>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
	function dil(form) {
		for (var i = 0; i < 3; i++) {
			if (!isNaN(form.elements[i].value)) {
				alert("This Field must be Char's")
				form.elements[i].value = ""
				form.elements[i].focus()
				return false
			}
		}
		if (document.F1.password.value != document.F1.repassword.value) {
			alert("Check Confirm PWD");
			document.F1.repassword.value = ""
			document.F1.repassword.focus()
			return false
		}

		if (!isNaN(document.F1.phone.value)) {
			if (document.F1.phone.value > 9999999999) {
				alert("Number less than 10 digit")
				document.F1.phone.value = ""
				document.F1.phone.focus()
				return false
			}
		} else {
			alert("This  field  must  be  number")
			document.F1.phone.value = ""
			return false
		}

		if (!isNaN(document.F1.amount.value)) {
			if (document.F1.amount.value < 500) {
				alert("Minimum Balance should be 500 /-")
				document.F1.amount.value = ""
				document.F1.amount.focus()
				return false
			}
		} else {
			alert("This  field  must  be  number")
			document.F1.amount.value = ""
			return false
		}

		for (var i = 0; i < form.elements.length; i++) {
			if (form.elements[i].value == "") {
				alert("Fill out all Fields")
				document.F1.username.focus()
				return false
			}
		}

		return true
	}
</SCRIPT>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Global Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function ctck() {
		var sds = document.getElementById("dum");

	}
</script>

</head>

<body>

	<div id="top_links">


		<div id="header">
			<h1>
				APANA - BANK<span class="style1"></span>
			</h1>
			<h2>ExtraOrdinary Service</h2>
			<A href="index.html"><IMG SRC="images/home1.gif"></IMG></A>
		</div>

		<div id="navigation">
			<ul>
				<li><a href="index.jsp">HOME</a></li>
			</ul>
		</div>



		<table style="width: 897px; background: #FFFFFF; margin: 0 auto;">
			<tr>
				<td width="695px" valign="top">
					<div id="welcome" style="border-right: #666666 1px dotted;  width:92%">
						<h1>OPEN ACCOUNT FORM</h1>
						<br>
						<table align="center" bgcolor="white" width="100%">
							<tr>
								<% if(request.getAttribute("Create_MSG") != null){ %>
								<td><%=request.getAttribute("Create_MSG") %></td>
								<%	request.removeAttribute("Create_MSG");
								} %>
							</tr>
							<tr>
								<td>
									<form name=F1 onSubmit="return dil(this)"
										action="CreateServlet">
										<table cellspacing="5" cellpadding="3" width="92%" >

											<tr>
												<td>USER NAME:</td>
												<td><input type="text" name="username" /></td>
											</tr>
											<tr>
												<td>PASSWORD:</td>
												<td><input type="password" name="password" /></td>
											</tr>
											<tr>
												<td>RE-PASSWORD:</td>
												<td><input type="password" name="repassword" /></td>
											</tr>
											<tr>
												<td>AMOUNT:</td>
												<td><input type="text" name="amount" /></td>
											</tr>
											<!-- Gender:<br/><br/>
					Male<input type="radio" name="gender" value="male"> Female<input type="radio" name="gender" value="female"/><br/><br/> -->
											<tr>
												<td>ADDRESS:</td>
												<td><input type="text" name="adderess" /></td>
											</tr>
											<tr>
												<td>PHONE:</td>
												<td><input type="text" name="phone" /></td>
											</tr>
											<tr>
												<td></td>
												<td><input type="submit" value="Submit" /> <INPUT
													TYPE=RESET VALUE="CLEAR"></td>
											</tr>
										</table>
									</form>
								</td>
							</tr>

						</table>
					</div>
				</td>

				<td width="297px" valign="top">
					<div id="welcome" style="border-right: #666666 1px dotted;">
						<h1>Welcome</h1>
						<br>
						<center>
							<img src="images/globe_10.gif" alt="business" width="196"
								height="106">
						</center>
						<br>
						<p>Each people plan their site layouts depending upon their
							business type. Here comes a free designer template which provides
							you with a selection of different kinds of webdesign starting
							from business template, fashion template, media template, Science
							template, Arts template and much more.</p>

					</div>
				</td>


			</tr>
		</table>

		<div id="footer_top">
			<div id="footer_navigation"></div>

			<div id="footer_copyright">

				<center>
					<img alt="business" width="196" height="106">
				</center>
				<br>

			</div>
		</div>
	</div>

</body>
</html>

<!-- <%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*" %> -->