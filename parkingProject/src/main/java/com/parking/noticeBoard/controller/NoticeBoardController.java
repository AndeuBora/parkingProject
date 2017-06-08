package com.parking.noticeBoard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parking.noticeBoard.service.NoticeBoardService;
import com.parking.noticeBoard.vo.NoticeBoardVO;

@Controller
@RequestMapping(value = "/noticeBoard")
public class NoticeBoardController {

	@Autowired
	private NoticeBoardService noticeBoardService;

	@RequestMapping(value = "/noticeBoardMain")
	public String noticeBoardMain(@ModelAttribute NoticeBoardVO nvo, Model model) {

		List<NoticeBoardVO> noticeBoardList = noticeBoardService.noticeBoardList(nvo);
		model.addAttribute("noticeBoardList", noticeBoardList);

		return "noticeBoard/noticeBoardMain";
	}
}
