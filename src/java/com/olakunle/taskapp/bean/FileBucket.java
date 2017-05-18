/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.olakunle.taskapp.bean;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author olakunle
 */
public class FileBucket {
    
    private int id;
    private String firstName;
    private String lastName;
    private String address;
    private String phoneNumber;
    private String passportPhotograph;
    private String itemView;
    private String imgLocation;
    private String imgName;
    private MultipartFile file;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }
    
    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the phoneNumber
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * @param phoneNumber the phoneNumber to set
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * @return the passportPhotograph
     */
    public String getPassportPhotograph() {
        return passportPhotograph;
    }

    /**
     * @param passportPhotograph the passportPhotograph to set
     */
    public void setPassportPhotograph(String passportPhotograph) {
        this.passportPhotograph = passportPhotograph;
    }

    /**
     * @return the itemView
     */
    public String getItemView() {
        return itemView;
    }

    /**
     * @param itemView the itemView to set
     */
    public void setItemView(String itemView) {
        this.itemView = itemView;
    }

    /**
     * @return the file
     */
    public MultipartFile getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(MultipartFile file) {
        this.file = file;
    }

    /**
     * @return the imgLocation
     */
    public String getImgLocation() {
        return imgLocation;
    }

    /**
     * @param imgLocation the imgLocation to set
     */
    public void setImgLocation(String imgLocation) {
        this.imgLocation = imgLocation;
    }

    /**
     * @return the imgName
     */
    public String getImgName() {
        return imgName;
    }

    /**
     * @param imgName the imgName to set
     */
    public void setImgName(String imgName) {
        this.imgName = imgName;
    }
    

}
