package com.bike.finder.exception;
/**
 * @author Cristian Camilo Beltrán <ccamilo2303@gmail.com>
 * @since  8 oct. 2020
 */
public class ValidateUserException extends Exception {

	
	private static final long serialVersionUID = 1L;
	

	public ValidateUserException() {
		super();
	}

	public ValidateUserException(String message) {
		super(message);
	}

	public ValidateUserException(String message, Throwable cause) {
		super(message, cause);
	}

	public ValidateUserException(Throwable cause) {
		super(cause);
	}


}
