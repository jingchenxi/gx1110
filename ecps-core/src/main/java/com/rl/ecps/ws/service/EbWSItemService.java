package com.rl.ecps.ws.service;

import java.io.IOException;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;

import freemarker.template.TemplateException;

@WebService(
serviceName="freemarketService"
,portName="freemarketPort"
,name="freemarketPortType"
		)
public interface EbWSItemService {

	@WebMethod(operationName="publishItem")
	public @WebResult(name="returnWord") String publishItem(@WebParam(name="itemId") Long itemId,@WebParam(name="password") String password) throws IOException, TemplateException;
}
