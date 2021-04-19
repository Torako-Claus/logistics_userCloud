package com.webtier;

import java.util.Timer;
import java.util.TimerTask;
import com.dao.*;

public class TimerUse {
	public static void main(String[] args) {
	    timer();
	 }
	  public static void timer() {
	    Timer timer = new Timer();
	    timer.schedule(new TimerTask() {
	      public void run() {
	    	GetData.getData();
				/* EntityDao.getTemperature(); */
	      }
	    }, 2000L, 1000*70L);
	  }
}
