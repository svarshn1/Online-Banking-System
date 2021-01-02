
<%@page import="java.sql.*" %>
<%

    int count=0;
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String  repassword=request.getParameter("repassword");
		
		int amount=Integer.parseInt(request.getParameter("amount"));
	
		
		String adderess=request.getParameter("adderess");
		
		String phone=request.getParameter("phone");
		
  	   
count=count+1;
        
   if(count>=1)
        
        {
            
            
   try
       
   
   {
   Class.forName("com.mysql.jdbc.Driver");
   
   
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebank","root","");
 
 
 PreparedStatement st=con.prepareStatement("insert into bank(username,password,repassword,amount,adderess,phone) values(?,?,?,?,?,?)");

 
 
 st.setString(1, username);
 st.setString(2, password);
 st.setString(3, repassword);
st.setInt(4, amount);
st.setString(5,adderess);
st.setString(6, phone);
       

st.executeUpdate();


 session.setAttribute("id", password);
 
response.sendRedirect("index.jsp");


//RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
 //rd.forward(request, response);


out.print("WELCOME! YOUR ACCOUNT HAS OPENED");
		
   }

   
 catch(Exception ex)
     
 {
  
     
     out.println(ex);
 }
   
        }
 
           
  else
   {
			out.print("Sorry,Registration failed. please try later");
			//RequestDispatcher rd=request.getRequestDispatcher("MyHtml.html");
			//rd.include(request, response);
		}
		
	

%>