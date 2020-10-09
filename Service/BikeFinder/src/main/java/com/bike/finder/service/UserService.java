package com.bike.finder.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bike.finder.dao.UserDao;
import com.bike.finder.dto.UserCreateDto;
import com.bike.finder.dto.UserValidateDto;
import com.bike.finder.exception.CreateUserException;
import com.bike.finder.exception.ValidateUserException;

/**
 * @author Cristian Camilo Beltrán <ccamilo2303@gmail.com>
 * @since  8 oct. 2020
 */
@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackForClassName = { "Exception" })
	public void createUser(UserCreateDto userCreateDto) throws CreateUserException{
		userDao.createUser(userCreateDto);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackForClassName = { "Exception" })
	public void validateUser(UserValidateDto userValidateDto) throws ValidateUserException{
		
	}
	
}
