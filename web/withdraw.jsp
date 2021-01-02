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
<table><%
        String num=request.getParameter("account");
		int account=Integer.parseInt(num);
        String username=request.getParameter("username");
		String password=request.getParameter("password");
		String amount2=request.getParameter("amount");
	int amount1=Integer.parseInt(amount2);
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

                	out.print("<br>&nbsp<font size=4>Welcome    " + username);
		
                PreparedStatement st2=con.prepareStatement("Select * from bank where account=?");
           st2.setInt(1,account);
	ResultSet rs2=st2.executeQuery();
			
        
        		
        		int amount=0;
			
			if(rs2.next())
                        {
                  amount=rs2.getInt("amount")-amount1; 
			
			}
			
			PreparedStatement st=con.prepareStatement("update bank set amount=? where account=?");
			st.setInt(1,amount);
			st.setInt(2, account);
                        st.executeUpdate();
		
		
        PreparedStatement st3=con.prepareStatement("Select * from bank where account=?");
        
           st3.setInt(1,account);
                         
		ResultSet rs3=st3.executeQuery();
	
                if(rs3.next())
                {
		
                    
                  application.setAttribute("totaldataamount",amount);
		
                  application.setAttribute("amount1", amount1);
                      response.sendRedirect("Totalbalance.jsp");
                        
			%>
			<% 
			}
			
			/*out.print("<table align='left' width='50%' border='4' bgcolor='###FFF'>");
			out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>");
			while(rs.next()){
			    int accountno1=rs.getInt(1);
				session.setAttribute("accountno",accountno1);
				
				System.out.print(accountno);
				
				out.print("<tr>");
				out.print("<td>" + rs.getInt(1) + "</td>");
				out.print("<td>" + rs.getString(2) + "</td>");
				out.print("<td>" + rs.getInt(5) + "</td>");
				out.print("<td>" + rs.getString(6) + "</td>");
				out.print("<td>" + rs.getInt(7) + "</td>");
				//out.print("<td><a href='DeleteServlet' >Delete</a></td>");
			
				out.print("</tr>");
			
			}
			out.print("</table>");
			
			
			*/
		}
		else{
			out.print("Please check your username and Password");
			request.setAttribute("balance","Please check your username and Password");
			%>
			<jsp:forward page="withdraw1.jsp"></jsp:forward> 
			<%
                        
			}
		 }catch (SQLException e) {
			e.printStackTrace();
		}
		
	
			%></table><%
%>
    	
    	
		 </table>


<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>



   
