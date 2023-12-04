<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<%@ page import="com.db.DBManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<div class = "admin-container">
	<h1>관리자 페이지</h1>
	<%
		String id = (String) session.getAttribute("login_id");
		out.println("<h2>로그인 ID : "+id+"</h2>");
	%>	
	</br>
	<form action = "admin_func.jsp" method = "POST">
        <label for="category">옵션:</label>
        <select id = "category" name = "Opt" onchange = "sub()">
        	<option>---옵션 선택---</option>
        	<option value = "concert">공연 정보 확인</option>
        	<option value = "blacklist">블랙리스트 확인</option>
        	<option value = "customer">고객 정보 확인</option>
        </select>
        </br>
        </br>
        <label for="subcategory">세부 옵션1 : </label>
        <select id = "subcategory" name = "sub_option" onchange = "opt()">
        	<option>---세부 옵션 선택---</option>
        </select>
        </br>
        </br>
        <div id="dynamicInputContainer"></div>
        <input href = "admin_func.jsp" type = "submit">
    </form>

    <script>
        function sub() {
        	var categorySelect = document.getElementById("category");
        	var subcategorySelect = document.getElementById("subcategory");
        	subcategorySelect.innerHTML = "";
        	

			switch(categorySelect.value){
			case "concert" :
				addOption(subcategorySelect, 'All', '전체 공연 매출 확인');
				addOption(subcategorySelect, 'Top', 'top-k 공연 매출 확인');
				addOption(subcategorySelect, 'Seat', '좌석 판매 수 확인');
				addOption(subcategorySelect, 'con_Id', '공연 ID로 확인');
				addOption(subcategorySelect, 'avg_con', '공연별 평균 판매 가격');
				break;
				
			case "blacklist" :
				addOption(subcategorySelect, 'temp', '--세부옵션 선택--');
				addOption(subcategorySelect, 'user_Id', 'ID 검색');
				addOption(subcategorySelect, 'Reason', '사유 검색');
				addOption(subcategorySelect, 'Date', '시작 날짜 검색');
				break;
				
			case "customer" :
				addOption(subcategorySelect, 'temp', '--세부옵션 선택--');
				addOption(subcategorySelect, 'Name', '사용자 이름 검색');
				addOption(subcategorySelect, 'His', '구매 내역 검색');
				addOption(subcategorySelect,'Aggr', '사용자 구매 내역 집계');
			}
        }
        
        function opt(){
        	var subcategorySelect = document.getElementById("subcategory");
        	var dynamicInputContainer = document.getElementById("dynamicInputContainer");
        	
        	dynamicInputContainer.innerHTML = "";
        	
        	 switch (subcategorySelect.value) {
             case "Top":
                 createInputField("k를 입력하세요 : ");
                 break;
             case "con_Id":
                 createInputField("공연 ID를 입력하세요 : ");
                 break;
             case "user_Id":
                 createInputField("사용자 ID를 입력하세요 : ");
                 break;
             case "Reason":
                 createInputField("사유를 입력하세요 (ex)지속적인 취소,티켓 재판매) : ");
                 break;
             case "Date":
                 createInputField("날짜를 입력하세요(ex)2020-01-01) : ");
                 break;
             case "Name" :
            	 createInputField("사용자 이름을 입력하세요 : ");
            	 break;
             case "His" :
            	 createInputField("사용자 ID를 입력하세요 : ");
            	 break;
             default:
                 break;
         	}
        }
        
        function addOption(selectElement, value, text) {
            var option = document.createElement("option");	
            option.value = value;
            option.text = text;
            selectElement.add(option);
        }
        
        function createInputField(labelText) {
            var label = document.createElement("label");
            label.textContent = labelText;

            var input = document.createElement("input");
            input.type = "text";
            input.name = "Input"; // 여기에 원하는 name 속성 추가

            var dynamicInputContainer = document.getElementById("dynamicInputContainer");
            dynamicInputContainer.appendChild(label);
            dynamicInputContainer.appendChild(input);
        }
    </script>
	
	</br>
	</br>
	
	<div class = "back-to-login">
		<a href = "login.jsp">로그인 페이지로 돌아가기</a>
	</div>
	</div>
</body>
</html>