package com.model;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table
public class Contact 
{
	@Id
	@GeneratedValue
	private int contactId;
	@NotEmpty(message = "Please enter your name.")
	private String contactName;
	@NotEmpty(message = "Please enter your email.")
	@Email(message = "Please enter valid email.")
	private String contactEmail;
	@NotEmpty(message = "Please enter your mobile number.")
	@Size(min = 10, max = 10, message="Please enter valid 10 digit mobile number.")
	private String contactNumber;
	@NotEmpty(message = "Please enter title.")
	private String queryTitle;
	@NotEmpty(message = "Please enter your message.")
	private String queryMessage;
	
	public int getContactId() {
		return contactId;
	}
	public void setContactId(int contactId) {
		this.contactId = contactId;
	}
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public String getContactEmail() {
		return contactEmail;
	}
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getQueryTitle() {
		return queryTitle;
	}
	public void setQueryTitle(String queryTitle) {
		this.queryTitle = queryTitle;
	}
	public String getQueryMessage() {
		return queryMessage;
	}
	public void setQueryMessage(String queryMessage) {
		this.queryMessage = queryMessage;
	}
}
