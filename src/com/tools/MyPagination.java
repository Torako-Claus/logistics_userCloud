package com.tools;

import java.util.ArrayList;
import java.util.List;

public class MyPagination {
    public List<Object> list=null;                      //设置List类型的对象list
    private int recordCount=0;                        	//设置int类型变量recordCount
    private int pagesize=0;                           	//设置int类型变量pagesize
    private int maxPage=0;                           	//设置int类型变量maxPage

	public List getInitPage(List list,int Page,int pagesize){
        List<Object> newList=new ArrayList<Object>();  	//实例化List集合对象
        this.list=list;                                	//获取当前的记录集合
        recordCount=list.size();                      	//获取最大记录数
        this.pagesize=pagesize;                       	//获取每页显示的记录数
        this.maxPage=getMaxPage();                  	//获取最大页数
		try{
			for(int i=(Page-1)*pagesize;i<=Page*pagesize-1;i++){
				try{
					if(i>=recordCount){break;}
				}catch(Exception e){}
				newList.add((Object)list.get(i));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return newList;
	}

	public List<Object> getAppointPage(int Page){
		List<Object> newList=new ArrayList<Object>();
		try{
			for(int i=(Page-1)*pagesize;i<=Page*pagesize-1;i++){
				try{
					if(i>=recordCount){break;}
				}catch(Exception e){}
				newList.add((Object)list.get(i));
			}
			}catch(Exception e){
				e.printStackTrace();
			}
			return newList;
	}

	public int getMaxPage(){
		int maxPage=(recordCount%pagesize==0)?(recordCount/pagesize):(recordCount/pagesize+1);
		return maxPage;
	}

	public int getRecordSize(){
		return recordCount;
	}
	

	public int getPage(String str){		
		if(str==null){
			str="0";
		}
		int Page=Integer.parseInt(str);
		if(Page<1){
			Page=1;
		}else{
			if(((Page-1)*pagesize+1)>recordCount){
				Page=maxPage;
			}
		}
		return Page;
	}

	


	public String printCtrl(int Page){
		String strHtml="<div style='width:980px;text-align:right;padding:10px;color:#525252;'>当前页数：["+Page+"/"+maxPage+"]&nbsp;&nbsp;";
		try{
		if(Page>1){
			strHtml=strHtml+"<a href='?&Page=1'>第一页</a>　";
			strHtml=strHtml+"&nbsp;&nbsp;<a href='?Page="+(Page-1)+"'>上一页</a>";
		}
		if(Page<maxPage){
			strHtml=strHtml+"&nbsp;&nbsp;<a href='?Page="+(Page+1)+"'>下一页</a>&nbsp;&nbsp;　<a href='?Page="+maxPage+"'>最后一页&nbsp;</a>";
		}
		strHtml=strHtml+"</div>";
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return strHtml;
	}
	
	
	
}
