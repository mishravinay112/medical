package com.medical.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestRest
{
	
	@RequestMapping(value = "/name", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	 public ResponseEntity<String> restTest(HttpServletRequest req) 
	{

	  // String userName=(String)req.getSession(false).getAttribute("userName");
	  String name=req.getParameter("name");
	  
System.out.println("inside restcontroller");
	   return new ResponseEntity<String>("Hello "+name, HttpStatus.OK);
	   
	  }

}
