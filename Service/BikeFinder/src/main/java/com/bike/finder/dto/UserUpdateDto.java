package com.bike.finder.dto;
/**
 * @author Cristian Camilo Beltrán <ccamilo2303@gmail.com>
 * @since  14 oct. 2020
 */
public class UserUpdateDto {
	
	private String email;
	private String pass;

	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
}
