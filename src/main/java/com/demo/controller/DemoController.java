package com.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.demo.service.ServiceCities;

@RestController
public class DemoController {
	
	@Autowired
	ServiceCities ser;
	
	@GetMapping("/cities")
	public String getCities () {
		return ser.cities();
	}

	
}
