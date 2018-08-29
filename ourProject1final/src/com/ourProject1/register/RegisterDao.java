package com.ourProject1.register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

public class RegisterDao {
	
	public void registerDetails(String fn,String ln,Date DOB,String pa,String ca,String mob,String home,String email,String pwd,String[] selected) {
		Connection con=null;
		PreparedStatement st=null,st2=null,st3=null,st4=null,st5=null;
		int uid = 0,mid = 0;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","");
		
		String sql2="insert into user(pwd,u_type,email,u_name) values(?,?,?,?)";
		st2=con.prepareStatement(sql2);
		st2.setString(1,pwd);
		st2.setString(2,"member");
		st2.setString(3,email);
		st2.setString(4,fn+" "+ln);
		st2.execute();
		
		String sql3="select uid from user where email=?";
		st3=con.prepareStatement(sql3);
		st3.setString(1,email);
		ResultSet rs = st3.executeQuery();
		 if (rs.next())
             uid = rs.getInt(1);
      
//		System.out.println(uid+" =uid");
		
		String sql="insert into member(fname,lname,DOB,p_address,c_address,mobile,home_tel,uid) values(?,?,?,?,?,?,?,?)";
		st=con.prepareStatement(sql);
		st.setString(1,fn);
		st.setString(2,ln);
		st.setDate(3,new java.sql.Date(DOB.getTime()));
		st.setString(4,pa);
		st.setString(5,ca);
		st.setString(6,mob);
		st.setString(7,home);
		st.setInt(8,uid);
		st.execute();
		
		String sql4="select mid from member where uid=?";
		st4=con.prepareStatement(sql4);
		st4.setInt(1,uid);
		ResultSet rs2 = st4.executeQuery();
		 if (rs2.next())
             mid = rs2.getInt(1);
      
//		System.out.println(mid+" =mid");
		
		for(int i=0; i<selected.length; i++){
			System.out.println(selected[i]);
			String sql5="insert into interest values(?,?)";
			st5=con.prepareStatement(sql5);
			st5.setInt(1,mid);
			st5.setString(2,selected[i]);
			st5.execute();
		}
		
		System.out.println("DB insert success");
	}
	catch(Exception e) {
		System.out.println(e);
	}
	finally {
		try {
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}
	}
}
