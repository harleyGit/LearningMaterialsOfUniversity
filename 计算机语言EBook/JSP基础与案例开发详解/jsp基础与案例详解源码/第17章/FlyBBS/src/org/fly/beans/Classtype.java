package org.fly.beans;

import java.io.Serializable;

public class Classtype implements Serializable{
	private int id;// ����ID
	private String classType;// ��̳����

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setClassType(String classType) {
		this.classType = classType;
	}

	public String getClassType() {
		return classType;
	}
}
