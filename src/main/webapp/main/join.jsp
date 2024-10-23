<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 페이지</title>

<link rel="stylesheet" href="${conPath }/resources/css/default.css"/>
<link rel="stylesheet" href="${conPath }/resources/css/global.css"/>
<link rel="stylesheet" href="${conPath }/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="${conPath }/resources/css/style_board.css">
<link rel="stylesheet" href="${conPath }/resources/css/style.css">

<script src="${conPath }/resources/js/jquery-1.12.4.min.js"></script>
<script src="${conPath }/resources/js/jquery-migrate-1.4.1.min.js"></script>
<script src="${conPath }/resources/js/jquery.menu.js"></script>
<script src="${conPath }/resources/js/common.js"></script>
<script src="${conPath }/resources/js/wrest.js"></script>
<script src="${conPath }/resources/js/placeholders.min.js"></script>
<script src="${conPath }/resources/js/global.js"></script>

</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	
	    <!-- 서브 콘텐츠 시작 { -->
    <div id="wrap_content" class="wrap_sub">
        <div class="sub_contents">
    
            <!-- 내용 시작 { -->
            <div class="page">

                <!-- 회원정보 입력/수정 시작 { -->

                <div class="register">
                    <form id="fregisterform" name="fregisterform"
                        action="${conPath}/main/join"
                        onsubmit="return fregisterform_submit(this);" method="post" enctype="multipart/form-data"
                        autocomplete="off">
                        <input type="hidden" name="w" value="">
                        <input type="hidden" name="url" value="%2Fbbs%2Fregister_form.php">
                        <input type="hidden" name="agree" value="1">
                        <input type="hidden" name="agree2" value="1">
                        <input type="hidden" name="cert_type" value="">
                        <input type="hidden" name="cert_no" value="">
                        <input type="hidden" name="mb_sex" value=""> <input type="hidden" name="mb_open" value="0">
                        <input type="hidden" name="mode" value="1">

                        <div id="register_form" class="form_01">
                            <div class="register_form_inner">
                                <ul>
                                    <li>
                                        <label for="reg_mb_id">
                                            아이디 (필수)
                                            
                                        </label>
                                        <input type="text" name="mb_id" value="" id="reg_mb_id" required=""
                                            class="frm_input full_input required " minlength="3" maxlength="20"
                                            placeholder="아이디">
                                        <span id="msg_mb_id"></span>
                                    </li>
                                    <li class="half_input left_input margin_input">
                                        <label for="reg_mb_password">비밀번호 (필수)</label>
                                        <input type="password" name="mb_password" id="reg_mb_password" required=""
                                            class="frm_input full_input required" minlength="3" maxlength="20"
                                            placeholder="비밀번호">
                                    </li>
                                    <li class="half_input left_input">
                                        <label for="reg_mb_password_re">비밀번호 확인 (필수)</label>
                                        <input type="password" name="mb_password_re" id="reg_mb_password_re" required=""
                                            class="frm_input full_input required" minlength="3" maxlength="20"
                                            placeholder="비밀번호 확인">
                                    </li>
                                </ul>
                            </div>

                            <div class="tbl_frm01 tbl_wrap register_form_inner">
                                <h2>개인정보 입력</h2>
                                <ul>

                                    <li>
                                        <label for="reg_mb_name">이름 (필수)</label>
                                        <input type="text" id="reg_mb_name" name="mb_name" value="" required=""
                                             class="frm_input full_input required" size="10"
                                            placeholder="이름">
                                    </li>

                                    <li>
                                        <label for="reg_mb_email">E-mail
                                        </label>
                                        <input type="hidden" name="old_email" value="">
                                        <input type="text" name="mb_email" value="" id="reg_mb_email"
                                            class="frm_input email full_input" size="70" maxlength="100"
                                            placeholder="E-mail">
                                    </li>


                                    <li>
                                    </li>
                                    <li>
                                        <label for="reg_mb_hp">휴대폰번호 (필수)<span class="cert_desc"> 본인확인 시
                                                자동입력</span></label>
                                        <input type="text" name="mb_hp" value="" id="reg_mb_hp" required="" 
                                            class="frm_input full_input required" maxlength="20"
                                            placeholder="휴대폰번호">
                                        <input type="hidden" name="old_mb_hp" value="">
                                    </li>

                                    <li>
                                        <label>주소 (필수)</label>
                                        <label for="reg_mb_zip" class="sound_only">우편번호 (필수)</label>
                                        <input type="text" name="mb_zip" value="" id="sample4_postcode" required="" readonly=""
                                            class="frm_input twopart_input required readonly" size="5" maxlength="6"
                                            placeholder="우편번호">
                                        <button type="button" class="btn_frmline" onclick="sample4_execDaumPostcode()">
                                            
                                            검색</button><br>
                                        <input type="text" name="mb_addr1" value="" id="sample4_roadAddress" required=""
                                            class="frm_input frm_address full_input required" size="50"
                                            placeholder="기본주소">
                                        <input type="text" name="mb_addr2" value="" id="sample4_detailAddress"
                                            class="frm_input frm_address full_input" size="50" placeholder="상세주소">


										<br>
										<br>

										<h2>기타 특이사항</h2>
                                        <input type="text" name="note" value="" id="reg_mb_addr3"
                                            class="frm_input frm_address full_input" size="50" readonly="readonly"
                                            placeholder="병역 사항 등">
                                        
                                    </li>
                                </ul>
                            </div>

                            <div class="tbl_frm01 tbl_wrap register_form_inner">
                                
                                
                            </div>
                        </div>
                        <div class="btn_confirm">
                            <a href="https://sdsports.or.kr/" class="btn_close">취소</a>
                            <button type="submit" id="btn_submit" class="btn_submit" accesskey="s">회원가입</button>
                        </div>

                    </form>
                </div>
                <script>
                    $(function () {
                        $("#reg_zip_find").css("display", "inline-block");
                        var pageTypeParam = "pageType=register";



                    });
                    




                        if (f.mb_password.value != f.mb_password_re.value) {
                            alert("비밀번호가 같지 않습니다.");
                            f.mb_password_re.focus();
                            return false;
                        }

                        if (f.mb_password.value.length > 0) {
                            if (f.mb_password_re.value.length < 3) {
                                alert("비밀번호를 3글자 이상 입력하십시오.");
                                f.mb_password_re.focus();
                                return false;
                            }
                        }

                        // 이름 검사
                        if (f.w.value == "") {
                            if (f.mb_name.value.length < 1) {
                                alert("이름을 입력하십시오.");
                                f.mb_name.focus();
                                return false;
                            }


                        }



                        // 닉네임 검사
                        if ((f.w.value == "") || (f.w.value == "u" && f.mb_nick.defaultValue != f.mb_nick.value)) {
                            var msg = reg_mb_nick_check();
                            if (msg) {
                                alert(msg);
                                f.reg_mb_nick.select();
                                return false;
                            }
                        }

                        // E-mail 검사
                        if ((f.w.value == "" && f.mb_email.value) || (f.w.value == "u" && f.mb_email.defaultValue != f.mb_email.value)) {
                            var msg = reg_mb_email_check();
                            if (msg) {
                                alert(msg);
                                f.reg_mb_email.select();
                                return false;
                            }
                        }

                        // 휴대폰번호 체크
                        var msg = reg_mb_hp_check();
                        if (msg) {
                            alert(msg);
                            f.reg_mb_hp.select();
                            return false;
                        }







                        }


                    }


                </script>

                <!-- } 회원정보 입력/수정 끝 -->
                


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                <!-- } 주소 탐색 -->
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

            </div>
            <!-- } 내용 끝 -->
        </div>
        <!-- } 서브 콘텐츠 끝 -->
    </div>



    <div id="blackback"></div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>