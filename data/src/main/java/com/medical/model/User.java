package com.medical.model;

import java.io.InputStream;
import java.io.Serializable;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class User implements Serializable {

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public InputStream getImage() {
		return image;
	}

	public void setImage(InputStream image) {
		this.image = image;
	}

	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Override
	public String toString() 
	{
		return id+"\n "+email+"\n "+password+" \n"+isDeleted+"\n "+firstName+"\n "+lastName+"\n "+dob+"\n "+date+"\n "+time+"\n "+role+"\n "+gender+" \n"+mobile+" \n"+imageFile;
	}

	private static final long serialVersionUID = 1L;
	private String id;
	@NotEmpty 
	private String email;
	@NotEmpty
	private String password;
	
	private Boolean isDeleted;
	@NotEmpty
	@Pattern(regexp="[A-Za-z]*")
	private String firstName;
	@NotEmpty
	private String lastName;
	@NotEmpty 
	private String dob;
	@NotEmpty
	private String date;
	@NotEmpty
	private String time;
	@NotEmpty
	private String role;
	@NotEmpty
	private String gender;
	@NotEmpty
	@Size(min=10,max=10)
	private String mobile;
	private InputStream image;
	private MultipartFile imageFile;

}
