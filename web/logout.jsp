

<%
    
   
    
   session.invalidate();
   RequestDispatcher rd=request.getRequestDispatcher("index.html");
   
   rd.forward(request, response);
   
   
    %>