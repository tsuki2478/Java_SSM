package cn.hd.common;

import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 时间++
 * @author Administrator
 *
 */
public  class PrimaryKey {

	private static long key=0;
	private static long filekey=0;
	public synchronized  static String getWorkorderId(){
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");	
		String nowstr=sdf.format(new Date());
		key++;
		return "C"+nowstr+String.valueOf(key);
	}
	public synchronized static String getFileNewName(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
	    String nowstr= sdf.format(new Date());
	    filekey++;
		return nowstr+String.valueOf(filekey);
	}
}