package com.rl.ecps.controller;


import java.io.IOException;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.jaxrs.ext.multipart.Multipart;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.rl.ecps.utils.ECPSUtils;
import com.rl.ecps.utils.UploadResponse;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;

import net.sf.json.JSONObject;




@Controller
@RequestMapping("/upload")
public class EbUploadController {

	@RequestMapping("/uploadPic.do")
	public void uploadPic(HttpServletRequest request,Writer out) throws IOException {
	  //把request转换成复杂request
      MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;

      //获取文件
      Map<String, MultipartFile> map = mr.getFileMap();
      Set<String> set = map.keySet();
      Iterator<String> iter = set.iterator();
	  String fileInputName = iter.next();
	  MultipartFile mf = map.get(fileInputName);
	  //获得文件的字节数组
	  byte[] bs = mf.getBytes();
	  
	  //生成随机文件名
	  String fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
	  Random random = new Random();
	  for(int i= 0;i<3;i++) {
		  fileName = fileName+random.nextInt(10);
	  }
	  
	  //获取原始文件名
	  String oriFileName = mf.getOriginalFilename();
	  //获取文件后缀
	  String suffix = oriFileName.substring(oriFileName.lastIndexOf("."));
	  
	  //指定上传路径(绝对路径)
	  String uploadPath = ECPSUtils.readProp("file_path")+"/upload/"+fileName+suffix;
	  //获取上传路径的相对路径(存储在数据库中)
	  String relaticePath = "/upload/"+fileName+suffix;
	  
	  //创建jerrsy的客户端
	  Client client = Client.create();
	  //创建web资源对象
	  WebResource wr = client.resource(uploadPath);
	  
	  //上传
	  wr.put(bs);
	  
	  JSONObject jo = new JSONObject();
	  jo.accumulate("realPath",uploadPath);
	  jo.accumulate("relativePath", relaticePath);
	  
	  String result = jo.toString();
	  out.write(result);
	}
	
	@RequestMapping("/uploadForFck.do")
	public void uploadForFck(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		
		if(multipartResolver.isMultipart(request)) {
			
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		    Iterator<String> iterator = multiRequest.getFileNames();
		    
		    while(iterator.hasNext()) {
		    	MultipartFile file = multiRequest.getFile(iterator.next());
		    	
		    	if(file!=null) {
		    		byte[] bytes = file.getBytes();
		    		String originalFileName = file.getOriginalFilename();
		    		String suffix = originalFileName.substring(originalFileName.lastIndexOf("."));
		    		Random r = new Random();
		    		String fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
		    		
		    		for(int i=0;i<3;i++) {
		    			fileName = fileName + r.nextInt(10);
		    		}
		    		
		    		String uploadFilePath = ECPSUtils.readProp("file_path")+"/upload/"+fileName+suffix;
		    		String relativePath = "/upload/"+fileName+suffix;
		    		
		    		Client client = Client.create();
		    		WebResource wr = client.resource(uploadFilePath);
		    		wr.put(bytes);
		    		
		    		UploadResponse uploadResponse = new UploadResponse(UploadResponse.EN_OK,uploadFilePath);
		    		
		    		response.getWriter().println(uploadResponse);
		    	}
		    }
		}
	}
	
	@RequestMapping("/deleteUploadPic.do")
	public void deleteUploadPic(String deleteFileName) {
		Client client = Client.create();
		WebResource webService = client.resource(deleteFileName);
		
		webService.delete();
	}

}
