package com.ourProject1.login.model;

import javax.management.loading.PrivateClassLoader;

public class Login {
		private String Name;
		private String Pass;
		private String email;
		private int uid;
		private String u_type;
		 
		public String getName() {
			return Name;
		}
		public 
		void setName(String name) {
			Name = name;
		}
		public String getPass() {
			return Pass;
		}
		public void setPass(String pass) {
			Pass = pass;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public int getUid() {
			return uid;
		}
		public void setUid(int uid) {
			this.uid = uid;
		}
		public String getU_type() {
			return u_type;
		}
		public void setU_type(String u_type) {
			this.u_type = u_type;
		}
		
}
