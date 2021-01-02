
<%@page import="java.sql.*" %>


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
</script>

</head>

<body>

<div id="top_links">
  

<div id="header">
	<h1>APANA - BANK<span class="style1"></span></h1>
    <h2>ExtraOrdinary Service</h2>
    <A href="index.html"><IMG SRC="images/home1.gif"></IMG></A>	
</div>

<div id="navigation">
    <ul>
    <li><a href="create.html">NEW ACCOUNT</a></li>
    <li><a href="balance1.jsp">BALANCE</a></li>
    <li><a href="deposit1.jsp">DEPOSIT</a></li>
    <li><a href="withdraw1.jsp">WITHDRAW</a></li>
    <li><a href="transfer1.jsp">TRANSFER</a></li>
    <li><a href="closeac1.jsp">CLOSE A/C</a></li>
    <li><a href="about.jsp">Contact Us</a></li>
    </ul>
</div>



<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
	<td width="300" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="services"><h1>Services</h1><br>
		    <ul>
        	<li><a href="#">www.javatpoint.com</a></li>
            <li><a href="#">www.javacstpoint.com </a></li>
            <li><a href="#">www.javatpoint.com/forum.jsp</a></li>
            </ul>
			
       </div>
	</td>
    
    <td width="1200" valign="top">
    	
    
<table>


    <%

 
 try 

{
    
    String id=(String)session.getAttribute("id");
   
    if(!id.equals(""))
    
    {
    
    int count=0;
		 
   Class.forName("com.mysql.jdbc.Driver");
   
   
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebank","root","");
 
    
  PreparedStatement st=con.prepareStatement("Select Max(account) as ac from bank");
  
  
  ResultSet rs1=st.executeQuery();
  
          
          while(rs1.next())
               
           {
          int account=rs1.getInt("ac");
        	     application.setAttribute("account",account);
	
           }
           
         int account=(Integer)application.getAttribute("account");
out.print("<table align='left'  cellspacing='5' cellpadding='5'>");
	
       //out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>PASSWORD</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>");
          
    %>



<%
                    
 PreparedStatement ps=con.prepareStatement("Select * from bank where account=? ");

      ps.setInt(1,account);
	
       ResultSet rs2=ps.executeQuery();
                        
             if(rs2.next())
                           

   {
       
           

       
       out.print("<table align='left'  cellspacing='5' cellpadding='5'>");
	
       out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>PASSWORD</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>");
//			while(rs.next()){
				
//				session.setAttribute("accountno",accountno);
				
              				

                 out.print("<tr>");
				
                 out.println("<td>"+rs2.getInt("account")+"</td>");
                 
                                out.print("<td>" + rs2.getString("username") + "</td>");
				out.print("<td>" + rs2.getString("password") + "</td>");
				out.print("<td>" + rs2.getString("amount") + "</td>");
				out.print("<td>" + rs2.getString("adderess") + "</td>");
				
                                out.println("<td>" +rs2.getString("phone") +"</td>");
                                
        		    
				out.print("</tr>");
                                
                               
			    
application.setAttribute("account", account);
                        
                       

                        





			out.print("</table>");
                        
                        %>
                        
                        <br>
                        <br>
                        
                        <%
                        
			
			out.print("<table align='left'width='70%'>");
	
                       
                        out.print("<td><br><br><br><br><a href='#'>COMPOSE</a></td>");
			out.print("<td><br><br><br><br><a href='#'>INBOX</a></td>");
			out.print("<td><br><br><br><br><a href='logout.jsp'>LOGOUT</a></td>");
			out.print("<td><br><br><br><br><a href='#'>DELETE</a></td></tr>");
			
		out.print("</table>");
	
        } 
      

}
   
   else
       
   {
    RequestDispatcher rd=request.getRequestDispatcher("index.html");
    
    rd.forward(request, response);
   
       
   }
 
}  
    
            
       
                 
                
   catch (Exception ex) 
          
          {
			
    RequestDispatcher rd=request.getRequestDispatcher("index.html");
    
    rd.forward(request, response);
		}

    
                        %>

</table>

    	
   		</table>


