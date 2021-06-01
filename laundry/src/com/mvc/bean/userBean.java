package com.mvc.bean;

public class userBean {
	
	protected  String empType;
	protected  String id;
	protected  String name;
	protected  String address;
	protected  String oDate;
	
	 protected int hidden_orderNo;

	public String getEmpType() {
		return empType;
	}

	public void setEmpType(String empType) {
		this.empType = empType;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
		
	public  String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public  String getAddress() {
		return address;
	}

	public  void setAddress(String address) {
		this.address = address;
	}

	public  String getoDate() {
		return oDate;
	}

	public void setoDate(String oDate) {
		this.oDate = oDate;
	}

	public int getHidden_orderNo() {
		return hidden_orderNo;
	}

	public  void setHidden_orderNo(int hidden_orderNo) {
		this.hidden_orderNo = hidden_orderNo;
	}


    
}
