package com.olakunle.taskapp.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
//import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.olakunle.taskapp.model.User;
import com.olakunle.taskapp.service.UserService;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author olakunle
 */
@Controller
@RequestMapping("/")
public class AppController {

    @Autowired
    MessageSource messageSource;
    
    @Autowired
    private UserService userService;

    /**
     * This method will list all existing users.
     */
    @RequestMapping(value = {"/", "/list"}, method = RequestMethod.GET)
    public String listUsers(ModelMap model) {

        //List<User> users = userService.findAllUsers();
        //model.addAttribute("users", users);
        System.out.println("I am inside here");
        return "userslist";
    }

    /**
     * This method will provide the medium to add a new user.
     */
    @RequestMapping(value = {"/newuser"}, method = RequestMethod.GET)
    public String newUser(ModelMap model) {
        User user = new User();
        model.addAttribute("user", user);
        model.addAttribute("edit", false);
        return "registration";
    }

    @RequestMapping(value = "/test.htm", method = RequestMethod.GET)
    public ModelAndView getUser(ModelMap map) {

      

        map.addAttribute("user", new User());
        map.addAttribute("users", userService.findAllUsers());        
        return new ModelAndView("userlist", map);
    }

}
