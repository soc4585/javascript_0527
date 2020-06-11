<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
		<script>
			function fun1() {
				console.log("fun1() 실행");
				div1 = document.getElementById("div1")	/* element = tag<> */
				div1.innerHTML += "<img src='${pageContext.request.contextPath}/resource/img/bg01.png'/>";
			}
			function fun2() {
				console.log("fun2() 실행");
				document.write("<img src='${pageContext.request.contextPath}/resource/img/bg01.png'/>");	/* 잘 안씀 (기존 내용을 없애고 내용을 새로 쓰는것) */
			}
			function fun3() {
				console.log("fun3() 실행");
				window.alert("이미지를 클릭했군요!");	/* 알림이 뜸 */
			}
		</script>
	</head>
	<body>
		<h5 class="alert alert-info">/home/exam02_output.jsp</h5>	
		
		<div>	<!-- div : 어떤 내용을 담는 컨테이너 역할 -->
			<a href="javascript:fun1()" class="btn btn-success btn-sm">동적 내용 넣기</a>	<!-- how1 : 버튼을 클릭하면 위의 fun1()이 실행됨 -->
			<button onclick="fun2()" class="btn btn-info btn-sm">동적 내용 넣기</button>	<!-- how2 : 버튼을 클릭하면 위의 fun2()이 실행됨 -->
			<a href="javascript:fun3()"><img src="${pageContext.request.contextPath}/resource/img/red_button.PNG"></a>	<!-- 버튼을 이미지로 넣기 -->
			<hr/>
			<div id="div1"></div>	<!-- id는 중복되면 안됨 -->
		</div>	
	</body>
</html>