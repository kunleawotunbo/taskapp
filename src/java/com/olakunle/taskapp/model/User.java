/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.olakunle.taskapp.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author olakunle
 */
@Entity
@Table(name = "user")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "first_name")
    private String firstName;
    @Basic(optional = false)
    @Column(name = "last_name")
    private String lastName;
    @Basic(optional = false)
    @Column(name = "address")
    private String address;
    @Basic(optional = false)
    @Column(name = "phone_number")
    private String phoneNumber;
    @Basic(optional = false)
    @Column(name = "passport_photograph")
    private String passportPhotograph;
    @Column(name = "item_view")
    private String itemView;
    @Column(name = "img_location")
    private String imgLocation;
    @Column(name = "img_name")
    private String imgName;
    

    public User() {
    }

    public User(Integer id) {
        this.id = id;
    }

    public User(Integer id, String firstName, String lastName, String address, String phoneNumber, String passportPhotograph) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.passportPhotograph = passportPhotograph;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPassportPhotograph() {
        return passportPhotograph;
    }

    public void setPassportPhotograph(String passportPhotograph) {
        this.passportPhotograph = passportPhotograph;
    }

    public String getItemView() {
        return itemView;
    }

    public void setItemView(String itemView) {
        this.itemView = itemView;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.olakunle.taskapp.model.User[ id=" + id + " ]";
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
    
}
