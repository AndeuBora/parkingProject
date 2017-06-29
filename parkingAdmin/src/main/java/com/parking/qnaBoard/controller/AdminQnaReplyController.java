package com.parking.qnaBoard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.parking.qnaBoard.service.AdminQnaReplyService;
import com.parking.qnaBoard.vo.AdminQnaReplyVO;

@RestController
@RequestMapping(value = "/adminQnaReply")
public class AdminQnaReplyController {

	@Autowired
	private AdminQnaReplyService adminQnaReplyService;
	
	/* 댓글 글목록 구현하기 */
	@RequestMapping(value = "/all/{qnaNum}.do", method = RequestMethod.GET)
	public ResponseEntity<List<AdminQnaReplyVO>> list(@PathVariable("qnaNum") Integer qnaNum) {
		ResponseEntity<List<AdminQnaReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(adminQnaReplyService.adminQnaReplyList(qnaNum), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/* 댓글 글쓰기 구현하기 */
	@RequestMapping(value = "adminQnaReplyInsert")
	public ResponseEntity<String> adminQnaReplyInsert(@RequestBody AdminQnaReplyVO aqvo) {
		ResponseEntity<String> entity = null;
		int result;
		try {
			result = adminQnaReplyService.adminQnaReplyInsert(aqvo);
			if (result == 1) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/* 댓글 수정 구현하기 */
	@RequestMapping(value = "/{replyNum}.do", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> adminQnaReplyUpdate(@PathVariable("replyNum") Integer replyNum,
			@RequestBody AdminQnaReplyVO aqvo) {
		ResponseEntity<String> entity = null;
		try {
			aqvo.setReplyNum(replyNum);
			adminQnaReplyService.adminQnaReplyUpdate(aqvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/* 댓글 삭제 구현하기 */
	@RequestMapping(value = "/{replyNum}.do", method = RequestMethod.DELETE)
	public ResponseEntity<String> adminQnaReplyDelete(@PathVariable("replyNum") Integer replyNum) {
		ResponseEntity<String> entity = null;
		try {
			adminQnaReplyService.adminQnaReplyDelete(replyNum);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
