package com.mycompany.teamproject.board.vo;

public class SearchCriteriaVO extends CriteriaVO{

	private String searchType = "";
	private String keyword = "";
	
	
	// ��ǰ ��ȣ�� �´� �ı� ����Ʈ�� �ҷ����� ���� �ڵ�
	private int productNum;
	 
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	

	

	
	
	
	
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
}