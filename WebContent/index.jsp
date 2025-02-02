<%@ page import="g.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Global Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function ctck()
{
var sds = document.getElementById("dum");

}
function dil(form)
{
   for(var i=0; i<form.elements.length; i++)
   {
		if(form.elements[i].value == "")
		{
		   alert("Fill out all Fields")
		   document.F1.accountno.focus()
		   return false
		}
   }

   if(isNaN(document.F1.accountno.value))
   {
       alert("Accountno must  be  number & can't be null")
	   document.F1.accountno.value=""
	   document.F1.accountno.focus()
	   return false
   }
   if(!isNaN(document.F1.username.value))
   {
       alert("User Name  must  be  char's & can't be null")
	   document.F1.username.value=""
	   document.F1.username.focus()
	   return false
   }

   if(!isNaN(document.F1.password.value))
   {
       alert("Password  must  be  char's & can't be null")
	   document.F1.password.value=""
	   document.F1.password.focus()
	   return false
   }
   
   return true   
}
</script>

</head>

<body>

<div id="top_links">
  

<div id="header">
	<h1>APANA - BANK<span class="style1"></span></h1>
    <h2></h2>	

</div>
<% UserDetails userDetails = (UserDetails) request.getSession().getAttribute("UserDetails");
boolean status = false;
if(userDetails != null){
	status = true;
} else {
	String num =request.getParameter("accountno");
	int accountno=num == null || num.isEmpty() ? 0 : Integer.parseInt(num);
    String username=request.getParameter("username");
	String password=request.getParameter("password");
    status= username == null ? false: verifyLogin1.checkLogin(accountno,username,password);
    if(status){
    	userDetails = new UserDetails(username, password, accountno);
    	request.getSession().setAttribute("UserDetails", userDetails);
    }
}
%>
<div id="navigation">
    <ul>
    <%if(!status){%>
    <li><a href="create.html">NEW ACCOUNT</a></li>
    <% } else { %>
    <li><a href="balance.jsp">BALANCE</a></li>
    <li><a href="deposit1.jsp">DEPOSIT</a></li>
    <li><a href="withdraw1.jsp">WITHDRAW</a></li>
    <li><a href="transfer1.jsp">TRANSFER</a></li>
    <li><a href="closeac1.jsp">CLOSE A/C</a></li>
    <li> <a href="about.jsp">LOGOUT</a></li>
    <% } %>
    </ul>
</div>


<table cellpadding="0" cellspacing="0" id="content1"><tr align="justify">
	<td class="con" valign="top">
    	<div id="heade1"><h1>Results</h1></div>
    	<% 
    		if(status){
    	%>
    		<table cellspacing="5" cellpadding="3" style="color: white">	
		   		<tr>
		   			<td>ACCOUNT NO:</td>
		   			<td> <%=userDetails.getAccNo() %></td>
	   			</tr>
				<tr>
					<td>USER NAME:</td>
					<td>  <%=userDetails.getUsername() %></td>
				</tr>
             </table>
        <% } else { %>
			<form method="POST" name=F1 onSubmit="return dil(this)" action="index.jsp" >
				<table cellspacing="5" cellpadding="3" style="color: white">	
			   		<tr>
			   			<td>ACCOUNT NO:</td>
			   			<td> <input type="text" name="accountno"/></td>
		   			</tr>
					<tr>
						<td>USER NAME:</td>
						<td> <input type="text" name="username"/></td>
					</tr>
					<tr>
						<td>PASSWORD:</td>
						<td> <input type="password" name="password"/></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Submit"/> <input type=reset value="Clear"></td>
					</tr>
             	</table>
			</form>
			<% } %>
    </td>
    
    <td class="con" valign="top">
    	<div id="heade2"><h1></h1></div>
 <p>Opportunities</p> 
 <p>These Global Business bank would be idle for building a successful online businesses.</p>
    </td>
    
    <td class="con" valign="top">
    	<div id="heade3"><h1></h1></div>
       
     
      <p> Solutions</p>
        
    </td>
</tr></table>

<table style="width:897px; background:#FFFFFF; margin:0 auto;"><tr align="justify">
	<td width="299" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="services"><h1></h1><br>
		    <ul>
        	<li><a href="#">www.javatpoint.com</a></li>
            <li><a href="#">www.javacstpoint.com </a></li>
            <li><a href="#">www.javatpoint.com/forum.jsp</a></li>
            </ul>
			
       </div>
	</td>
    
    <td width="299" valign="top">
    	<div id="welcome" style="border-right:#666666 1px dotted;"><h1>Welcome</h1><br>
    	    <center><img src="images/globe_10.gif" alt="business" width="196" height="106"></center><br>
		   
	    </div>      
    </td>
    
    <td width="299" valign="top">
   	  <div id="news"><h1>News &amp; Events</h1><br>
      	<div class="img"><img src="images/globe_12.gif" alt="Business"></div>
        <h2> </h2>
        <p></p><br>
        <div class="img"><img src="images/globe_16.gif" alt="Business"></div>
        <h2> </h2>
        <p></p>
      
      </div>
        	
     </td>
</tr></table>

<div id="footer_top">
  <div id="footer_navigation">
  

  </div>
  
  <div id="footer_copyright" >
 
    	    <center><img  alt="business"  width="196" height="106"></center><br>
		    <p></p>
	  
</div>
</div>

<script type="text/javascript">
document.onload = ctck();
</script>
</div>

</body>

</html>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*" %>