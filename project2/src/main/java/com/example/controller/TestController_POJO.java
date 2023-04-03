package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

public class TestController_POJO implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {
	
		System.out.println("여기까지 오는지 확인~!");
	
		ModelAndView mv1 = new ModelAndView("test");
		mv1.addObject("data1", "스프링 MVC의 모델이에요~!");
//		mv1.setViewName("test");
		
		InternalResourceViewResolver resolver1;
		
		return mv1;
 }
}