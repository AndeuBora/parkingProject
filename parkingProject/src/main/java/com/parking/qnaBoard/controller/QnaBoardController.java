package com.parking.qnaBoard.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parking.qnaBoard.service.QnaBoardService;
import com.parking.qnaBoard.vo.QnaBoardVO;

@Controller
@RequestMapping(value = "/qnaBoard")
public class QnaBoardController {

	@Autowired
	private QnaBoardService qnaBoardService;

	@RequestMapping(value = "/qnaBoardWrite")
	public String qnaBoardWrite(HttpSession session) {
		session.setAttribute("CSRF_TOKEN", UUID.randomUUID().toString());

		return "qnaBoard/qnaBoardWrite";
	}

	@RequestMapping(value = "/qnaBoardInsert", method = RequestMethod.POST)
	public String qnaBoardInsert(@ModelAttribute QnaBoardVO qvo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		int result = 0;
		String url = "";

		result = qnaBoardService.qnaBoardInsert(qvo);
		if (result == 1) {
			url = "/qnaBoard/qnaBoardMemberReplyMain.do";
		}

		return "redirect: " + url;
	}
}
