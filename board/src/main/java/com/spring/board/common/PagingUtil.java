package com.spring.board.common;

import com.spring.board.dto.CommonDto;
import com.spring.board.form.CommonForm;

/**
 * 페이징 네비게이션 정보 설정을 위한 클래스 
 */
public class PagingUtil { 

	public static CommonDto setPageUtil(CommonForm commonForm) {

		CommonDto commonDto = new CommonDto();

		String pagination = ""; // 페이징 결과 값
		String functionName = commonForm.getFunction_name(); // 페이징 목록을 요청하는 자바스크립트 함수명
		int currentPageNo = commonForm.getCurrent_page_no(); // 현재 페이지 번호
		int countPerList = commonForm.getCount_per_list(); // 한 화면에 출력될 게시물 수
		int countPerPage = commonForm.getCount_per_page(); // 한 화면에 출력될 페이지 수
		int totalListCount = commonForm.getTatal_list_count(); // 총 게시물 수
		int totalPageCount = totalListCount / countPerList; // 총 페이지 수
		if (totalListCount % countPerList > 0) { // 총 페이수를 구할 때 int형으로 계산하면 나머지가 있는 경우 게시물이 존재하기 때문에 총 페이지의 수를 수정
			totalPageCount = totalPageCount + 1;
		}

		int firstPageNo = (((currentPageNo - 1) / countPerPage) * countPerPage) + 1; // 첫 페이지 번호
		int lastPageNo = firstPageNo + countPerPage - 1;	// 마지막 페이지 번호
		if (lastPageNo > totalPageCount) { // 마지막 페이지의 수가 총 페이지의 수보다 큰 경우는 게시물이 존재하지 않기 때문에 마지막 페이지의 수를 수정
			lastPageNo = totalPageCount;
		}

		// 페이지 네이게이션 설정
		pagination += "<div class='pagination'>";

		if (firstPageNo > 1) {
			int pageNo = 1;
			pagination += "<a href='javascript:" + functionName + "(\"" + pageNo + "\");' class=\"direction_left01\">[<<]</a>";
		}

		if (currentPageNo > 1) {
			int pageNo = currentPageNo - 1;
			pagination += "<a href='javascript:" + functionName + "(" + pageNo + ");' class=\"direction_left01\">[<]</a>";
		}

		for (int a = firstPageNo; a <= lastPageNo; a++) {
			if (a == currentPageNo) {
				pagination += "<a href='javascript:" + functionName + "(\"" + a + "\");' class='onpage'>[" + a + "]</a>";
			} else {
				pagination += "<a href='javascript:" + functionName + "(\"" + a + "\");'>[" + a + "]</a>";
			}
		}

		if (currentPageNo < totalPageCount) {
			int pageNo = currentPageNo + 1;
			pagination += "<a href='javascript:" + functionName + "(" + pageNo + ");' class=\"direction_right01\">[>]</a>";
		}

		if (lastPageNo < totalPageCount) {
			int pageNo = totalPageCount;
			pagination += "<a href='javascript:" + functionName + "(" + pageNo + ");' class=\"direction_right01\">[>>]</a>";
		}
		
		pagination += "</div>";

		int startIndex = (currentPageNo - 1) * countPerPage + 1; // 한 화면의 표출되는 게시물의 시작 번호 (쿼리 조건절)
		int endIndex = currentPageNo * countPerPage; // 한 화면의 표출되는 게시물의 끝 번호 (쿼리 조건절)
		
		commonDto.setStart_index(startIndex);
		commonDto.setEnd_index(endIndex);
		commonDto.setPagination(pagination);

		return commonDto;
	}
}
