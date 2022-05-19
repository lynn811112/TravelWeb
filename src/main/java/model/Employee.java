package model;

public class Employee {

	protected int empId;
	protected String email;
	protected String password;
	
	public Employee() {
		super();
	}

	public Employee(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public Employee(int empId, String email, String password) {
		super();
		this.empId = empId;
		this.email = email;
		this.password = password;
	}
		
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
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
	
	
	
}
