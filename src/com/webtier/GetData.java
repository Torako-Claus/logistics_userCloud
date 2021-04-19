package com.webtier;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.UUID;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dao.AdminDao;

public class GetData {
	private  static	AdminDao adminDao = null;
	
	static{
		adminDao=new AdminDao();
	}
	
	public static void getData() {
		String token=GetToken.getToken();
        String methodUrl = "https://openapi.mp.usr.cn/usrCloud/vn/ucloudSdk/getLastDataHistory";
        HttpURLConnection connection = null;
        OutputStream dataout = null;
        BufferedReader reader = null;
        String line = null;
        try {
            URL url = new URL(methodUrl);
            connection = (HttpURLConnection) url.openConnection();// 根据URL生成HttpURLConnection
            connection.setDoOutput(true);// 设置是否向connection输出，因为这个是post请求，参数要放在http正文内，因此需要设为true,默认情况下是false
            connection.setDoInput(true); // 设置是否从connection读入，默认情况下是true;
            connection.setRequestMethod("POST");// 设置请求方式为post,默认GET请求
            connection.setUseCaches(false);// post请求不能使用缓存设为false
            connection.setConnectTimeout(3000);// 连接主机的超时时间
            connection.setReadTimeout(3000);// 从主机读取数据的超时时间
            connection.setInstanceFollowRedirects(true);// 设置该HttpURLConnection实例是否自动执行重定向
            connection.setRequestProperty("connection", "Keep-Alive");// 连接复用
            connection.setRequestProperty("charset", "utf-8");

            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("Authorization", "Bearer 66cb225f1c3ff0ddfdae31rae2b57488aadfb8b5e7");
            connection.setRequestProperty("token", token);
            connection.connect();// 建立TCP连接,getOutputStream会隐含的进行connect,所以此处可以不要

            dataout = new DataOutputStream(connection.getOutputStream());// 创建输入输出流,用于往连接里面输出携带的参数
            String body="{\"devDatapoints\":[{\"deviceNo\": \"085201912153984\",\"slaveIndex\": \"1\",\"dataPointId\": 2160162},{\"deviceNo\": \"085201912153984\",\"slaveIndex\": \"1\",\"dataPointId\": 2160163}]}";
            dataout.write(body.getBytes());
            dataout.flush();
            dataout.close();

            if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
                reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));// 发送http请求
                StringBuilder result = new StringBuilder();
                // 循环读取流
                while ((line = reader.readLine()) != null) {
                    result.append(line).append(System.getProperty("line.separator"));//
                }
                JSONObject jsonObject =JSONObject.parseObject(result.toString());
                JSONObject jsonObject2 =JSONObject.parseObject(jsonObject.get("data").toString());
                JSONArray jsonarray = JSON.parseArray(jsonObject2.getString("list"));
                if(null!=jsonarray&&jsonarray.size()>0){
                	for(int i=0;i<jsonarray.size();i++){
                		String sql="";
//                		sql += "insert into entity (dataPointId,deviceNo,error,slaveIndex,time,dataValue) value (";
                		sql += "update entity set ";
                    	JSONObject entity = jsonarray.getJSONObject(i);
                		sql += "dataValue=" + entity.get("value") 
                				+ " where dataPointId=" + entity.get("dataPointId") + ";";
                		
//                    	sql += entity.get("dataPointId") + ",'" 
//                    			+ entity.get("deviceNo") + "'," 
//                    			+ entity.get("error") + ",'" 
//                    			+ entity.get("slaveIndex") + "'," 
//                    			+ entity.get("time") + ","
//                    			+ entity.get("value") 
//                    			+ ")";
                    	System.out.println(sql);
                    	adminDao.httpDataInsert(sql);
                    }
                }
                
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            connection.disconnect();
        }
    }
	
	public static void main(String[] args) {
		GetData h = new GetData();
		h.getData();
	}
}
