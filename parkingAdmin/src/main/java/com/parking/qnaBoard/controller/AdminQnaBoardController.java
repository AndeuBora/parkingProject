package com.parking.qnaBoard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parking.board.paging.Paging;
import com.parking.board.paging.Util;
import com.parking.qnaBoard.service.AdminQnaBoardService;
import com.parking.qnaBoard.vo.AdminQnaBoardVO;

@Controller
@RequestMapping(value = "/adminQnaBoard")
public class AdminQnaBoardController {

	@Autowired
	private AdminQnaBoardService adminQnaBoardService;

	/* qna 글 리스트 구현 */
	@RequestMapping(value = "/qnaBoardAdminReplyMain")
	public String adminQnaBoardList(@ModelAttribute AdminQnaBoardVO aqvo, Model model) {

		/* 페이지 세팅 */
		Paging.set(aqvo);

		/* 전체 레코드 수 구하기 */
		int total = adminQnaBoardService.adminQnaBoardCnt(aqvo);

		int count = total - (Util.nvl(aqvo.getPage()) - 1) * Util.nvl(aqvo.getPageSize());

		List<AdminQnaBoardVO> adminQnaBoardList = adminQnaBoardService.adminQnaBoardList(aqvo);
		model.addAttribute("adminQnaBoardList", adminQnaBoardList);
		model.addAttribute("count", count);
		model.addAttribute("data", aqvo);
		model.addAttribute("total", total);

		return "adminQnaBoard/qnaBoardAdminReplyMain";
	}

	/* qna 글 상세보기 구현 */
	@RequestMapping(value = "/adminQnaBoardDetail", method = RequestMethod.GET)
	public String adminQnaBoardDetail(@ModelAttribute AdminQnaBoardVO aqvo, Model model) {
		AdminQnaBoardVO detail = new AdminQnaBoardVO();
		detail = adminQnaBoardService.adminQnaBoardDetail(aqvo);

		if (detail != null && (!detail.equals(""))) {
			detail.setQnaContent(detail.getQnaContent().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "adminQnaBoard/adminQnaBoardDetail";
	}

}