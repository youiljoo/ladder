package com.mycompany.teamproject.mypage.service;

import java.util.List;
import java.util.Map;

import com.mycompany.teamproject.board.vo.CriteriaVO;
import com.mycompany.teamproject.board.vo.SearchCriteriaVO;
import com.mycompany.teamproject.order.vo.OrderVO;

public interface MypageService {
	public List<OrderVO> listMyOrderGoods(String user_id) throws Exception;
	public List<Map<String, Object>> orderList(SearchCriteriaVO scri) throws Exception;
	public int orderListCnt(SearchCriteriaVO scri) throws Exception;
	
	// A/S 교환,반품 내역
	public List<Map<String, Object>> mypageSelect(SearchCriteriaVO scri) throws Exception;
	public int mypageList(SearchCriteriaVO scri) throws Exception;
	
	public int pro_review(Map asMap)throws Exception; // 상품 후기
	
	
	public List<Map<String,Object>>reviewList(CriteriaVO cri) throws Exception; // 내가 쓴 리뷰 목록 (페이징 추가)
	public int reviewListCnt(CriteriaVO cri) throws Exception;
	public Map reviewDetail(int re_num) throws Exception; // 리뷰 상세보기

	
	public void deleteReview(int re_num)throws Exception; // 후기 삭제
	
	public List<Map<String,Object>>conList(SearchCriteriaVO scri) throws Exception; // 상담내역 목록 (페이징,검색 추가)
	public int conListCnt(SearchCriteriaVO scri) throws Exception;
}

