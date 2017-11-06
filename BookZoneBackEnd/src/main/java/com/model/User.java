package com.model;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.*;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table
public class User implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	private int userid;
	@Email
	@Column(unique = true, nullable = false)
	private String email;
	@NotEmpty
	private String name;
	@Column(unique = true, nullable = false)
	private String username;
	@NotEmpty
	@Size(min = 10, max = 10)
	private String phone;
	@NotEmpty
	private String address;
	@NotEmpty
	private String password;
	private String role;
	@NotEmpty
	private String country;
	private String userimage;
	private boolean enabled;
	
	@Transient
	MultipartFile uimage;	
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getUserimage() {
		return userimage;
	}
	public void setUserimage(String userimage) {
		this.userimage = userimage;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public MultipartFile getUimage() {
		return uimage;
	}
	public void setUimage(MultipartFile uimage) {
		this.uimage = uimage;
	}
}
