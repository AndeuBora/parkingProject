package com.parking.noticeBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/noticeBoard")
public class NoticeBoardController {

	@RequestMapping(value = "/noticeBoardMain")
	public String noticeBoardMain() {
		return "noticeBoard/noticeBoardMain";
	}
}
