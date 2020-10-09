package com.bike.finder.dao;

import com.bike.finder.dto.UserCreateDto;
import com.bike.finder.exception.CreateUserException;

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
	
}
