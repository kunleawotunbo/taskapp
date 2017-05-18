package com.olakunle.taskapp.controller;

import com.olakunle.taskapp.bean.FileBucket;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

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
import com.olakunle.taskapp.util.ImageResizer;
import com.olakunle.taskapp.util.Utility;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FilenameUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author olakunle
 */
@Controller
//@RequestMapping("/")
public class AppController {

    @Autowired
    MessageSource messageSource;

    @Autowired
    private UserService userService;
    Utility utility = new Utility();

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public ModelAndView getData() {

        ModelAndView model = new ModelAndView("hello");

        return model;

    }

    @RequestMapping(value = "/hello1", method = RequestMethod.GET)
    public ModelAndView getData1() {

        ModelAndView model = new ModelAndView("hello1");

        return model;

    }

    /**
     * This method will list all existing users.
     */
    @RequestMapping(value = {"/", "/list"}, method = RequestMethod.GET)
    public String listUsers1(ModelMap model, HttpServletRequest req) {

        List<User> users = userService.findAllUsers();
        /*
        if (null != user.getImgLocation() && !"".equalsIgnoreCase(user.getImgLocation())) {
            encodedString = utility.imageToBase64tring(user.getImgLocation());
        } else {
            System.out.println("Image is empty or null");
        }

        model.addAttribute("user", fileBucket);
        model.addAttribute("edit", true);
        model.addAttribute("image", encodedString);
         */
        model.addAttribute("users", users);
        return "userslist";
    }
    
     @RequestMapping("findUser")
    public String getSearch(ModelMap model) {
        // logger.info("Searching the Employee. Employee Names: "+searchPhone);
         List<User> userList = null;
        //userList = userService.queryUserByPhoneNo(searchPhone);
        model.addAttribute("users", userList);

        return "search";
    }
    @RequestMapping("searchUser")
    public String searchUser(@RequestParam("searchPhone") String searchPhone, ModelMap model) {
        // logger.info("Searching the Employee. Employee Names: "+searchPhone);
        List<User> userList = userService.queryUserByPhoneNo(searchPhone);
        model.addAttribute("users", userList);

        return "search";
    }

    /**
     * This method will list all existing users.
     */
    @RequestMapping(value = {"/allusers"}, method = RequestMethod.GET)
    public String listUsers(ModelMap model, HttpServletRequest req) {

        List<User> users = userService.findAllUsers();
        /*
        if (null != user.getImgLocation() && !"".equalsIgnoreCase(user.getImgLocation())) {
            encodedString = utility.imageToBase64tring(user.getImgLocation());
        } else {
            System.out.println("Image is empty or null");
        }

        model.addAttribute("user", fileBucket);
        model.addAttribute("edit", true);
        model.addAttribute("image", encodedString);
         */
        model.addAttribute("users", users);
        return "users";
    }

    /**
     * This method will provide the medium to add a new user.
     */
    @RequestMapping(value = {"/newuser"}, method = RequestMethod.GET)
    public String newUser(ModelMap model) {
        /*
        User user = new User();
        model.addAttribute("user", user);
        model.addAttribute("edit", false);
        return "registration";
         */
        FileBucket user = new FileBucket();
        model.addAttribute("user", user);
        model.addAttribute("edit", false);
        return "registration";
    }

    /**
     * This method will provide the medium to add a new user.
     */
    @RequestMapping(value = {"/register"}, method = RequestMethod.GET)
    public String register(ModelMap model) {
        /*
        User user = new User();
        model.addAttribute("user", user);
        model.addAttribute("edit", false);
        return "registration";
         */
        FileBucket user = new FileBucket();
        model.addAttribute("user", user);
        model.addAttribute("edit", false);
        return "adduser";
    }

    /**
     * This method will be called on form submission, handling POST request for
     * saving user in database. It also validates the user input
     */
    @RequestMapping(value = {"/register"}, method = RequestMethod.POST)
    public String registerUser(@Valid FileBucket fileBucket, BindingResult result,
            ModelMap model) {
        MultipartFile file = fileBucket.getFile();
        String originalImgPath = "";
        String resizedImgPath = "";
        //String serverFileName = "";
        int width = 580;
        int height = 450;

        User user = new User();
        if (result.hasErrors()) {
            return "registration";
        }
        if (!file.isEmpty()) {

            try {

                byte[] bytes = file.getBytes();
                // Creating the directory to store file
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(rootPath + File.separator + "tmpFiles");
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                FilenameUtils fileUTIL = new FilenameUtils();

                String ext = fileUTIL.getExtension(file.getOriginalFilename());
                String baseName = fileUTIL.getBaseName(file.getOriginalFilename());
                String serverFileName = dir + File.separator + baseName + "." + ext;
                //originalImgPath = dir + File.separator + baseName + "." + ext;
                //System.out.println("serverFileName:" + serverFileName);

                //utility.resize(originalImgPath, resizedImgPath, width, height);
                //create the file on server
                File serverFile = new File(serverFileName);
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();

                user.setFirstName(fileBucket.getFirstName());
                user.setLastName(fileBucket.getLastName());
                user.setPhoneNumber(fileBucket.getPhoneNumber());
                user.setItemView(fileBucket.getItemView());
                user.setAddress(fileBucket.getAddress());
                user.setPassportPhotograph(file.getOriginalFilename());
                user.setImgLocation(serverFileName);
                user.setImgName(file.getOriginalFilename());

                //System.out.println("user.getFirstName :: " + user.getFirstName());
                //System.out.println("multipartFile.getOriginalFilename() :: " + file.getOriginalFilename());
                //System.out.println("user.address :: " + user.getAddress());
                userService.saveUser(user);

            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            System.out.println("File is empty / No image uploaded");
        }

        model.addAttribute("user", user);
        model.addAttribute("success", "User " + user.getFirstName() + " " + user.getLastName() + " registered successfully");
        //return "success";
        return "registrationsuccess";
    }

    @RequestMapping(value = "/test.htm", method = RequestMethod.GET)
    public ModelAndView getUser(ModelMap map, HttpServletRequest request) {

        boolean result = false;
        User user = new User();
        user.setFirstName("Olakunle");
        user.setLastName("Awotunbo");
        user.setAddress("58, Osundairo street");
        user.setPassportPhotograph("dksldlfdslfsdf");
        user.setPhoneNumber("07031528126");

        result = userService.saveUser(user);
        if (result) {
            System.out.println("Saved successfully :: " + user.getFirstName());
        } else {
            System.out.println("Failed to save user :: " + user.getFirstName());
        }

        map.addAttribute("user", new User());
        map.addAttribute("users", userService.findAllUsers());
        //return new ModelAndView("userlist", map);
        return new ModelAndView("test", map);
    }

    /**
     * This method will be called on form submission, handling POST request for
     * saving user in database. It also validates the user input
     */
    @RequestMapping(value = {"/newuser"}, method = RequestMethod.POST)
    public String saveUser(/*@Valid User user */@Valid FileBucket fileBucket, BindingResult result,
            ModelMap model) {
        MultipartFile file = fileBucket.getFile();
        String originalImgPath = "";
        String resizedImgPath = "";
        //String serverFileName = "";
        int width = 580;
        int height = 450;

        User user = new User();
        if (result.hasErrors()) {
            return "registration";
        }
        if (!file.isEmpty()) {

            try {

                byte[] bytes = file.getBytes();
                // Creating the directory to store file
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(rootPath + File.separator + "tmpFiles");
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                FilenameUtils fileUTIL = new FilenameUtils();

                String ext = fileUTIL.getExtension(file.getOriginalFilename());
                String baseName = fileUTIL.getBaseName(file.getOriginalFilename());
                String serverFileName = dir + File.separator + baseName + "." + ext;
                //originalImgPath = dir + File.separator + baseName + "." + ext;
                //System.out.println("serverFileName:" + serverFileName);

                //utility.resize(originalImgPath, resizedImgPath, width, height);
                //create the file on server
                File serverFile = new File(serverFileName);
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();

                user.setFirstName(fileBucket.getFirstName());
                user.setLastName(fileBucket.getLastName());
                user.setPhoneNumber(fileBucket.getPhoneNumber());
                user.setItemView(fileBucket.getItemView());
                user.setAddress(fileBucket.getAddress());
                user.setPassportPhotograph(file.getOriginalFilename());
                user.setImgLocation(serverFileName);
                user.setImgName(file.getOriginalFilename());

                //System.out.println("user.getFirstName :: " + user.getFirstName());
                //System.out.println("multipartFile.getOriginalFilename() :: " + file.getOriginalFilename());
                //System.out.println("user.address :: " + user.getAddress());
                userService.saveUser(user);

            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            System.out.println("File is empty / No image uploaded");
        }

        model.addAttribute("user", user);
        model.addAttribute("success", "User " + user.getFirstName() + " " + user.getLastName() + " registered successfully");
        //return "success";
        return "registrationsuccess";
    }

    /**
     * This method will provide the medium to update an existing user.
     */
    @RequestMapping(value = {"/edit-user-{id}"}, method = RequestMethod.GET)
    public String editUser(@PathVariable int id, ModelMap model) {
        // http://jsfiddle.net/vacidesign/ja0tyj0f/
        User user = userService.findUserById(id);
        FileBucket fileBucket = new FileBucket();

        fileBucket.setId(user.getId());
        fileBucket.setFirstName(user.getFirstName());
        fileBucket.setLastName(user.getLastName());
        fileBucket.setAddress(user.getAddress());
        fileBucket.setItemView(user.getItemView());
        fileBucket.setImgLocation(user.getImgLocation());

        BufferedImage img = null;
        String encodedString = "";

        if (null != user.getImgLocation() && !"".equalsIgnoreCase(user.getImgLocation())) {

            encodedString = utility.imageToBase64tring(user.getImgLocation());

            /*
                File file = new File(user.getImgLocation());
                FileInputStream fis = new FileInputStream(file);
                ByteArrayOutputStream bos = new ByteArrayOutputStream();
                int b;
                byte[] buffer = new byte[1024];
                while ((b = fis.read(buffer)) != -1) {
                    bos.write(buffer, 0, b);
                }
                byte[] fileBytes = bos.toByteArray();
                fis.close();
                bos.close();

                byte[] encoded = Base64.encodeBase64(fileBytes);
                encodedString = new String(encoded);
             */
        } else {
            System.out.println("Image is empty or null");
        }

        model.addAttribute("user", fileBucket);
        model.addAttribute("edit", true);
        model.addAttribute("image", encodedString);
        return "registration";
    }

    /**
     * This method will be called on form submission, handling POST request for
     * updating user in database. It also validates the user input
     */
    @RequestMapping(value = {"/edit-user-{ssoId}"}, method = RequestMethod.POST)
    public String updateUser(@Valid User user, BindingResult result,
            ModelMap model, @PathVariable String ssoId) {

        if (result.hasErrors()) {
            return "registration";
        }

        userService.updateUser(user);

        model.addAttribute("success", "User " + user.getFirstName() + " " + user.getLastName() + " updated successfully");
        return "registrationsuccess";
    }

    /**
     * This method will delete an user by it's id value.
     */
    @RequestMapping(value = {"/delete-user-{id}"}, method = RequestMethod.GET)
    public String deleteUser(@PathVariable int id) {
        userService.deleteUser(id);
        return "redirect:/allusers";
    }


    /*
	@RequestMapping(value = { "/add-document-{userId}" }, method = RequestMethod.POST)
	public String uploadDocument(@Valid FileBucket fileBucket, BindingResult result, ModelMap model, @PathVariable int userId) throws IOException{
		
		if (result.hasErrors()) {
			System.out.println("validation errors");
			User user = userService.findById(userId);
			model.addAttribute("user", user);

			List<UserDocument> documents = userDocumentService.findAllByUserId(userId);
			model.addAttribute("documents", documents);
			
			return "managedocuments";
		} else {
			
			System.out.println("Fetching file");
			
			User user = userService.findById(userId);
			model.addAttribute("user", user);

			saveDocument(fileBucket, user);

			return "redirect:/add-document-"+userId;
		}
	}
	
	private void saveDocument(FileBucket fileBucket, User user) throws IOException{
		
		UserDocument document = new UserDocument();
		
		MultipartFile multipartFile = fileBucket.getFile();
		
		document.setName(multipartFile.getOriginalFilename());
		document.setDescription(fileBucket.getDescription());
		document.setType(multipartFile.getContentType());
		document.setContent(multipartFile.getBytes());
		document.setUser(user);
		userDocumentService.saveDocument(document);
	}
        
     */
}
