package com.ourProject1.userView;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserViewDao {
	
	public void updateDetails(String email,String pa,String ca,String mob,String home,String[] selected) {
		Connection con=null;
		int mid=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","");
			String sql1="select mid from member where uid=(select uid from user where email=?)";
			PreparedStatement st1=con.prepareStatement(sql1);
			st1.setString(1,email);
			ResultSet rs1 = st1.executeQuery();
			 if (rs1.next())
	             mid = rs1.getInt(1);
			 
			 String sql2="UPDATE member SET p_address=?,c_address=?,home_tel=?,mobile=? WHERE mid=?";
			 PreparedStatement st2=con.prepareStatement(sql2);
				st2.setString(1,pa);
				st2.setString(2,ca);
				st2.setString(3,home);
				st2.setString(4,mob);
				st2.setInt(5,mid);
				st2.execute(); 
			 
				//DELETE FROM `interest` WHERE mid=15
				String sql3="DELETE FROM interest WHERE mid=?";
				 PreparedStatement st3=con.prepareStatement(sql3);
					st3.setInt(1,mid);
					st3.execute(); 
				
				for(int i=0; i<selected.length; i++){
					System.out.println(selected[i]);
					String sql4="insert into interest values(?,?)";
					PreparedStatement st4=con.prepareStatement(sql4);
					st4.setInt(1,mid);
					st4.setString(2,selected[i]);
					st4.execute();
				}
				
				System.out.println("DB insert success");
			 
		}
		catch(Exception e) {
			System.out.println(e);
		}
		finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
}
