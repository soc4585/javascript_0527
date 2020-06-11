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
			}
			
			function fun2(a, b) {	// 매개변수를 선언할 때 var를 넣지 않음
				var result = a + b;
				return result;				
			}
			
			function fun3(a, b) {	// 매개변수를 선언할 때 var를 넣지 않음
				var result = fun2(a, b);
				console.log(result);				
			}
			
			function fun4(result) {
				// 유효성 검사 코드
				if(result == null) {
					return false;
				} else {
					return true;	
				}
			}
			
			function fun5() {
				var mid = document.loginForm.mid.value;
				if(mid == "") {
					return false;
				} else {
					return true;
				}
			}
			
			// 이름이 없는 함수 선언
			var fun6 = function() {		// function var6() {...}와 같음
				console.log("fun6() 함수 실행")
			};
		</script>
	</head>
	<body>
		<h5 class="alert alert-info">/home/exam06_function.jsp</h5>		
		
		<div>
			<button onclick="fun1()" class="btn btn-success btn-sm">fun1() 호출</button>
			<button onclick="fun2(3, 5)" class="btn btn-success btn-sm">fun2() 호출</button>		<%-- 리턴값은 못받음 --%>
			<button onclick="fun3(3, 5)" class="btn btn-success btn-sm">fun2() 호출 (fun3()을 통해 호출)</button>		<%-- 리턴값 받기위해 fun3에서 fun2 호출 --%>
			
			<a onclick="return fun4(null)" href="main.do" class="btn btn-success btn-sm">메인 화면</a>		<%-- 클릭을 하면 onclick을 실행하고 return값에 따라 a태그를 실행하거나 안하거나 결정(false가 리턴되면 실행 안함) --%>
			
			<form name="loginForm" method="post" action="main.do" onsubmit="return fun5()" style="margin-top: 10px">	<%-- onsubmit="fun5()" : submit 버튼을 눌렀을 때 fun5()를 실행하고 return값에 따라 form태그의 action을 실행하거나 안하거나 결정 --%>
				<input type="text" name="mid" value=""/>	<%-- value는 안 넣어도됨 --%>
				<%-- submit 효과 --%>
				<input type="submit" value="전송" class="btn btn-success btn-sm"/>
				<button class="btn btn-success btn-sm">전송</button>
				<input type="image" src="${pageContext.request.contextPath}/resource/img/red_button.PNG"/>
			</form>
			
			<button onclick="fun6()" class="btn btn-success btn-sm">fun6() 호출</button>
		</div>
	</body>
</html>