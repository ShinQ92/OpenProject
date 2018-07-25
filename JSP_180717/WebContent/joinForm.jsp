<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="joinForm.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>네이버 : 회원가입</title>
<style>
</style>
</head>
<body>
	<div id="naver">
		<div id="header">
			<img src="https://t1.daumcdn.net/cfile/tistory/99D796365B4D5D501B">
		</div>
		<div id="container">
			<form action="join_process.jsp">
				<label for="id">아이디</label>
				<div id="idBox" class="box">
					<input type="text" id="id" class="input" name="id"> <span>@naver.com</span>
				</div>
				<p id="redCheck_id" class="redCheck"></p>

				<label for="pwd">비밀번호</label>
				<div id="pwdBox" class="box">
					<input type="password" id="pwd" class="input" name="pwd"> <img
						src="https://t1.daumcdn.net/cfile/tistory/99B61D465B4D616D25">
				</div>
				<p id="redCheck_pwd" class="redCheck"></p>

				<label for="pwdCheck">비밀번호 재확인</label>
				<div id="pwdCheckBox" class="box">
					<input type="password" id="pwdCheck" class="input"> <img
						src="https://t1.daumcdn.net/cfile/tistory/994F53465B4D616D1D">
				</div>
				<p id="redCheck_pwdCheck" class="redCheck"></p>

				<label for="name">이름</label>
				<div id="nameBox" class="box">
					<input type="text" id="name" class="input" name="name">
				</div>
				<p id="redCheck_name" class="redCheck"></p>

				<label>생년월일</label>
				<div id="birth" >
					<input type="text" placeholder="년(4자)" > <select>
						<option>월</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>

					</select> <input type="text" placeholder="일" >
				</div>
				<p id="redCheck_birth" class="redCheck"></p>

				<label>성별</label>
				<div id="sex">
					<input type="radio" id="male" name="gender" value="남자" name="male">
					<label for="male">남자</label> <input type="radio" id="female"
						name="gender" value="여자" name="female"> <label
						for="female">여자</label>
				</div>

				<label for="email">본인 확인 이메일</label>
				<div id="email" class="box">
					<input type="text" placeholder="선택입력" class="input" name="email">
				</div>
				<p id="redCheck_email" class="redCheck"></p>

				<label for="phone">휴대전화</label> <select id="phoneSel">
					<option>대한민국 +82</option>
					<option>네덜란드 +64</option>
					<option>노르웨이 +47</option>
					<option>니제르 +227</option>
				</select> <input type="button" id="phoneBtn" value="인증번호 받기">
				<div id="phoneBox" class="box">
					<input type="text" id="phone" class="input" placeholder="전화번호 입력" >
				</div>


				<div id="serialBox" class="box">
					<input type="text" id="serialPhone" class="input"
						placeholder="인증번호 입력하세요">
				</div>
				<p id="redCheck_phone" class="redCheck"></p>

				<input type="submit" id="send" value="가입하기">
			</form>
		</div>
		<div id="footer">
			<ul>
				<li><a href="#">이용약관 </a></li>
				<li><a href="#">개인정보처리방침 </a></li>
				<li><a href="#">책임의 한계와 법적고지 </a></li>
				<li><a href="#">회원정보 고객센터</a></li>
			</ul>

			<img src="https://t1.daumcdn.net/cfile/tistory/991122365B4D5D5030">
			<label>Copyright <b>Naver Crop.</b> All Rights Reserved.
			</label>

		</div>
	</div>
</body>

</html>


<script>
	$(document)
			.ready(
					function() {
						var idReg = /^[A-za-z0-9]{5,20}$/g;
						var pwdReg = /^.*(?=^.{6,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
						var nameReg = /^[가-힣a-zA-Z]+$/;
						var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

						/*ID*/
						/*포커스인일 때, 초록색 테두리*/
						$('#id').focusin(function() {
							$('#idBox').css('border', '1px solid #08a600');
						});

						/*포커스 아웃. 유효성 검사*/
						$('#id')
								.focusout(
										function() {
											$('#idBox')
													.css('border',
															'1px solid rgb(218, 218, 218)');

											if ($(this).val() == null
													|| $(this).val().trim(" ").length == 0) {
												$('#redCheck_id').html(
														"필수 정보입니다.").css(
														'color', 'red');
												;
												//                $(this).focus();

											} else {
												if (!idReg.test($(this).val())) {
													$('#redCheck_id')
															.html(
																	"5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.")
															.css('color', 'red');
												} else {
													$('#redCheck_id').html(
															"멋진 아이디네요!").css(
															'color', '#08a600');

												}
											}
										});

						/*pwd*/
						/*포커스인일 때, 초록색 테두리*/
						$('#pwd').focusin(function() {
							$('#pwdBox').css('border', '1px solid #08a600');
						});

						/*포커스 아웃. 유효성 검사*/
						$('#pwd')
								.focusout(
										function() {
											$('#pwdBox')
													.css('border',
															'1px solid rgb(218, 218, 218)');

											if ($(this).val() == null
													|| $(this).val().trim(" ").length == 0) {
												$('#redCheck_pwd').html(
														"필수 정보입니다.").css(
														'color', 'red');
												;

											} else {
												if (!pwdReg.test($(this).val())) {
													$('#redCheck_pwd')
															.html(
																	"6~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.")
															.css('color', 'red');
												} else {
													$('#redCheck_pwd')
															.html(" ");
												}
											}
										});

						/*pwdCheck*/
						/*포커스인일 때, 초록색 테두리*/
						$('#pwdCheck').focusin(
								function() {
									$('#pwdCheckBox').css('border',
											'1px solid #08a600');
								});

						/*포커스 아웃. 유효성 검사*/
						$('#pwdCheck')
								.focusout(
										function() {
											$('#pwdCheckBox')
													.css('border',
															'1px solid rgb(218, 218, 218)');

											if ($(this).val() == null
													|| $(this).val().trim(" ").length == 0) {
												$('#redCheck_pwdCheck').html(
														"필수 정보입니다.").css(
														'color', 'red');

											} else {
												if ($(this).val() != $('#pwd')
														.val()) {
													$('#redCheck_pwdCheck')
															.html(
																	"비밀번호가 일치하지 않습니다.")
															.css('color', 'red');
												} else {
													$('#redCheck_pwdCheck')
															.html(" ");
												}
											}
										});

						/*name*/
						$('#name').focusin(function() {
							$('#nameBox').css('border', '1px solid #08a600');
						});

						/*포커스 아웃. 유효성 검사*/
						$('#name')
								.focusout(
										function() {
											$('#nameBox')
													.css('border',
															'1px solid rgb(218, 218, 218)');

											if ($(this).val() == null
													|| $(this).val().trim(" ").length == 0) {
												$('#redCheck_name').html(
														"필수 정보입니다.").css(
														'color', 'red');

											} else {
												if (!nameReg
														.test($(this).val())) {
													$('#redCheck_name')
															.html(
																	"한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)")
															.css('color', 'red');
												} else {
													$('#redCheck_name').html(
															" ");
												}
											}
										});

						/*생년월일_년*/
						$('#birth input:nth-child(1)').focusin(function() {
							$(this).css('border', '1px solid #08a600');
						});

						/*포커스 아웃. 유효성 검사*/
						$('#birth input:nth-child(1)')
								.focusout(
										function() {
											$(this)
													.css('border',
															'1px solid rgb(218, 218, 218)');

											if ($(this).val() == null
													|| $(this).val().trim(" ").length == 0) {
												$('#redCheck_birth').html(
														"필수 정보입니다.").css(
														'color', 'red');

											} else {
												if ($(this).val().length != 4) {
													$('#redCheck_birth')
															.html(
																	"태어난 년도 4자리를 정확하게 입력하세요.")
															.css('color', 'red');
												} else {
													$('#redCheck_birth').html(
															" ");
												}
											}
										});

						/*생년월일_월*/
						$('#birth select').focusin(function() {
							$(this).css('border', '1px solid #08a600');
						});

						/*포커스 아웃. 유효성 검사*/
						$('#birth select').focusout(
								function() {
									if ($(this).val() == "월") {
										$('#redCheck_birth').html(
												"생년월일을 다시 확인해주세요.").css(
												'color', 'red');
									} else {
										$('#redCheck_birth').html(" ");
									}
								});

						/*생년월일_일*/
						$('#birth input:last-child').focusin(function() {
							$(this).css('border', '1px solid #08a600');
						});

						/*포커스 아웃. 유효성 검사*/
						$('#birth input:last-child')
								.focusout(
										function() {
											$(this)
													.css('border',
															'1px solid rgb(218, 218, 218)');

											if ($(this).val() == null
													|| $(this).val().trim(" ").length == 0) {
												$('#redCheck_birth').html(
														"필수 정보입니다.").css(
														'color', 'red');

											} else {
												if ($(this).val().length > 2) {
													$('#redCheck_birth')
															.html(
																	"태어난 일(날짜) 2자리를 정확하게 입력하세요.")
															.css('color', 'red');
												} else {
													$('#redCheck_birth').html(
															" ");
												}
											}
										});

						/*이메일*/
						$('#email input').focusin(function() {
							$('#email').css('border', '1px solid #08a600');
						});

						/*포커스 아웃. 유효성 검사*/
						$('#email input')
								.focusout(
										function() {
											$('#email')
													.css('border',
															'1px solid rgb(218, 218, 218)');

											if ($(this).val() == null
													|| $(this).val().trim(" ").length == 0) {
												$('#redCheck_email').html(
														"필수 정보입니다.").css(
														'color', 'red');

											} else {
												if (!emailReg.test($(this)
														.val())) {
													$('#redCheck_email')
															.html(
																	"이메일 주소를 다시 확인해주세요.")
															.css('color', 'red');
												} else {
													$('#redCheck_email').html(
															" ");
												}
											}
										});

						/*전화번호*/
						$('#phone').focusin(function() {
							$('#phoneBox').css('border', '1px solid #08a600');
						});

						$('#phone').focusout(
								function() {
									$('#phoneBox').css('border',
											'1px solid rgb(218, 218, 218)');
								});

						/*포커스 아웃. 유효성 검사*/
						$('#phoneBtn')
								.click(
										function() {

											if ($('#phone').val() == null
													|| $('#phone').val().trim(
															" ").length == 0) {
												$('#redCheck_phone').html(
														"필수 정보입니다.").css(
														'color', 'red');
											} else {
												if (!($('#phone').val().length == 10 || $(
														'#phone').val().length == 11)) {
													$('#redCheck_phone')
															.html(
																	"형식에 맞지 않는 번호 입니다.")
															.css('color', 'red');
												} else {
													$('#redCheck_phone').html(
															" ");
													$('#serialPhone').css(
															'background',
															'#fff');
													$('#serialBox').css(
															'background',
															'#fff');
												}
											}
										});

					});
</script>