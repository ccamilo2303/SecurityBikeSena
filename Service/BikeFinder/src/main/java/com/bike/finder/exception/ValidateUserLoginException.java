package com.bike.finder.exception;
/**
 * @author Cristian Camilo Beltrán <ccamilo2303@gmail.com>
 * @since  8 oct. 2020
 */
public class ValidateUserLoginException extends Exception {

	
	private static final long serialVersionUID = 1L;
	

	public ValidateUserLoginException() {
		super();
	}

	public ValidateUserLoginException(String message) {
		super(message);
	}

	public ValidateUserLoginException(String message, Throwable cause) {
		super(message, cause);
	}

	public ValidateUserLoginException(Throwable cause) {
		super(cause);
	}


}
