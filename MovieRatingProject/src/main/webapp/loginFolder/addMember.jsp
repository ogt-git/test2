<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
<script type="text/javascript">
	function checkForm() {
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		
		if (document.getElementById("idCheck").value != "true") {
			alert("아이디 중복 확인을 해주세요.");
			return false;
		}

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		
		
		if (document.getElementById("emailVerified").value != "true") {
			alert("이메일 인증을 완료해주세요.");
			return false;
		} 
	}
</script>
<title>회원 가입</title>
</head>
<body>

<fmt:setLocale value='<%=request.getParameter("language") %>' /> 
<fmt:bundle basename="bundle.message">

<%@ include file="../movieFolder/menuPage.jsp"%>
<div class="container py-4">

 <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold"><fmt:message key = "new_member" /></h1> 
      </div>
    </div>
	
	<div class="text-end mb-3">
    <form method="get" id="languageForm">
        <select name="language" class="form-select w-auto d-inline" onchange="document.getElementById('languageForm').submit();">
            <option value="ko" ${param.language == 'ko' ? 'selected' : ''}>한국어</option>
            <option value="en" ${param.language == 'en' ? 'selected' : ''}>English</option>
        </select>
    </form>
</div>
	
   <div class="row align-items-md-stretch   text-center">
		<form name="newMember"  action="processAddMember.jsp" method="post" onsubmit="return checkForm()">
			<div class="mb-3 row">
				<label class="col-sm-2 "><fmt:message key = "id" /></label>
				<div class="col-sm-3 position-relative">
					<input name="id" type="text" class="form-control" placeholder="<fmt:message key = "id" />" id="id">
					<button type="button" onclick="checkDuplicate()"><fmt:message key = "duplicate_check" /></button>
					<div id="result"></div>
					<input type="hidden" id="idCheck" name="idCheck" value="false">
					<script>
						function checkDuplicate() {
							const userId = document.getElementById("id").value;

							fetch("checkId.jsp?userId=" + encodeURIComponent(userId))
							.then(response => response.text())
							.then(data => {
								document.getElementById("result").innerText = data;
								if (data.trim() == "사용 가능한 아이디입니다") {
									document.getElementById("idCheck").value = "true";
								}
								else {
									document.getElementById("idCheck").value = "false";
								}
							});
						}
					</script>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "password" /></label>
				<div class="col-sm-3 position-relative">
					<input name="password" type="password" class="form-control" placeholder="<fmt:message key = "password" />" id = "pwInput">
					<i class="fa-solid fa-eye position-absolute" id="togglePw" style="top: 50%; right: 15px; transform: translateY(-50%); cursor: pointer;"></i>
				</div>
				
				<script>
					const toggle = document.getElementById("togglePw");
					const password = document.getElementById("pwInput");
					
					toggle.addEventListener("click", () => {
						const type = password.type === "password" ? "text" : "password";
						password.type = type;
						
						toggle.classList.toggle("fa-eye");
						toggle.classList.toggle("fa-eye-slash");
					});
				</script>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "confirm_pwd" /></label>
				<div class="col-sm-3 position-relative">
					<input name="password_confirm" type="password" class="form-control" placeholder="<fmt:message key = "confirm_pwd" />" id = "pwcfInput">
					<i class="fa-solid fa-eye position-absolute" id="togglePwcf" style="top: 50%; right: 15px; transform: translateY(-50%); cursor: pointer;"></i>
				</div>
				
				<script>
					const toggle2 = document.getElementById("togglePwcf");
					const password2 = document.getElementById("pwcfInput");
					
					toggle2.addEventListener("click", () => {
						const type = password2.type === "password" ? "text" : "password";
						password2.type = type;
						
						toggle2.classList.toggle("fa-eye");
						toggle2.classList.toggle("fa-eye-slash");
					});
				</script>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "name" /></label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" placeholder="<fmt:message key = "name" />" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "gender" /></label>
				<div class="col-sm-2">
					<input name="gender" type="radio" value="남" /> <fmt:message key = "male" /> 
					<input name="gender" type="radio" value="여" /> <fmt:message key = "female" />
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "birthday" /></label>
				<div class="col-sm-10  ">
				  <div class="row">
				  	<div class="col-sm-2">
					<select name="birthyy" class="form-select">
						<option value=""><fmt:message key = "birth_yaer" /></option>
						<%
							for (int i = 1960; i <= 2025; i++) {
						%>
								<option value="<%=i%>"><%=i %></option>
						<%
							}
						%>
					</select> 
					</div>
					<div class="col-sm-2">
					<select name="birthmm" class="form-select">
						<option value=""><fmt:message key = "month" /></option>
						<%
							for (int i = 1; i <= 12; i++) {
								String month = (i < 10 ? "0" : "") + i;
						%>
								<option value="<%=month%>"><%=i %></option>
						<%
							}
						%>
					</select> 
					</div>
					<div class="col-sm-2">
					<select name="birthdd" class="form-select">
						<option value=""><fmt:message key = "day" /></option>
						<%
							for (int i = 1; i <= 30; i++) {
								String day = (i < 10 ? "0" : "") + i;
						%>
								<option value="<%=day%>"><%=i %></option>
						<%
							}
						%>
					</select>
					</div>
				</div>
				</div>
			</div>
			
		<div class="mb-3 row">
			<label class="col-sm-2"><fmt:message key = "email" /></label>
				<div class="col-sm-10">
				  <div class="row">
					<div class="col-sm-4">
						<input type="text" name="mail1" maxlength="50" class="form-control"  placeholder="<fmt:message key = "email" />" id="mail1">
					</div> @
					<div class="col-sm-3">
						 <select name="mail2" class="form-select" id="mail2">
							<option>naver.com</option>
							<option>gmail.com</option>
						</select>
					</div>
					<div class="col-sm-4">
						<button type="button" class="btn btn-outline-primary" onclick="sendEmail()"><fmt:message key = "email_verification" /></button>
					</div>
					<div class="mt-2">
						<input type="text" id="verifyCode" placeholder="<fmt:message key = "verification_code" />" class="form-control" style="width:50%">
						<button type="button" class="btn btn-outline-success mt-2" onclick="checkVerifyCode()"><fmt:message key = "check_verification" /></button>
						<div id="verifyResult" class="mt-2"></div>
						<input type="hidden" id="emailVerified" name="emailVerified" value="false">
						<script>
						function sendEmail() {
							const mail1 = document.getElementById("mail1").value;
							const mail2 = document.getElementById("mail2").value;
							const email = mail1 + "@" + mail2;
							
							if (mail2 == "gmail.com") {
								fetch("sendEmail.jsp", {
									method: "POST",
									headers: {
										"Content-Type": "application/x-www-form-urlencoded"
									},
										body: "email=" + encodeURIComponent(email)
									})
									.then(response => response.text())
									.then(data => {
									alert("인증번호가 발송되었습니다!");
									console.log(data);
								});
							}
							else if (mail2 == "naver.com") {
								fetch("sendEmail2.jsp", {
									method: "POST",
									headers: {
										"Content-Type": "application/x-www-form-urlencoded"
									},
										body: "email=" + encodeURIComponent(email)
									})
									.then(response => response.text())
									.then(data => {
									alert("인증번호가 발송되었습니다!");
									console.log(data);
								});
							}
						}
						
						
						function checkVerifyCode() {
							const code = document.getElementById("verifyCode").value;
							fetch("verifyCode.jsp?code=" + encodeURIComponent(code))
							.then(response => response.text())
							.then(result => {
								document.getElementById("verifyResult").innerText = result;
								if (result.includes("완료")) {
									document.getElementById("emailVerified").value = "true";
								}
								else {
									document.getElementById("emailVerified").value = "false";
								}
							})
						}
					</script>
					</div>
				</div>		
			</div>		
		</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "phone_number" /></label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control" placeholder="<fmt:message key = "phone_number" />" >

				</div>
			</div>
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="<fmt:message key = "registration" /> " > 
					<input type="reset" class="btn btn-primary " value="<fmt:message key = "reset" /> " onclick="reset()" >
				</div>
			</div>
		</form>
	</div>
  </div>	
  </fmt:bundle>
</body>
</html>


