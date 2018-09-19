<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){		
		getBoardList();
	});

	function getBoardList(){
		
		$.ajax({			
			type:"GET",
		    url:"/board/getBoardList",
	        dataType:"JSON",
	        success : function(obj) {
				getBoardListCallback(obj);				
	        },	       
	        error : function(xhr, status, error) {}
	     });
	}
	
	function getBoardListCallback(obj){
		
		var list = obj;
		var listLen = obj.length;
		
		console.log(list);
		console.log(listLen);
		
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
				str += "<td>"+ boardSubject +"</td>";
				str += "<td>"+ boardHits +"</td>";
				str += "<td>"+ boardWriter +"</td>";				
				str += "</tr>";
				
			} 
			
		} else {
			
			str += "<tr colspan='4'>";
			str += "<td>등록된 글이 존재하지 않습니다.</td>";
			str += "<tr>";
		}
		
		$("#tbody").html(str);
	}
	
</script>
</head>
<body>
<table border=1 width=350>
	<thead>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>조회수</td>
			<td>작성자</td>
		</tr>
	</thead>
	<tbody id="tbody">
	
	</tbody>
	
</table>
</body>
</html>