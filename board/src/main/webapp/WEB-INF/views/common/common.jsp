<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
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

<c:set var="contextRoot" value="<%=contextRoot%>"/> <!-- 기본변수 -->

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="Expires" content="-1"> 
    <meta http-equiv="Pragma" content="no-cache"> 
    <meta http-equiv="Cache-control" content="no-cache"> 
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>게시판</title>

<!-- 공통 CSS -->

<!-- 공통 JavaScript -->
<script type="text/javascript" src="/js/common/jquery.js"></script>
<script type="text/javascript" src="/js/common/common.js"></script>

<!-- JavaScript 전역변수 선언 및 공통 함수 선언 -->
<script type="text/javascript">

	/** 전역변수 선언 */
	var _CONTEXTROOT = "${contextRoot}";
	var _URLDOMAIN 	 = getUrlDomain();
	
	/** 도메인 값 얻기  */
	function getUrlDomain() {
		
		return (location.href).replace("http://", "").replace("https://", "").split("/")[0];
	}
	
</script>