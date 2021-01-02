<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>

<jsp:useBean id="si" class="g.VerifyLogin1" />
<jsp:setProperty name="si" property="*"/>


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
    	
    	<% 
%>
<table>
    <%
   
  String accountn=request.getParameter("account");
  
  int account=Integer.parseInt(accountn);
       
		
       String username=request.getParameter("username");
	String password=request.getParameter("password");
	String amount1=request.getParameter("amount");
int amount=Integer.parseInt(amount1);
	  
      	//if(status==true){
		//	out.print("Welcome    " + username);
  
       boolean status=false;
        
        
       try {
	
            Class.forName("com.mysql.jdbc.Driver");
    
 
            
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebank","root","");
 

//PreparedStatement ps=con.prepareStatement("Select * from MAILCASTINGUSER where EMAILADD = ? and PASSWORD =?");
		PreparedStatement ps=con.prepareStatement("Select * from bank where account=? and username = ? and password =?");
		ps.setInt(1,account);
		ps.setString(2,username);
		ps.setString(3,password);
		
		ResultSet rs=ps.executeQuery();
		status=rs.next();
		
	 
        
        
       
        
            	if(status==true)
                {
			
         out.print("Welcome    " + username);
	 out.println("balance"+amount);	
			Class.forName("com.mysql.jdbc.Driver");
                       Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebank","root","");
		PreparedStatement st2=con2.prepareStatement("Select *  from bank where account=?");
			
            st2.setInt(1,account);
            
	ResultSet rs2=st2.executeQuery();
			
        
     
	
                      if(rs2.next()){
	
                            int am=Integer.parseInt(rs2.getString("amount"));
	
      
          amount=amount+am; 
			
        
			}
			
        
                      Connection con3=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebank","root","");
			
			PreparedStatement st3=con3.prepareStatement("update bank set amount=? where account=?");
			
         
                        st3.setInt(1,amount);
                        st3.setInt(2,account);
		        st3.executeUpdate();
                        
              		
			application.setAttribute("username", username);
                        application.setAttribute("amount", amount);
                       application.setAttribute("account", account);
			out.print("your balance has increase");
		application.setAttribute("totaldataamount",amount);
                application.setAttribute("amount1", amount1);
			
                response.sendRedirect("Totalbalance.jsp");
			%>
			<% 
			
			
		//<jsp:forward page="Totalbalance.jsp"></jsp:forward> 
					
	
                
                }           
       
		else{
			out.print("Please check your username and Password");
			request.setAttribute("balance","Please check your username and Password");
			%>
			<jsp:forward page="deposit1.jsp"></jsp:forward> 
			<% 
			}
		 
  
                }
                
            
       
     catch(Exception ex)
           
               {
               
    out.println(ex);
               }
       
		
			%></table><%
%>
    	
    	
		 </table>


  




   
