package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

//import com.form.EntityForm;
import com.tools.JDBConnection;

public class EntityDao {

	public static JDBConnection connection = null;

	public EntityDao() {
		connection = new JDBConnection();
	}
	
	//查看温度数据
	public static int getTemperature() {
		int temperature = 0;
		String sql1 = "select * from entity where dataPointId='2160162'";
		ResultSet rs1 = connection.executeQuery(sql1);
		try {
			while (rs1.next()) {
				temperature = rs1.getInt("dataValue");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
//		 System.out.print(temperature); 
		return temperature;
		
	}
	
	//查看湿度数据
	public static int getHumidity() {
		int humidity = 0;
		String sql2 = "select * from entity where dataPointId='2160163'";
		ResultSet rs2 = connection.executeQuery(sql2);
		try {
			while (rs2.next()) {
				humidity = rs2.getInt("dataValue");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
//		System.out.print(humidity);
		return humidity;
		
	}
}
