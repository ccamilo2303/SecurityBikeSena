package com.bike.finder.exception;

public class ValidateUserException extends CreateUserException{

	/**
	 * 
	 */
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
