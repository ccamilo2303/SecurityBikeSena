package com.bike.finder.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.bike.finder.dto.UserCreateDto;
import com.bike.finder.dto.UserValidateDto;
import com.bike.finder.exception.CreateUserException;
import com.bike.finder.exception.ValidateUserException;
import com.bike.finder.exception.ValidateUserLoginException;
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
		Long idBicicleta = null;
		Long idGps = null;
		try {
			
			validateExistUser(userDto.getEmail());
			
			KeyHolder keyHolder = new GeneratedKeyHolder();
			String sql = "insert into Usuarios values(:nombres, :apellidos, :email, :celular, :pass, GETDATE());";

			namedParameterJdbcTemplateOne.update(sql, new BeanPropertySqlParameterSource(userDto), keyHolder,
					new String[] { "ID_Usuario" });

			idUser = keyHolder.getKey() != null ? keyHolder.getKey().longValue() : null;
			
			
			sql = "insert into Bicicleta values(:marca, :referencia, :color, :foto);";

			namedParameterJdbcTemplateOne.update(sql, new BeanPropertySqlParameterSource(userDto.getBike()), keyHolder,
					new String[] { "ID_Bicicleta" });

			idBicicleta = keyHolder.getKey() != null ? keyHolder.getKey().longValue() : null;

			
			sql = "insert into GPS values(GETDATE());";

			namedParameterJdbcTemplateOne.update(sql, new BeanPropertySqlParameterSource(new Object()), keyHolder,
					new String[] { "ID_gps" });

			idGps = keyHolder.getKey() != null ? keyHolder.getKey().longValue() : null;

			
			sql = "insert into Usuario_GPS_Bicicleta values("+idUser+", "+idBicicleta+", "+idGps+");";

			namedParameterJdbcTemplateOne.update(sql, new BeanPropertySqlParameterSource(new Object()));
			

		} catch (Exception e) {
			throw new CreateUserException(e);
		}
		
		
	}


	@Override
	public void validateExistUserLogin(UserValidateDto userValidateDto) throws ValidateUserLoginException {
		
		
		try {
			String sql = "select count(*) from Usuarios where email = :email and clave = :pass";
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("email", userValidateDto.getEmail());
			paramMap.put("pass", userValidateDto.getPass());
			System.out.println(paramMap);
			Integer c = namedParameterJdbcTemplateOne.queryForObject(sql, paramMap, Integer.class);
			
			if(c == 0)
				throw new ValidateUserLoginException("El usuario o contraseña son incorrectos");

		} catch (Exception e) {
			throw new ValidateUserLoginException(e);
		}
		
		
	}


	@Override
	public void validateExistUser(String email) throws ValidateUserException {
		

		try {
			String sql = "select count(*) from Usuarios where email = :email";
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("email", email);
			Integer c = namedParameterJdbcTemplateOne.queryForObject(sql, paramMap, Integer.class);
			
			if(c > 0)
				throw new ValidateUserLoginException("El email ya se encuentra registrado");

		} catch (Exception e) {
			throw new ValidateUserException(e);
		}
		
	}
	
}