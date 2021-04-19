package com.entity;

import java.util.Date;

public class Entity {
	
	String id;
	
	int dataPointId;
	
	String deviceNo;
	
	int error ;
	
	String slaveIndex;
	
	Date time;
	
	public int value;

	public int getDataPointId() {
		return dataPointId;
	}

	public void setDataPointId(int dataPointId) {
		this.dataPointId = dataPointId;
	}

	public String getDeviceNo() {
		return deviceNo;
	}

	public void setDeviceNo(String deviceNo) {
		this.deviceNo = deviceNo;
	}

	public int getError() {
		return error;
	}

	public void setError(int error) {
		this.error = error;
	}

	public String getSlaveIndex() {
		return slaveIndex;
	}

	public void setSlaveIndex(String slaveIndex) {
		this.slaveIndex = slaveIndex;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
