package com.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.demo.service.ServiceCountries;

@RestController
public class Controller2 {
	
	@Autowired
	ServiceCountries ser;
	
	@GetMapping("/contries")
	public String getContries () {
		return ser.contries();

	}

	
}
