package com.BookClub.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.BookClub.web.model.ChangePw;
import com.BookClub.web.model.ForgotPw;

public class ChangePwDao {
	
	public void SetPassword(String uemail,String newpw)
	{
	ChangePw fp=new ChangePw();
	
	
	
	try {
	
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","");
		PreparedStatement st=con.prepareStatement("update user set pwd=? where email=?");
		
		st.setString(1, newpw);
		st.setString(2, uemail);
		
		
		int i = st.executeUpdate();
		if(i > 0)
		{
		System.out.print("Record Updated Successfully");
		}
		else
		{
		System.out.print("There is a problem in updating Record.");
		} 
		

		

			st.close();
			con.close();

	}
	catch(Exception e)
	{
		System.out.println(e);
		
	}

	
}
	
	public ChangePw getEmailAndPW(String uemail )
	{
		ChangePw fp=new ChangePw();
		
		try {
		
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","");
			PreparedStatement st=con.prepareStatement("select email,pwd from user where email=?");
			st.setString(1, uemail);
			ResultSet rs=st.executeQuery();
			
			if(rs.next())
			{
				
				fp.setOldpw(rs.getString("pwd"));
				fp.setEmail(rs.getString("email"));
				

			}
			rs.close();
			st.close();
			con.close();
			
		}
		catch(Exception e)
		{
			System.out.println(e);
			
		}
		return fp;
		
		
		
	}
}
