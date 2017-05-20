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
import java.util.ArrayList;
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

    // For heroku
    // https://github.com/heroku/heroku-cli-deploy
    @Autowired
    MessageSource messageSource;

    @Autowired
    private UserService userService;
    Utility utility = new Utility();

    /**
     * This method will list all existing users.
     */
    @RequestMapping(value = {"/testing", "/list"}, method = RequestMethod.GET)
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

    /**
     * To get user search page
     *
     * @param model
     * @return
     */
    @RequestMapping("findUser")
    public String getSearch(ModelMap model) {

        List<User> userList = null;

        model.addAttribute("users", userList);

        return "search";
    }

    /**
     * To search for user using phone number (like)
     *
     * @param searchPhone Phone number to search
     * @param model
     * @return
     */
    @RequestMapping("searchUser")
    public String searchUser(@RequestParam("searchPhone") String searchPhone, ModelMap model) {

        List<User> userList = userService.queryUserByPhoneNo(searchPhone);

        List<FileBucket> fbUsers = null;
        FileBucket fb = null;
        String passportEncodedString = "";
        String itemViewImagEencodedString = "";
        if (fbUsers == null) {
            fbUsers = new ArrayList<FileBucket>();
        }
        for (User item : userList) {
            
            fb = new FileBucket();
            //System.out.println( "Passport path :: " +  item.getImgLocation() + item.getPassportPhotograph());
            //System.out.println( "Item view  path :: " +  item.getImgLocation() + item.getImgItemName());

            passportEncodedString = utility.imageToBase64tring(item.getImgLocation() + item.getPassportPhotograph());
            itemViewImagEencodedString = utility.imageToBase64tring(item.getImgLocation() + item.getImgItemName());

            fb.setId(item.getId());
            fb.setFirstName(item.getFirstName());
            fb.setLastName(item.getLastName());
            fb.setAddress(item.getAddress());
            fb.setPhoneNumber(item.getPhoneNumber());
            fb.setItemView(item.getItemView());
            fb.setImgLocation(item.getImgItemLocation());
            fb.setImgName(item.getImgName());
            fb.setItemViewImage(item.getImgLocation());
            fb.setPassportImage(passportEncodedString);
            fb.setItemViewImage(itemViewImagEencodedString);

            System.out.println("fb :: " + fb.getAddress());

            fbUsers.add(fb);
        }

        //model.addAttribute("itemViewImage", itemViewImagEencodedString);
        //model.addAttribute("passportImage", passportEncodedString);
        //model.addAttribute("users", userList);
        model.addAttribute("users", fbUsers);

        return "search";
    }

    /**
     * This method will list all existing users.
     */
    @RequestMapping(value = {"/allusers"}, method = RequestMethod.GET)
    public String listUsers(ModelMap model, HttpServletRequest req) {

        List<User> userList = userService.findAllUsers();
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
        
        
        List<FileBucket> fbUsers = null;
        FileBucket fb = null;
        String passportEncodedString = "";
        String itemViewImagEencodedString = "";
        if (fbUsers == null) {
            fbUsers = new ArrayList<FileBucket>();
        }
        for (User item : userList) {
            
            fb = new FileBucket();
            System.out.println("Passport path :: " + item.getImgLocation() + item.getPassportPhotograph());
            System.out.println("Item view  path :: " + item.getImgLocation() + item.getImgItemName());

            passportEncodedString = utility.imageToBase64tring(item.getImgLocation() + item.getPassportPhotograph());
            itemViewImagEencodedString = utility.imageToBase64tring(item.getImgLocation() + item.getImgItemName());

            fb.setId(item.getId());
            fb.setFirstName(item.getFirstName());
            fb.setLastName(item.getLastName());
            fb.setAddress(item.getAddress());
            fb.setPhoneNumber(item.getPhoneNumber());
            fb.setItemView(item.getItemView());
            fb.setImgLocation(item.getImgItemLocation());
            fb.setImgName(item.getImgName());
            fb.setItemViewImage(item.getImgLocation());
            fb.setPassportImage(passportEncodedString);
            fb.setItemViewImage(itemViewImagEencodedString);

            System.out.println("id :: " + fb.getId() + "fb :: " + fb.getAddress());

            fbUsers.add(fb);
        }

        model.addAttribute("users", fbUsers);      
       
        

        //model.addAttribute("users", userList);
        
        return "users";
    }

    /**
     * This method will provide the medium to add a new user on the home page.
     */
    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String getHome(ModelMap model) {

        FileBucket user = new FileBucket();
        model.addAttribute("user", user);

        return "redirect:/register";
    }

    /**
     * This method will provide the medium to add a new user.
     */
    // @RequestMapping(value = {"/", "/register"}, method = RequestMethod.GET)
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
            ModelMap model, HttpServletRequest req) {

        MultipartFile[] files = fileBucket.getFiles();
        String originalImgPath = "";
        String resizedImgPath = "";
        //String serverFileName = "";
        String photoName = "";
        String itemViewName = "";
        String imgLocation = "";
        int width = 580;
        int height = 450;
        boolean saved = false;
        String serverFileName = "";

        FileBucket fb = new FileBucket();
        User user = new User();
        if (result.hasErrors()) {
            return "registration";
        }
        if (files != null && files.length > 0) {
            for (int i = 0; i < files.length; i++) {
                try {

                    byte[] bytes = null;
                    // Creating the directory to store file
                    String rootPath = System.getProperty("catalina.home");
                    File dir = new File(rootPath + File.separator + "tmpFiles");
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }

                    FilenameUtils fileUTIL = new FilenameUtils();

                    String path = req.getServletContext().getRealPath("/image");
                    //String ext = fileUTIL.getExtension(file.getOriginalFilename());
                    //String baseName = fileUTIL.getBaseName(file.getOriginalFilename());

                    imgLocation = dir + File.separator;
                    // get files name in the array
                    if (i == 0) {
                        photoName = files[i].getOriginalFilename();
                        bytes = files[i].getBytes();
                        serverFileName = imgLocation + photoName;
                        System.out.println("photoName:: " + photoName);
                    } else if (i == 1) {
                        itemViewName = files[i].getOriginalFilename();
                        bytes = files[i].getBytes();
                        serverFileName = imgLocation + itemViewName;
                        System.out.println("itemViewName:: " + itemViewName);
                    }

                    System.out.println("serverFileName :: " + serverFileName);

                    // resize image
                    //utility.resize(originalImgPath, resizedImgPath, width, height);
                    //create the file on server
                    File serverFile = new File(serverFileName);
                    BufferedOutputStream stream = new BufferedOutputStream(
                            new FileOutputStream(serverFile));
                    stream.write(bytes);
                    stream.close();

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            //System.out.println("bytes ::" + bytes);
            user.setFirstName(fileBucket.getFirstName());
            user.setLastName(fileBucket.getLastName());
            user.setPhoneNumber(fileBucket.getPhoneNumber());
            user.setItemView(fileBucket.getItemView());
            user.setAddress(fileBucket.getAddress());
            user.setPassportPhotograph(photoName);
            user.setImgLocation(imgLocation);
            user.setImgName(photoName);
            user.setImgItemName(itemViewName);

            saved = userService.saveUser(user);

        } else {
            System.out.println("File is empty / No image uploaded");
        }

        //model.addAttribute("user", user);
        model.addAttribute("user", fb);
        //model.addAttribute("success", "User " + user.getFirstName() + " " + user.getLastName() + " saved successfully");
        //model.addAttribute("saved", saved);

        //return "adduser";
        //return "redirect:/adduser";
        return "redirect:/register";
    }

    /*
    @RequestMapping(value = {"/register"}, method = RequestMethod.POST)
    public String registerUser(@Valid FileBucket fileBucket, BindingResult result,
            ModelMap model, HttpServletRequest req) {
        MultipartFile file = fileBucket.getFile();
        String originalImgPath = "";
        String resizedImgPath = "";
        //String serverFileName = "";
        int width = 580;
        int height = 450;
        boolean saved = false;

        FileBucket fb = new FileBucket();
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
                //String tempDirectoryPath = System.getProperty("java.io.tmpdir");
                //System.out.println("tempDirectoryPath :: " + tempDirectoryPath);
                 String path =  req.getServletContext().getRealPath("/image");
                String ext = fileUTIL.getExtension(file.getOriginalFilename());
                String baseName = fileUTIL.getBaseName(file.getOriginalFilename());
                
                String serverFileName = dir + File.separator + baseName + "." + ext;
               // String serverFileName = path + File.separator + baseName + "." + ext;
            
                System.out.println("serverFileName :: " + serverFileName);
                
                //utility.resize(originalImgPath, resizedImgPath, width, height);
                //create the file on server
                File serverFile = new File(serverFileName);
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
                
                //System.out.println("bytes ::" + bytes);
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
                saved = userService.saveUser(user);

            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            System.out.println("File is empty / No image uploaded");
        }

        //model.addAttribute("user", user);
        model.addAttribute("user", fb);
        model.addAttribute("success", "User " + user.getFirstName() + " " + user.getLastName() + " saved successfully");
        model.addAttribute("saved", saved);
      
        return "adduser";
        //return "redirect:/adduser";
    }

     */
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
        fileBucket.setPhoneNumber(user.getPhoneNumber());

        BufferedImage img = null;
        String passportEncodedString = "";
        String itemViewImagEencodedString = "";

        if (null != user.getImgLocation() && !"".equalsIgnoreCase(user.getImgLocation())) {

            passportEncodedString = utility.imageToBase64tring(user.getImgLocation() + user.getPassportPhotograph());
            itemViewImagEencodedString = utility.imageToBase64tring(user.getImgLocation() + user.getImgItemName());
            // System.out.println("passportEncodedString :: " + passportEncodedString);

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
        System.out.println("fileBucket.getPhoneNumber() ::" + fileBucket.getPhoneNumber());
        model.addAttribute("user", fileBucket);
        model.addAttribute("edit", true);
        model.addAttribute("passportImage", passportEncodedString);
        model.addAttribute("itemViewImage", itemViewImagEencodedString);

        return "adduser";
    }

    /**
     * This method will be called on form submission, handling POST request for
     * updating user in database. It also validates the user input
     */
    @RequestMapping(value = {"/edit-user-{id}"}, method = RequestMethod.POST)
    public String updateUser(@Valid FileBucket fileBucket, BindingResult result,
            ModelMap model, @PathVariable String id, HttpServletRequest req) {

        MultipartFile[] files = fileBucket.getFiles();
        String originalImgPath = "";
        String resizedImgPath = "";
        //String serverFileName = "";
        String photoName = "";
        String itemViewName = "";
        String imgLocation = "";
        int width = 580;
        int height = 450;
        boolean saved = false;
        String serverFileName = "";

        FileBucket fb = new FileBucket();
        User user = new User();
        if (result.hasErrors()) {
            return "registration";
        }
        if (files != null && files.length > 0) {
            for (int i = 0; i < files.length; i++) {
                try {

                    byte[] bytes = null;
                    // Creating the directory to store file
                    String rootPath = System.getProperty("catalina.home");
                    File dir = new File(rootPath + File.separator + "tmpFiles");
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }

                    FilenameUtils fileUTIL = new FilenameUtils();

                    String path = req.getServletContext().getRealPath("/image");
                    //String ext = fileUTIL.getExtension(file.getOriginalFilename());
                    //String baseName = fileUTIL.getBaseName(file.getOriginalFilename());

                    imgLocation = dir + File.separator;
                    // get files name in the array
                    if (i == 0) {
                        photoName = files[i].getOriginalFilename();
                        bytes = files[i].getBytes();
                        serverFileName = imgLocation + photoName;
                        System.out.println("photoName:: " + photoName);
                    } else if (i == 1) {
                        itemViewName = files[i].getOriginalFilename();
                        bytes = files[i].getBytes();
                        serverFileName = imgLocation + itemViewName;
                        System.out.println("itemViewName:: " + itemViewName);
                    }

                    System.out.println("serverFileName :: " + serverFileName);

                    // resize image
                    //utility.resize(originalImgPath, resizedImgPath, width, height);
                    //create the file on server
                    File serverFile = new File(serverFileName);
                    BufferedOutputStream stream = new BufferedOutputStream(
                            new FileOutputStream(serverFile));
                    stream.write(bytes);
                    stream.close();

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            System.out.println("fileBucket.getPhoneNumber() ::" + fileBucket.getPhoneNumber());
            user.setId(fileBucket.getId());
            user.setFirstName(fileBucket.getFirstName());
            user.setLastName(fileBucket.getLastName());
            user.setPhoneNumber(fileBucket.getPhoneNumber());
            user.setItemView(fileBucket.getItemView());
            user.setAddress(fileBucket.getAddress());
            user.setPassportPhotograph(photoName);
            user.setImgLocation(imgLocation);
            user.setImgName(photoName);
            user.setImgItemName(itemViewName);

            saved = userService.updateUser(user);

        } else {
            System.out.println("File is empty / No image uploaded");
        }

        //model.addAttribute("user", user);
        model.addAttribute("user", fb);
       // model.addAttribute("success", "User " + user.getFirstName() + " " + user.getLastName() + " saved successfully");
       // model.addAttribute("saved", saved);

        //return "adduser";
        
        return "redirect:/register";
    }

    /*
    @RequestMapping(value = {"/edit-user-{id}"}, method = RequestMethod.POST)
    public String updateUser(@Valid FileBucket fileBucket, BindingResult result,
            ModelMap model, @PathVariable String id) {

        MultipartFile file = fileBucket.getFile();
        String originalImgPath = "";
        String resizedImgPath = "";
        //String serverFileName = "";
        int width = 580;
        int height = 450;
        boolean saved = false;

        FileBucket fb = new FileBucket();
        User user = new User();
        if (result.hasErrors()) {
            return "adduser";
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
                saved = userService.saveUser(user);

            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            System.out.println("File is empty / No image uploaded");
        }

        userService.updateUser(user);

        //model.addAttribute("user", user);
        model.addAttribute("user", fb);
        model.addAttribute("success", "User " + user.getFirstName() + " " + user.getLastName() + " saved successfully");
        model.addAttribute("saved", saved);

        model.addAttribute("success", "User " + user.getFirstName() + " " + user.getLastName() + " updated successfully");

        return "adduser";
    }
    
     */
    /**
     * This method will delete an user by it's id value.
     */
    @RequestMapping(value = {"/delete-user-{id}"}, method = RequestMethod.GET)
    public String deleteUser(@PathVariable int id) {
        userService.deleteUser(id);
        return "redirect:/allusers";
    }

}
