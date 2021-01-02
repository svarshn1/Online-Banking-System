

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package g;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


/**
 *
 * @author Nitish
 */
public class VerifyLogin1 {
    
    
    
    public static boolean checkLogin(int account,String username,String password)
{
	boolean status=false;
	//Connection con=GetCon.getCon();
	
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
		
	} 
        
        catch (SQLException ex) {

            System.out.println(ex);
	}
	return status;
}

    
}
