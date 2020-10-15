package com.bike.finder.dao;

import com.bike.finder.dto.UserCreateDto;
import com.bike.finder.dto.UserUpdateDto;
import com.bike.finder.dto.UserValidateDto;
import com.bike.finder.exception.CreateUserException;
import com.bike.finder.exception.ValidateUserException;
import com.bike.finder.exception.ValidateUserLoginException;

/**
 * @author Cristian Camilo Beltrán <ccamilo2303@gmail.com>
 * @since  8 oct. 2020
 */
public interface UserDaoInterface {
	
	/**
	 * @param userDto
	 * @throws CreateUserException
	 */
	public void createUser(UserCreateDto userDto) throws CreateUserException;
	
	/**
	 * @param userValidateDto
	 * @throws ValidateUserLoginException
	 */
	public void validateExistUserLogin(UserValidateDto userValidateDto) throws ValidateUserLoginException;
	
	/**
	 * @param email
	 * @param validate
	 * @throws ValidateUserException
	 */
	public void validateExistUser(String email, boolean validate) throws ValidateUserException;
	
	
	/**
	 * @param userDto
	 * @throws CreateUserException
	 */
	public void updatePass(UserUpdateDto userDto) throws CreateUserException;
	
}
