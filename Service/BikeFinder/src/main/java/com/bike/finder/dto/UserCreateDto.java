package com.bike.finder.dto;
/**
 * @author Cristian Camilo Beltrán <ccamilo2303@gmail.com>
 * @since  8 oct. 2020
 */
public class UserCreateDto {
	
	private String nombres;
	private String apellidos;
	private String email;
	private int celular;
	private String pass;
	private BikeDto bike;
	
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCelular() {
		return celular;
	}
	public void setCelular(int celular) {
		this.celular = celular;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public BikeDto getBike() {
		return bike;
	}
	public void setBike(BikeDto bike) {
		this.bike = bike;
	}

	@Override
	public String toString() {
		return "UserCreateDto [nombres=" + nombres + ", apellidos=" + apellidos + ", email=" + email + ", celular="
				+ celular + ", pass=" + pass + ", bike=" + bike + "]";
	}
	
}
