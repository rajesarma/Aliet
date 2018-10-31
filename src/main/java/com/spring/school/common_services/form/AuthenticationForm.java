package com.spring.school.common_services.form;

import java.util.ArrayList;
import java.util.HashMap;

public class AuthenticationForm {
	
	private static final long serialVersionUID = 1L;
	private String mode=null;
	
	private String username=null;
	private String password=null;
	
	private String oldPassword=null;
	private String newPassword=null;
	private String retypenewPassword=null;
	
	private String user_desc=null;
	
	
	
	public String getUser_desc() {
		return user_desc;
	}
	public void setUser_desc(String user_desc) {
		this.user_desc = user_desc;
	}
	private int roleId=0;
	
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	private ArrayList rolesList=null;
	
	private ArrayList personsList=null;
	
	
	
	public ArrayList getPersonsList() {
		return personsList;
	}
	public void setPersonsList(ArrayList personsList) {
		this.personsList = personsList;
	}
	public ArrayList getRolesList() {
		return rolesList;
	}
	public void setRolesList(ArrayList rolesList) {
		this.rolesList = rolesList;
	}
	public String getRetypenewPassword() {
		return retypenewPassword;
	}
	public void setRetypenewPassword(String retypenewPassword) {
		this.retypenewPassword = retypenewPassword;
	}
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	private int facultyId = 0;
	private String facultyName = null;
	private String fatherName = null;
	private String aadharNo = null;
	private String address = null;
	private String email = null;
	private String phone = null;
	private String bloodGroup = null;
	private String employeeNumber = null;
	private String userId = null;
	private String dob = null;
	private String doj = null;
	
	private HashMap<String, Object> properties=new HashMap<String, Object>();
	
	public int getFacultyId() {
		return facultyId;
	}
	public void setFacultyId(int facultyId) {
		this.facultyId = facultyId;
	}
	public String getFacultyName() {
		return facultyName;
	}
	public void setFacultyName(String facultyName) {
		this.facultyName = facultyName;
	}
	public String getFatherName() {
		return fatherName;
	}
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	public String getAadharNo() {
		return aadharNo;
	}
	public void setAadharNo(String aadharNo) {
		this.aadharNo = aadharNo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getBloodGroup() {
		return bloodGroup;
	}
	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}
	public String getEmployeeNumber() {
		return employeeNumber;
	}
	public void setEmployeeNumber(String employeeNumber) {
		this.employeeNumber = employeeNumber;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getDoj() {
		return doj;
	}
	public void setDoj(String doj) {
		this.doj = doj;
	}
	
	public HashMap<String, Object> getProperties() {
		return properties;
	}
	public void setProperties(HashMap<String, Object> properties) {
		this.properties = properties;
	}
	public void setProperty(String key,Object value)
	{
		properties.put(key, value);
	}
	public Object getProperty(String key)
	{
		return properties.get(key);
	}

	public void setPropertyArray(String key,Object[] value)
	{
		properties.put(key, value);
	}
	public Object[] getPropertyArray(String key)
	{
		return (Object[]) properties.get(key);
	}
}
