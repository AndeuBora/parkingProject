package com.parking.noticeBoard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parking.board.paging.Paging;
import com.parking.board.paging.Util;
import com.parking.noticeBoard.service.AdminNoticeBoardService;
import com.parking.noticeBoard.vo.AdminNoticeBoardVO;

@Controller
@RequestMapping(value = "/noticeBoard")
public class AdminNoticeBoardController {

	@Autowired
	private AdminNoticeBoardService adminNoticeBoardService;

	/* 공지사항 글 리스트 출력 */
	@RequestMapping(value = "/adminNoticeBoardMain")
	public String adminNoticeBoardList(@ModelAttribute AdminNoticeBoardVO avo, Model model) {

		/* 페이지 세팅 */
		Paging.set(avo);

		/* 전체 레코드 수 구하기 */
		int total = adminNoticeBoardService.adminNoticeBoardCnt(avo);

		int count = total - (Util.nvl(avo.getPage()) - 1) * Util.nvl(avo.getPageSize());

		List<AdminNoticeBoardVO> adminNoticeBoardList = adminNoticeBoardService.adminNoticeBoardList(avo);
		model.addAttribute("adminNoticeBoardList", adminNoticeBoardList);
		model.addAttribute("count", count);
		model.addAttribute("data", avo);
		model.addAttribute("total", total);

		return "noticeBoard/adminNoticeBoardMain";
	}

	/* 공지사항 글 등록 폼 출력 */
	@RequestMapping(value = "/adminNoticeBoardInsertForm", method = RequestMethod.GET)
	public String adminNoticeBoardInsertForm() {
		return "noticeBoard/adminNoticeBoardInsertForm";
	}

	/* 공지사항 글 등록 구현 */
	@RequestMapping(value = "/adminNoticeBoardInsert", method = RequestMethod.POST)
	public String adminNoticeBoardInsert(@ModelAttribute AdminNoticeBoardVO avo, HttpSession session) {
		int result = 0;
		String url = "";

		result = adminNoticeBoardService.adminNoticeBoardInsert(avo);
		if (result == 1) {
			url = "/noticeBoard/adminNoticeBoardMain.do";
		}

		return "redirect:" + url;
	}

	/* 공지사항 글 상세보기 구현 */
	@RequestMapping(value = "/adminNoticeBoardDetail", method = RequestMethod.GET)
	public String adminNoticeBoardDetail(@ModelAttribute AdminNoticeBoardVO avo, Model model) {
		AdminNoticeBoardVO detail = new AdminNoticeBoardVO();
		detail = adminNoticeBoardService.adminNoticeBoardDetail(avo);

		if (detail != null && (!detail.equals(""))) {
			detail.setNoticeContent(detail.getNoticeContent().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "noticeBoard/adminNoticeBoardDetail";
	}

	/* 공지사항 글 삭제하기 구현 */
	@RequestMapping(value = "/adminNoticeBoardDelete")
	public String adminNoticeBoardDelete(@ModelAttribute AdminNoticeBoardVO avo) {
		int result = 0;
		String url = "";

		result = adminNoticeBoardService.adminNoticeBoardDelete(avo.getNoticeNum());
		if (result == 1) {
			url = "/noticeBoard/adminNoticeBoardMain.do";
		}
		return "redirect:" + url;
	}

	/* 공지사항 글 수정 폼 출력 */
	@RequestMapping(value = "/adminNoticeBoardUpdateForm", method = RequestMethod.POST)
	public String adminNoticeBoardUpdateForm(@ModelAttribute AdminNoticeBoardVO avo, Model model) {
		AdminNoticeBoardVO updateData = new AdminNoticeBoardVO();
		updateData = adminNoticeBoardService.adminNoticeBoardDetail(avo);

		model.addAttribute("updateData", updateData);

		return "noticeBoard/adminNoticeBoardUpdateForm";
	}

	/* 공지사항 글 수정하기 구현 */
	@RequestMapping(value = "/adminNoticeBoardUpdate", method = RequestMethod.POST)
	public String adminNoticeBoardUpdate(@ModelAttribute AdminNoticeBoardVO avo) {
		int result = 0;
		String url = "";

		result = adminNoticeBoardService.adminNoticeBoardUpdate(avo);

		if (result == 1) {
			url = "/noticeBoard/adminNoticeBoardMain.do";
		}
		return "redirect:" + url;
	}

}