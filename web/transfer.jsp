
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>

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
		
		String num1=request.getParameter("taccount");
	int taccount=Integer.parseInt(num1);
		
		String amoun=request.getParameter("amount");
	       int amount=Integer.parseInt(amoun);
		//accountno=taccountno;
	   	//if(status==true){
		//	out.print("Welcome    " + username);
	
               
               
                   boolean status=false;
        
        
      try 
       {
	
            Class.forName("com.mysql.jdbc.Driver");
    
 
            
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebank","root","");
 

//PreparedStatement ps=con.prepareStatement("Select * from MAILCASTINGUSER where EMAILADD = ? and PASSWORD =?");
		PreparedStatement ps=con.prepareStatement("Select * from bank where account=? and username =? and password =?");
		ps.setInt(1,account);
		ps.setString(2,username);
		ps.setString(3,password);
		
		ResultSet rs=ps.executeQuery();
		status=rs.next();
		
	 
        
        
       
               
            	if(status==true)
                {

               out.print("<br>&nbsp<font size=4>Welcome   " + username);
		
//                PreparedStatement st2=con.prepareStatement("Select * from bank where account=?");
  //                 st2.setInt(1,account);
//	          ResultSet rs2=st2.executeQuery();
      
                  
        int dataamount=0;
        	
        boolean status2=false;
                        
         PreparedStatement st=con.prepareStatement("Select * from bank where account=?");
			
           st.setInt(1,taccount);
	ResultSet rs3=st.executeQuery();
	
                 status2=rs3.next();
			
		if(status2==true)
                        {
                            
                            
			dataamount=amount+rs3.getInt("amount"); 
			
			
		

                        
                       
    
 PreparedStatement st3=con.prepareStatement("update bank set amount=? where account=?");
	st3.setInt(1,dataamount);
	st3.setInt(2,taccount);
        st3.executeUpdate();

           
           }
        

        PreparedStatement st4=con.prepareStatement("Select * from bank where account=?");
                        
       st4.setInt(1, taccount);
                        
          ResultSet rs4=st4.executeQuery();
		
		
if(rs4.next())
    
                        {
                            
                            application.setAttribute("amount", amount);

				application.setAttribute("targetamount",dataamount);
                        }
        PreparedStatement ps5=con.prepareStatement("Select * from bank where account=?");
			
            ps5.setInt(1,account);
     
            ResultSet rs5=ps5.executeQuery();

			int dataamount1=0;
			if(rs5.next())
                        {
                            
                           
			dataamount1=rs5.getInt("amount")-amount; 
			}
			
			PreparedStatement ps6=con.prepareStatement("update bank set amount=? where account=?");
			ps6.setInt(1,dataamount1);
                        ps6.setInt(2, account);
			ps6.executeUpdate();
                        
                       
		
			
			
                        PreparedStatement ps7=con.prepareStatement("Select * from bank where account=?");
			
                        ps7.setInt(1,account);
                        ResultSet rs7=ps7.executeQuery();
                        if(rs7.next())
                        {
		
	                application.setAttribute("targetamount",dataamount);
			application.setAttribute("sendamount",dataamount1);	
			
response.sendRedirect("tbalance.jsp");

                        }
                        
                          else
                    
                    
                {
                 
                    out.println("The Target Account No. Is Invalid");
                       
                }
       
%>
			<% 
		
	                 
			//out.print("your balance has increase");
			//request.setAttribute("totaldataamount",dataamount);
			//request.setAttribute("balance","your balance has decrease");	
		
			//}
			
			//out.print("your balance has increase");
			//request.setAttribute("totaldataamount",dataamount);
			//request.setAttribute("balance","your balance has increase");	
			//}
		
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
                
                 
                
                  
                
    else
       
       {
			out.print("Please check your username and Password and target accountno");
			request.setAttribute("balance","Please check your username and Password and target acountno");
			//response.sendRedirect("tbalance.jsp");
   }

               %>
			
			<% 
	 }
                
       
              catch (Exception ex)
                       {
			out.println(ex);
		}
		
		
			%></table><%
%>
    	
    	
		 </table>




   
