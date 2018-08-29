package com.BookClub.web.model;

public class ChangePw {

	private String oldpw;
	private String newpw;
	private String checkpw;
	private String email;
	
	public String getCheckpw() {
		return checkpw;
	}
	public void setCheckpw(String checkpw) {
		this.checkpw = checkpw;
	}
	public String getNewpw() {
		return newpw;
	}
	public void setNewpw(String newpw) {
		this.newpw = newpw;
	}
	public String getOldpw() {
		return oldpw;
	}
	public void setOldpw(String oldpw) {
		this.oldpw = oldpw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}


}
