<%@page import="g.*" %>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%UserDetails userDetails = (UserDetails) request.getSession().getAttribute("UserDetails");
if(userDetails == null){ %>
	<script type="text/javascript">
window.location.assign("/OnlineBankingServ");
</script>
<%} %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html><!-- InstanceBegin template="/Templates/article_about_us.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<title>About Us - APANA-BANK,</title>
<a href="index.html"><IMG SRC="images/home1.gif"></IMG></A>
</head>

<body >

<table width="100%"  border="0" cellpadding="0" cellspacing="0">
              </TABLE>
          
            <br>
            <br>
            <br>
                          
                  <p id="display"></p>
  ARE YOU SURE YOU WANT to LOGOUT? <br>
  <br>
<button type="button" value="YES"> YES
<% session.invalidate(); %>
<% response.sendRedirect("index.jsp"); %>
</button> 
  

                   
                          
  <table width="100%"  border="0" cellspacing="7" cellpadding="0">
        
        <tr> 
          <td>
<div align="center"> </div></td>
        </tr>
      </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><img src="" width="915" height="1"></td>
    </tr>
  </table>
	</td>
  </tr>
</table>

</body>
<!-- InstanceEnd -->
<script>
function myFunction()
{
	var today = new Date();
	var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
	//document.write(time);
	LogoutServlet.doGet();
	//window.location.replace("http://localhost:8080/OnlineBankingServ/index.jsp");
}

</script>  
 
</html>