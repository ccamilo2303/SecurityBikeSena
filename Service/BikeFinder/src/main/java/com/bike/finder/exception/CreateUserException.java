package com.bike.finder.exception;
/**
 * @author Cristian Camilo Beltrán <ccamilo2303@gmail.com>
 * @since  8 oct. 2020
 */
public class CreateUserException extends Exception {

	
	private static final long serialVersionUID = 1L;
	

	public CreateUserException() {
		super();
	}

	public CreateUserException(String message) {
		super(message);
	}

	public CreateUserException(String message, Throwable cause) {
		super(message, cause);
	}

	public CreateUserException(Throwable cause) {
		super(cause);
	}


}
