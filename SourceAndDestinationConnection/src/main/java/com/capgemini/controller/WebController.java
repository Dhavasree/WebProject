package com.capgemini.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.capgemini.model.Connection;
import com.capgemini.model.CopyData;
import com.capgemini.model.DataPump;
import com.capgemini.model.JsonResponse;
import com.capgemini.model.MappingInfo;
import com.capgemini.model.Table;
import com.capgemini.service.DatapumpService;

@Controller
public class WebController {
	@Autowired
	DatapumpService service;
	DataPump d=null;
	CopyData copydata=new CopyData();
	@RequestMapping("/home")
	public String sourceForm() {
		return "connection";
	}

	@RequestMapping(value = "/SourceConn")
	public @ResponseBody JsonResponse validateConnection(
			@ModelAttribute("source") Connection source, BindingResult result) {
		JsonResponse response = new JsonResponse();
		System.out.println(source);
		DataPump dataPump=copydata.initSource(source);
		System.out.println("Source Connection Success");
		response.setValidated(true);
		response.setSource(source);
		return response;
	}

	@RequestMapping(value = "/DestinationConn")
	public @ResponseBody JsonResponse loginDestination(
			@ModelAttribute Connection destination, BindingResult result) {
		JsonResponse response = new JsonResponse();
		System.out.println(destination);
		DataPump dataPump=copydata.initDestination(destination);
		response.setValidated(true);
		response.setDestination(destination);
		System.out.println("Destination Connection Success");
		return response;
	}

	@RequestMapping("/table")
	public ModelAndView table() {

		return new ModelAndView("table");

	}

	@RequestMapping("/alltable")
	public ModelAndView login(@ModelAttribute("table") Table table,
			BindingResult result, Model model) {
	
		List<MappingInfo> srcColumLst = new ArrayList<MappingInfo>();
		MappingInfo info=new MappingInfo();
		System.out.println(table);
		DataPump datapump=copydata.initTable(table);
		java.sql.Connection sourceCon = null;
		java.sql.Connection destCon = null;
		if(service.Connect(datapump))
		{
			sourceCon=service.sourceFunction();
			destCon=service.destinationFunction();
		}
		System.out.println("connection done");
		srcColumLst=copydata.MetaData(datapump,sourceCon,destCon);
		System.out.println("Table connection");
		srcColumLst=service.constructQueries(datapump,srcColumLst);
		service.transferData(srcColumLst);
		service.closeConnection();
		System.out.println("END ");
		return null;
	}

}
