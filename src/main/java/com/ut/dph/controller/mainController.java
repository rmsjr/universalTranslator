package com.ut.dph.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
 * The mainController class will handle all URL requestions that fall outside of
 * specific user or admin controllers
 * 
 * eg. login, logout, about, etc
 * 
 * @author chadmccue
 *
 */

@Controller
public class mainController {
	
	
	/**
	 * The '/login' request will serve up the login page.
	 * 
	 * @param request
	 * @param response
	 * @return				the login page view
	 * @throws Exception
	 */
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
		
		return new ModelAndView("login");
 
	}

	
	/**
	 * The '/loginfailed' request will serve up the login page displaying the
	 * login failed error message
	 * 
	 * @param request
	 * @param response
	 * @return				the error object and the login page view
	 * @throws Exception
	 */
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public ModelAndView loginerror(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
 
		ModelAndView mav = new ModelAndView();
        mav.setViewName("login");
        mav.addObject("error", "true");
        return mav;
 
	}
	
	/**
	 * The '/logout' request will handle a user logging out of the system. The request
	 * will handle front-end users or administrators logging out.
	 * 
	 * @param request
	 * @param response
	 * @return				the login page view
	 * @throws Exception
	 */
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
		
		return new ModelAndView("login");
 
	}

	/**
	 * The '/' request will be the default request of the translator. The request will
	 * serve up the home page of the translator.
	 * 
	 * @param request
	 * @param response
	 * @return				the home page view
	 * @throws Exception
	 */
	 @RequestMapping(value = "/", method = RequestMethod.GET)
	 public ModelAndView welcome(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
		
		return new ModelAndView("home");
 
	}
	 

}
