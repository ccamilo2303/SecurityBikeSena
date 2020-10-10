package com.bike.finder.dto;

import org.springframework.http.HttpStatus;
/**
 * @author Cristian Camilo Beltrán <ccamilo2303@gmail.com>
 * @since  9 oct. 2020
 */
public class ResponseDto {

	private HttpStatus statusCode;
	private String message;
	
	
	
	public ResponseDto(HttpStatus statusCode, String message) {
		super();
		this.statusCode = statusCode;
		this.message = message;
	}
	
	
	
	public HttpStatus getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(HttpStatus statusCode) {
		this.statusCode = statusCode;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
