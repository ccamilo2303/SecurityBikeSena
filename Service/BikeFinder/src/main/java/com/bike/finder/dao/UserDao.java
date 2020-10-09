package com.bike.finder.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.bike.finder.dto.UserCreateDto;
import com.bike.finder.exception.CreateUserException;
/**
 * @author Cristian Camilo Beltrán <ccamilo2303@gmail.com>
 * @since  8 oct. 2020
 */
@Repository
public class UserDao implements UserDaoInterface{

	@Autowired
    @Qualifier("datasourcePrimary")
    private NamedParameterJdbcTemplate namedParameterJdbcTemplateOne;

	@Override
	public void createUser(UserCreateDto userDto) throws CreateUserException{

		Long idUser = null;
		try {
			KeyHolder keyHolder = new GeneratedKeyHolder();
			String sql = "insert into Usuarios values(:nombres, :apellidos, :email, :celular, :pass, GETDATE());";

			namedParameterJdbcTemplateOne.update(sql, new BeanPropertySqlParameterSource(userDto), keyHolder,
					new String[] { "id" });

			idUser = keyHolder.getKey() != null ? keyHolder.getKey().longValue() : null;

			System.out.println("Insert done. Record Id: " + idUser);

		} catch (Exception e) {
			throw new CreateUserException(e);
		}
		
		
	}
	
}
