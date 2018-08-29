package com.ourProject1.login.dao;

import java.sql.*;
import com.ourProject1.login.model.Login;

public class LoginDao {
	
	public Login getUserName(String memberID) {
		Login l=new Login();
		String c="asd@gmail.com";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","");
			//Statement st=con.createStatement();
			String sql="select * from user where email=?";
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,memberID);
			ResultSet rs=st.executeQuery();
			System.out.println("idu vara working");
			
			if(rs.next()) {
				
				 l.setName(rs.getString("u_name"));
				 l.setPass(rs.getString("pwd"));
				 l.setEmail(rs.getString("email"));
				 l.setUid(rs.getInt("uid"));
				 l.setU_type(rs.getString("u_type"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return l;
	}
}
