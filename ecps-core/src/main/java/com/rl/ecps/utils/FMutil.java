package com.rl.ecps.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FMutil {

	public void outputFile(String ftlName,String fileName,Map<String, Object> map) throws IOException, TemplateException {
		//创建freemarket模版配置对象
		Configuration config = new Configuration();
		//配置默认编码格式
		config.setDefaultEncoding("UTF-8");
		//设置模版的包路径(模版的位置)
		config.setClassForTemplateLoading(this.getClass(),"/com/rl/ecps/ftl");
		//获取到模版对象
		Template template = config.getTemplate(ftlName);
		//指定生成的html文件的输出路径
		String path = "E:\\学习资料\\ecps-parent1110\\ecps-parent1110\\ecps-portal\\src\\main\\webapp\\static";
		//定义输出流,注意指定输出文件编码格式
		Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File(path+"/"+fileName)),"UTF-8"));
		//根据模版生成静态html文件
		template.process(map, out);
		
	}
}
