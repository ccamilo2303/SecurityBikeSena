package com.bike.finder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bike.finder.dto.ResponseDto;
import com.bike.finder.dto.UserCreateDto;
import com.bike.finder.dto.UserUpdateDto;
import com.bike.finder.dto.UserValidateDto;
import com.bike.finder.service.UserService;

/**
 * @author Cristian Camilo Beltrán <ccamilo2303@gmail.com>
 * @since  8 oct. 2020
 */
@RestController
@RequestMapping("/user")
@CrossOrigin(origins = "*", methods= {RequestMethod.GET, RequestMethod.POST})
public class UserController {
	
	@Autowired
	private UserService userService;

	@PostMapping
	public ResponseDto createUser(@RequestBody UserCreateDto userCreateDto) {
		try {
			System.out.println("ENTRÓ "+userCreateDto);
			userService.createUser(userCreateDto);
			return new ResponseDto(HttpStatus.OK, "Ok");
		}catch(Exception e) {
			e.printStackTrace();
			return new ResponseDto(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage().replace("com.bike.finder.exception.ValidateUserException:", "").replace("com.bike.finder.exception.ValidateUserLoginException:", ""));
		}
	}
	
	@GetMapping("/{email}/{pass}")
	public ResponseDto validateUser(@PathVariable("email")String email, @PathVariable("pass")String pass) {
		try {
			System.out.println("MEIAL : "+email);
			System.out.println("pass : "+pass);
			UserValidateDto userValidateDto = new UserValidateDto();
			userValidateDto.setEmail(email);
			userValidateDto.setPass(pass);
			userService.validateUser(userValidateDto);
			return new ResponseDto(HttpStatus.OK, "Ok");
		}catch(Exception e) {
			e.printStackTrace();
			return new ResponseDto(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage().replace("com.bike.finder.exception.ValidateUserLoginException:", ""));
		}
	}
	
	@PutMapping
	public ResponseDto updatePass(@RequestBody UserUpdateDto userUpdate) {
		try {
			userService.updatePass(userUpdate);
			return new ResponseDto(HttpStatus.OK, "Ok");
		}catch(Exception e) {
			e.printStackTrace();
			return new ResponseDto(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage().replace("com.bike.finder.exception.ValidateUserException:", "").replace("com.bike.finder.exception.ValidateUserLoginException:", ""));
		}
	}
	
}