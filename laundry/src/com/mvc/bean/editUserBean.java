package com.mvc.bean;

public class editUserBean {

	protected  String empType_up;
	protected  String id_up; 
    protected  String name_up;
    protected  String address_up;
    protected  String oDate_up;
    
    protected int hidden_orderNo;
    

	public String getEmpType_up() {
		return empType_up;
	}

	public void setEmpType_up(String empType_up) {
		this.empType_up = empType_up;
	}

	public String getId_up() {
		return id_up;
	}

	public void setId_up(String id_up) {
		this.id_up = id_up;
	}
	
	public  String getName_up() {
		return name_up;
	}
	
	public  void setName_up(String name_up) {
		this.name_up = name_up;
	}
	
	public  String getAddress_up() {
		return address_up;
	}
	
	public void setAddress_up(String address_up) {
		this.address_up = address_up;
	}
	
	public  String getoDate_up() {
		return oDate_up;
	}
	
	public void setoDate_up(String oDate_up) {
		this.oDate_up = oDate_up;
	}

	public int getHidden_orderNo() {
		return hidden_orderNo;
	}

	public void setHidden_orderNo(int hidden_orderNo) {
		this.hidden_orderNo = hidden_orderNo;
	}

}
