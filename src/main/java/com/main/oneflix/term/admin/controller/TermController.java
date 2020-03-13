package com.main.oneflix.term.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.main.oneflix.term.service.DeleteTermService;
import com.main.oneflix.term.service.GetTermListService;
import com.main.oneflix.term.service.GetTermService;
import com.main.oneflix.term.service.InsertTermService;
import com.main.oneflix.term.service.UpdateTermService;

@Controller
public class TermController {
	@Autowired
	private InsertTermService insertTermService;
	@Autowired
	private UpdateTermService updateTermService;
	@Autowired
	private DeleteTermService deleteTermService;
	@Autowired
	private GetTermService getTermService;
	@Autowired
	private GetTermListService getTermListService;
	
	
}
