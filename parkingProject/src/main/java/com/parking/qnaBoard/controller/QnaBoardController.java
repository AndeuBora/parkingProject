package com.parking.qnaBoard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	/* qna 글 리스트 구현 */
	@RequestMapping(value = "/qnaBoardMemberReplyMain")
	public String qnaBoardList(@ModelAttribute QnaBoardVO qvo, Model model) {
		List<QnaBoardVO> qnaBoardList = qnaBoardService.qnaBoardList(qvo);
		model.addAttribute("qnaBoardList", qnaBoardList);

		return "qnaBoard/qnaBoardMemberReplyMain";
	}

	/* qna 글 등록 폼 출력 */
	@RequestMapping(value = "/qnaBoardWrite", method = RequestMethod.GET)
	public String qnaBoardWrite() {
		return "qnaBoard/qnaBoardWrite";
	}

	/* qna 글 등록 구현 */
	@RequestMapping(value = "/qnaBoardInsert", method = RequestMethod.POST)
	public String qnaBoardInsert(@ModelAttribute QnaBoardVO qvo) {
		int result = 0;
		String url = "";

		result = qnaBoardService.qnaBoardInsert(qvo);
		if (result == 1) {
			url = "/qnaBoard/qnaBoardMemberReplyMain.do";
		}

		return "redirect:" + url;
	}
}
