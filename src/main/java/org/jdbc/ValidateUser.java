package org.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.SQLException;

public class ValidateUser {

	public int validateLogin(String user, String pass) {
		try {
			boolean flag1=false,flag2=false;
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
			
			  
			  PreparedStatement ps1=con.prepareStatement("select * from usercred where username=?");
			  ps1.setString(1, user); 
			  ResultSet rs1=ps1.executeQuery();
			  
			  if(rs1.next()) {flag1=true;}
			 
			PreparedStatement ps = con.prepareStatement("select * from usercred where username=? and password=?");
			ps.setString(1, user);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			if (rs.next())
				flag2=true;
			
			if(flag1 && flag2) return 0;
			else if(flag1 && flag2!=true) return 1;
			else if(!flag1 && !flag2) return 2;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return -1;

	}

	public int validateSignup(String user, String pass, String mail, String mobile) {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
			PreparedStatement ps1 = con.prepareStatement("select * from usercred where username = ?");
			ps1.setString(1, user);
			ResultSet rs = ps1.executeQuery();
			if (rs.next())
				return 1; 
			
			
			
			PreparedStatement ps2 = con.prepareStatement("select mailid from usercred where mailid = ?");
			ps2.setString(1, mail);
			ResultSet rs1 = ps2.executeQuery();
			if (rs1.next())
				return 2;
			
			
		
			PreparedStatement ps3 = con.prepareStatement("select mobileno from usercred where mobileno = ?");
			ps3.setString(1, mobile);
			ResultSet rs2 = ps3.executeQuery();
			if (rs2.next())
				return 3;
			
			
			PreparedStatement ps = con
					.prepareStatement("Insert into usercred(username,password,mailid,mobileno) Values(?,?,?,?)");
			ps.setString(1, user);
			ps.setString(2, pass);
			ps.setString(3, mail);
			 ps.setString(4,mobile);
			ps.executeUpdate();

			return 0;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return -1;

	}
}