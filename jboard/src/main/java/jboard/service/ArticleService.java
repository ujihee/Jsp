package jboard.service;

import java.util.List;

import jboard.dao.ArticleDAO;
import jboard.dto.ArticleDTO;
import jboard.dto.PagenationDTO;

public enum ArticleService {
	
	INSTANCE;
	
	private ArticleDAO dao = ArticleDAO.getInstance();
	
	// 게시판 페이지네이션 처리 메서드
	public PagenationDTO getPagenationDTO(String pg, String searchType, String keyword) {
		
		int total = 0;
		
		if(keyword == null) {
			// 전체 게시물 갯수 구하기
			total = dao.selectCountTotal();
		}else {
			total = dao.selectCountSearch(searchType, keyword);
		}
				
		// 마지막 페이지번호 구하기
		int lastPageNum = 0;
		
		if(total % 10 == 0) {
			lastPageNum = total / 10;	  // 10으로 나누어 떨어지면
		}else {
			lastPageNum = total / 10 + 1; // 10으로 나누어 떨어지지 않음
		}		
	
		// 현재 페이지 번호 시작값 구하기
		int currentPage = 1;
		
		if(pg != null) {
			currentPage = Integer.parseInt(pg);	
		}
		
		int start = (currentPage - 1) * 10;		
		
		// 현재 페이지 그룹 구하기
		int currentPageGroup = (int) Math.ceil(currentPage / 10.0);
		int pageGroupStart = (currentPageGroup - 1) * 10 + 1;
		int pageGroupEnd = currentPageGroup * 10;
		
		if(pageGroupEnd > lastPageNum) {
			pageGroupEnd = lastPageNum;
		}
		
		// 현재 페이지 글 시작 번호 구하기
		int currentPageStartNum = total - (currentPage - 1) * 10;
		
		PagenationDTO dto = new PagenationDTO();
		dto.setTotal(total);
		dto.setStart(start);
		dto.setCurrentPage(currentPage);
		dto.setCurrentPageStartNum(currentPageStartNum);
		dto.setLastPageNum(lastPageNum);
		dto.setPageGroupStart(pageGroupStart);
		dto.setPageGroupEnd(pageGroupEnd);
		
		return dto;
	}
	public int register(ArticleDTO dto) {
		return dao.insert(dto);
	}
	public int getCountTotal() {
		return dao.selectCountTotal();
	}	
	public ArticleDTO findAricleWithFile(String ano) {
		return dao.selectArticleWithFile(ano);
	}
	public List<ArticleDTO> findAll(int start) {
		return dao.selectAll(start);
	}
	public List<ArticleDTO> findAllSearch(int start, String searchType, String keyword) {
		return dao.selectArticleSearch(start, searchType, keyword);
	}
	public void modify(ArticleDTO dto) {
		dao.update(dto);
	}	
	public void remove(int ano) {
		dao.delete(ano);
	}
}