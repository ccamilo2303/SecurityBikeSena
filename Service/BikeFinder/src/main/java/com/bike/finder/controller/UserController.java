package com.bike.finder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bike.finder.dto.UserCreateDto;
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
	public void createUser(@RequestBody UserCreateDto userCreateDto) {
		try {
			System.out.println("ENTRÓ "+userCreateDto);
			userService.createUser(userCreateDto);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping
	public void validateUser(@RequestBody UserValidateDto userValidateDto) {
		
	}
	
	
}
