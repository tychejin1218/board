<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>      
    
<%	
    // JSP 캐시 삭제
    response.setHeader("Cache-Control","no-store");   
    response.setHeader("Pragma","no-cache");   
    response.setDateHeader("Expires",0);   
    
    if (request.getProtocol().equals("HTTP/1.1")) 
        response.setHeader("Cache-Control", "no-cache"); 
	    
	// Context Root
	String contextRoot = response.encodeURL(request.getContextPath());	
%>

<c:set var="contextRoot" value="<%=contextRoot%>"/>	<!-- Context Root -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	/** 전역변수 선언 */
	var _CONTEXTROOT = "${contextRoot}";
	var _URLDOMAIN = getUrlDomain();

	$(document).ready(function(){		
		getBoardList();
	});
		
	/** 도메인 값 얻기  */
	function getUrlDomain() {		
		return (location.href).replace("http://", "").replace("https://", "").split("/")[0];
	}
	
	/** 게시판 - 상세 페이지 이동 */
	function goBoardDetail(boardSeq){				
		location.href = "http://" + _CONTEXTROOT + _URLDOMAIN + "/board/boardDetail?boardSeq="+ boardSeq;
	}
	
	/** 게시판 - 작성 페이지 이동 */
	function goBoardWrite(){				
		location.href = "http://" + _CONTEXTROOT + _URLDOMAIN + "/board/boardWrite";
	}

	/** 게시판 - 목록 조회  */
	function getBoardList(){
		
		$.ajax({	
		
		    url		:"/board/getBoardList",
		    data    : $("#boardForm").serialize(),
	        dataType:"JSON",
	        cache   : false,
			async   : true,
			type	:"GET",	
	        success : function(obj) {
				getBoardListCallback(obj);				
	        },	       
	        error 	: function(xhr, status, error) {}
	        
	     });
	}
	
	/** 게시판 - 목록 조회  콜백 함수 */
	function getBoardListCallback(obj){
		
		var list = obj;
		var listLen = obj.length;
				
		var str = "";
		
		if(listLen >  0){
			
			for(var a=0; a<listLen; a++){
				
				var boardSeq		= list[a].board_seq; 
				var boardReRef 		= list[a].board_re_ref; 
				var boardReLev 		= list[a].board_re_lev; 
				var boardReSeq 		= list[a].board_re_seq; 
				var boardWriter 	= list[a].board_writer; 
				var boardSubject 	= list[a].board_subject; 
				var boardContent 	= list[a].board_content; 
				var boardHits 		= list[a].board_hits;
				var delYn 			= list[a].del_yn; 
				var insUserId 		= list[a].ins_user_id;
				var insDate 		= list[a].ins_date; 
				var updUserId 		= list[a].upd_user_id;
				var updDate 		= list[a].upd_date;
				
				str += "<tr>";
				str += "<td>"+ boardSeq +"</td>";
				str += "<td onclick='javascript:goBoardDetail("+ boardSeq +");'>"+ boardSubject +"</td>";
				str += "<td>"+ boardHits +"</td>";
				str += "<td>"+ boardWriter +"</td>";	
				str += "<td>"+ insDate +"</td>";	
				str += "</tr>";
				
			} 
			
		} else {
			
			str += "<tr>";
			str += "<td colspan='5'>등록된 글이 존재하지 않습니다.</td>";
			str += "<tr>";
		}
		
		$("#tbody").html(str);
	}
	
</script>
</head>
<body>
<h2>게시글 목록</h2>
<form id="boardForm" name="boardForm">
	<table border=1 width="650px">
		<colgroup>
			<col width="10%" />
			<col width="20%" />
			<col width="10%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		<thead>		
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>조회수</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody id="tbody">
		
		</tbody>	
	</table>
</form>
<button onclick="javascript:goBoardWrite();">작성하기</button>
</body>
</html>