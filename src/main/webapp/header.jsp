<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 	<link rel="stylesheet" href="${conPath }/resources/css/default.css">
 	<link rel="stylesheet" href="${conPath }/resources/css/global.css">
    <link rel="stylesheet" href="${conPath }/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="${conPath }/resources/css/swiper.min.css">
    
    <script src="${conPath }/resources/js/jquery-1.12.4.min.js"></script>
    <script src="${conPath }/resources/js/jquery-migrate-1.4.1.min.js"></script>
    <script src="${conPath }/resources/js/jquery.menu.js"></script>
    <script src="${conPath }/resources/js/common.js"></script>
    <script src="${conPath }/resources/js/wrest.js"></script>
    <script src="${conPath }/resources/js/placeholders.min.js"></script>
    <script src="${conPath }/resources/js/global.js"></script>
    <script src="${conPath }/resources/js/swiper.min.js"></script>
</head>

<body>

	<header id="header">
        <div class="header_top">
            <div class="in_1200">
                <ul class="list_init fl">
                    <li class="ht_home"><a href="${conPath }/index.html"><span>Ȩ����</span></a></li>
                </ul>
                <ul class="list_init fr">
                    <li class="ht_login"><a href="${conPath }/main/loginForm"><span>�α���</span></a>
                    </li>
                    <li class="ht_join"><a href="${conPath }/main/joinForm"><span>ȸ������</span></a></li>
                </ul>
                <div class="logo"><a href="${conPath }/index.html"><img src="${conPath }/resources/img/logo.png" alt="Space Gym"
                            class="img_fix" title=""></a></div>
                <div class="toggle_menu"><span class="tg01"></span><span class="tg02"></span><span class="tg03"></span>
                </div>
            </div>
        </div>
        <div class="container_menu">
            <!-- �޴� ���� { -->
            <nav id="hd_menu" class="in_1200 mob_menu">
                <ul class="main_menu">
                    <li class="menu1"><a href="https://www.sdsports.or.kr/bbs/content.php?co_id=01_01"
                            target="_self"><span>���ͼҰ�</span></a>
                        <div class="sub_menu">
                            <ul>
                                <li class="menu_0101"><a href="https://www.sdsports.or.kr/bbs/content.php?co_id=01_01"
                                        target="_self">�λ縻</a></li>
                                <li class="menu_0103"><a href="https://www.sdsports.or.kr/bbs/content.php?co_id=01_03"
                                        target="_self">�ü���Ȳ</a></li>
                                <li class="menu_0104"><a href="https://www.sdsports.or.kr/bbs/content.php?co_id=01_04"
                                        target="_self">������</a></li>
                                <li class="menu_0105"><a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=01_05"
                                        target="_self">������ �Ұ�</a></li>
                                <li class="menu_0106"><a href="https://www.sdsports.or.kr/bbs/content.php?co_id=01_06"
                                        target="_self">���ô� ��</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="menu2"><a href="https://www.sdsports.or.kr/bbs/content.php?co_id=02_01"
                            target="_self"><span>���α׷��ȳ� �� ����</span></a>
                        <div class="sub_menu">
                            <ul>
                                <li class="menu_0201"><a href="https://www.sdsports.or.kr/bbs/content.php?co_id=02_01"
                                        target="_self">�̿��� �ؼ�����</a></li>
                                <li class="menu_0202"><a href="https://www.sdsports.or.kr/sub/progapp.php?pn=0202"
                                        target="_self">����</a></li>
                                <li class="menu_0203"><a href="https://www.sdsports.or.kr/sub/progapp.php?pn=0203"
                                        target="_self">�ｺ</a></li>
                                <li class="menu_0204"><a href="https://www.sdsports.or.kr/sub/progapp.php?pn=0204"
                                        target="_self">��Ȱü��</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="menu3"><a href="https://www.sdsports.or.kr/bbs/content.php?co_id=03_01"
                            target="_self"><span>�̿�ȳ�</span></a>
                        <div class="sub_menu">
                            <ul>
                                <li class="menu_0301"><a href="https://www.sdsports.or.kr/bbs/content.php?co_id=03_01"
                                        target="_self">�̿��Ģ</a></li>
                                <li class="menu_0302"><a href="https://www.sdsports.or.kr/bbs/content.php?co_id=03_02"
                                        target="_self">�湮���� �ȳ�</a></li>
                                <li class="menu_0303"><a href="https://www.sdsports.or.kr/bbs/content.php?co_id=03_03"
                                        target="_self">�¶������� �ȳ�</a></li>
                                <li class="menu_0304"><a href="https://www.sdsports.or.kr/bbs/content.php?co_id=03_04"
                                        target="_self">�������� �ȳ�</a></li>
                                <li class="menu_0305"><a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=03_05"
                                        target="_self">��Ʋ�����뼱 �ȳ�</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="menu4"><a href="https://www.sdsports.or.kr/bbs/board.php?bo_table=04_01"
                            target="_self"><span>�˸�����</span></a>
                        <div class="sub_menu">
                            <ul>
                                <li class="menu_0401"><a href="${conPath }/board/notice" target="_self">��������</a></li>
                                <li class="menu_0402"><a href="${conPath }/board/freeboard" target="_self">�����Խ���</a></li>
                                <li class="menu_0403"><a href="${conPath }/board/qna" target="_self">������ϱ�</a></li>
                                <li class="menu_0404"><a href="${conPath }/main/schedule" target="_self">�̴��� ����</a></li>
                                <li class="menu_0407"><a href="${conPath }/board/recruit" target="_self">ä�����</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="menu5"><a href="https://www.sdsports.or.kr/sub/progappinq.php?pn=0501"
                            target="_self"><span>����������</span></a>
                        <div class="sub_menu">
                            <ul>
                                <li class="menu_0501"><a href="https://www.sdsports.or.kr/sub/progappinq.php?pn=0501"
                                        target="_self">������Ȳ</a></li>
                                <li class="menu_0502"><a href="https://www.sdsports.or.kr/sub/cart.php?pn=0502"
                                        target="_self">��ٱ���</a></li>
                                <li class="menu_0503"><a href="https://www.sdsports.or.kr/sub/mbinfo.php?pn=0503"
                                        target="_self">ȸ������</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </nav>
            <!-- } �޴� �� -->
        </div>
        <div class="hd_menu_bg" style="display: none;">
            <div style=""></div>
        </div>
    </header>
    <!-- } ��� �� -->
</body>
</html>