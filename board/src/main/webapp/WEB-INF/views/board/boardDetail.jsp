<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   

<%	
	String boardSeq = request.getParameter("boardSeq");	

	System.out.println(boardSeq);
%>

<!-- 게시글 번호 -->
<c:set var="boardSeq" value="<%=boardSeq%>"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 상세</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){		
		
		var boardSeq = $("#boardSeq").val();

		getBoardDetail(boardSeq);
	});

	/** 게시판 - 상세 조회  */
	function getBoardDetail(boardSeq){
		console.log("boardSeq : " + boardSeq);
		var param = {
			board_seq : boardSeq
		};
		
		$.ajax({	
		
		    url		:"/board/getBoardDetail",
		    data    : param,
	        dataType:"JSON",
	        cache   : false,
			async   : param.async == undefined ? true : param.async,
			type	:"GET",	
	        success : function(obj) {
				getBoardListCallback(obj);				
	        },	       
	        error 	: function(xhr, status, error) {}
	        
	     });
	}
	
	/** 게시판 - 상세 조회  콜백 함수 */
	function getBoardDetailCallback(obj){
		
		console.log(obj);
		var data = obj;
				
		var str = "";
						
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
		str += "<td>"+ boardSubject +"</td>";
		str += "<td>"+ boardHits +"</td>";
		str += "<td>"+ insUserId +"</td>";	
		str += "<td>"+ insDate +"</td>";	
		str += "</tr>";
				
		
		$("#tbody").html(str);
	}
	
</script>
</head>
<body>
<table border=1 width="650px">
	<colgroup>
		<col width="15%" />
		<col width="20%" />
		<col width="10%" />
		<col width="15%" />
		<col width="20%" />
	</colgroup>
	<thead>		
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>조회수</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
	</thead>
	<tbody id="tbody">
	
	</tbody>	
</table>

<!-- 게시글 번호 -->
<input type="hidden" id="boardSeq" name="boardSeq" value="${boardSeq}"/>

</body>
</html>