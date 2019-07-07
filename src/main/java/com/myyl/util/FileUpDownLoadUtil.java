package com.myyl.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;



/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


public final class FileUpDownLoadUtil {

	/**
	 * 功能：文件下载 
	 */
	public static void download(HttpServletRequest request, HttpServletResponse response){
		
		try {
			request.setCharacterEncoding("utf-8");
			
			String fileName = request.getParameter("fileName");
			String path = "D:/WebFile"+"\\"+fileName;
			// 获取一个文件流
			InputStream in = new FileInputStream(new File(path));
			// 如果文件名是中文，需要进行url编码
		    if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0) {  
		        fileName = URLEncoder.encode(fileName, "UTF-8");  	//如果是IE，则用此方式解决乱码问题
		    } else {  
		        fileName = new String(fileName.getBytes("UTF-8"), "ISO8859-1");  	//其他浏览器
		    }  
			response.setHeader("content-disposition", "attachment;fileName="+fileName.split("_")[1]);
			// 获取response字节流
			OutputStream out = response.getOutputStream();
			byte[] b = new byte[1024];
			int len = -1;
			while ((len = in.read(b)) != -1){
				out.write(b, 0, len);
			}
			// 关闭
			out.close();
			in.close();
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
