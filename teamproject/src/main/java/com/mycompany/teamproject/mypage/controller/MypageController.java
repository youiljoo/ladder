package com.mycompany.teamproject.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.teamproject.board.vo.CriteriaVO;
import com.mycompany.teamproject.board.vo.SearchCriteriaVO;

public interface MypageController {
	public ModelAndView mypageMain( HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView pro_review(@RequestParam("productNum")String productNum,HttpServletRequest request,HttpServletResponse response) throws Exception;  //�ı� �ۼ�
	public ResponseEntity pro_review_action(MultipartHttpServletRequest multipartRequest,HttpServletResponse response)throws Exception;
	public ModelAndView Allreview(CriteriaVO cri,HttpServletRequest request, HttpServletResponse response) throws Exception; // ���� �� �ı� ���
	public ModelAndView reviewDetail(@RequestParam("re_num") int re_num,HttpServletRequest request,HttpServletResponse response)throws Exception; // �ı� ��
	                                                                                                                                            // �ı� ����
	public String review_delete(@RequestParam("re_num")int re_num,RedirectAttributes redirect,Model model)throws Exception; // �ı� ����
	
	public ModelAndView myConsulting(SearchCriteriaVO scri,
            HttpServletRequest request, HttpServletResponse response) throws Exception;       // ��㳻�� 
}
