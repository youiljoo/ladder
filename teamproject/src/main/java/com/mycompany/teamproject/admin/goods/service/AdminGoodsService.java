package com.mycompany.teamproject.admin.goods.service;

import java.util.List;
import java.util.Map;

import com.mycompany.teamproject.board.vo.SearchCriteriaVO;
import com.mycompany.teamproject.goods.vo.GoodsVO;

public interface AdminGoodsService {
	 
	// ��ǰ ����
	public List<Map<String,Object>>AllGoodsList(SearchCriteriaVO scri) throws Exception; // ��ǰ ��� (����¡, �˻� ��� �߰�)
	public int AllGoodsListCnt(SearchCriteriaVO scri) throws Exception;
	public Map GoodsDetail(int productNum) throws Exception; //��ǰ��
	public int addNewGoods(Map newGoodsMap) throws Exception; //��ǰ ���
	
	
	// ��ǰ �������� �� �ı�
		public List<Map<String,Object>>reviewList(SearchCriteriaVO scri) throws Exception; // ���� ��� (����¡, �˻� ��� �߰�)
		public int reviewListCnt(SearchCriteriaVO scri) throws Exception;
		public GoodsVO Reviewdetail(int re_num) throws Exception; // �ı� �󼼺���
		public void updateReview(GoodsVO vo)throws Exception; //�ı� �亯�ϱ�
		public void deleteReview(int re_num)throws Exception; // �ı� ����
		
		
}
