package com.parking.qnaBoard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.parking.qnaBoard.service.QnaBoardService;
import com.parking.qnaBoard.vo.Paging;
import com.parking.qnaBoard.vo.QnaBoardVO;
import com.parking.qnaBoard.vo.Util;

@Controller
@RequestMapping(value = "/qnaBoard")
public class QnaBoardController {

	@Autowired
	private QnaBoardService qnaBoardService;

	/* qna 글 리스트 구현 */
	@RequestMapping(value = "/qnaBoardMemberReplyMain")
	public String qnaBoardList(@ModelAttribute QnaBoardVO qvo, Model model) {

		/* 페이지 세팅 */
		Paging.set(qvo);

		/* 전체 레코드 수 구하기 */
		int total = qnaBoardService.qnaBoardCnt(qvo);

		int count = total - (Util.nvl(qvo.getPage()) - 1) * Util.nvl(qvo.getPageSize());

		List<QnaBoardVO> qnaBoardList = qnaBoardService.qnaBoardList(qvo);
		model.addAttribute("qnaBoardList", qnaBoardList);
		model.addAttribute("count", count);
		model.addAttribute("data", qvo);
		model.addAttribute("total", total);
		
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

	/* qna 글 상세보기 구현 */

	@RequestMapping(value = "/qnaBoardDetail", method = RequestMethod.GET)
	public String qnaBoardDetail(@ModelAttribute QnaBoardVO qvo, Model model) {
		QnaBoardVO detail = new QnaBoardVO();
		detail = qnaBoardService.qnaBoardDetail(qvo);

		if (detail != null && (!detail.equals(""))) {
			detail.setQnaContent(detail.getQnaContent().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "qnaBoard/qnaBoardDetail";
	}

	/* qna 글 비밀번호 확인 */
	@ResponseBody
	@RequestMapping(value = "/pwdConfirm", method = RequestMethod.POST)
	public String pwdConfirm(@ModelAttribute QnaBoardVO qvo) {
		int result = 0;
		result = qnaBoardService.pwdConfirm(qvo);
		return result + "";
	}

	/* qna 글 삭제하기 구현 */

	@RequestMapping(value = "/qnaBoardDelete")
	public String qnaBoardDelete(@ModelAttribute QnaBoardVO qvo) {
		int result = 0;
		String url = "";

		result = qnaBoardService.qnaBoardDelete(qvo.getQnaNum());
		if (result == 1) {
			url = "/qnaBoard/qnaBoardMemberReplyMain.do";
		}
		return "redirect:" + url;
	}

}
