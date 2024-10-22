-- 회원 더미데이터 생성

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user1', 'pass1', '홍길동', SYSDATE, '12345', '서울시 강남구', '역삼동 123-45', 'user1@example.com', '메모 없음', '010-1234-5678');

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user2', 'pass2', '김영희', SYSDATE, '54321', '서울시 서초구', '서초동 543-21', 'user2@example.com', '메모 없음', '010-2345-6789');

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user3', 'pass3', '박철수', SYSDATE, '67890', '서울시 마포구', '공덕동 678-90', 'user3@example.com', '메모 없음', '010-3456-7890');

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user4', 'pass4', '이순신', SYSDATE, '98765', '서울시 종로구', '종로 987-65', 'user4@example.com', '메모 없음', '010-4567-8901');

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user5', 'pass5', '정약용', SYSDATE, '34567', '서울시 강서구', '화곡동 345-67', 'user5@example.com', '메모 없음', '010-5678-9012');

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user6', 'pass6', '신사임당', SYSDATE, '76543', '서울시 성북구', '성북동 765-43', 'user6@example.com', '메모 없음', '010-6789-0123');

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user7', 'pass7', '유관순', SYSDATE, '11223', '서울시 중구', '충무로 112-23', 'user7@example.com', '메모 없음', '010-7890-1234');

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user8', 'pass8', '세종대왕', SYSDATE, '33445', '서울시 동대문구', '청량리 334-45', 'user8@example.com', '메모 없음', '010-8901-2345');

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user9', 'pass9', '장영실', SYSDATE, '55667', '서울시 서대문구', '홍제동 556-67', 'user9@example.com', '메모 없음', '010-9012-3456');

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user10', 'pass10', '안중근', SYSDATE, '77889', '서울시 용산구', '이태원 778-89', 'user10@example.com', '메모 없음', '010-0123-4567');

-- 관리자용 데이터 생성

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('admin', 'pass1', '관리자', SYSDATE, '11111', '서울시 중구', '을지로 111-11', 'admin1@example.com', '관리자 메모 없음', '010-5678-1234');

INSERT INTO MEMBER (MEMBER_LEVEL, LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('admin2', 'pass2', '스페이스씨엘', SYSDATE, '22222', '서울시 용산구', '이태원 222-22', 'admin2@example.com', '관리자 메모 없음', '010-6789-2345');

COMMIT;


-- 자유게시판 더미데이터 생성
INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('첫 번째 게시글', '안녕하세요, 첫 번째 게시글입니다. 자유롭게 의견을 나눠주세요.', SYSTIMESTAMP, 10, 1);

INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('두 번째 게시글', '자유게시판 사용 규칙을 확인해주세요.', SYSTIMESTAMP, 25, 2);

INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('운동 팁 공유', '오늘의 운동 팁: 스쿼트는 다리 근력 향상에 효과적입니다.', SYSTIMESTAMP, 40, 3);

INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('새로운 이벤트 소식', '스페이스 GYM에서 새로운 이벤트가 시작되었습니다. 많은 참여 부탁드립니다.', SYSTIMESTAMP, 5, 4);

INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('자유게시판 이용 질문', '자유게시판에서 사진은 어떻게 첨부할 수 있나요?', SYSTIMESTAMP, 12, 5);

INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('헬스장 추천해주세요', '서울 지역에서 좋은 헬스장을 추천받고 싶습니다.', SYSTIMESTAMP, 8, 6);

INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('식단 관리 어떻게 하세요?', '여러분은 어떤 식단 관리 방법을 사용하시나요?', SYSTIMESTAMP, 22, 7);

INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('헬스 시작한지 1달째', '운동을 시작한지 1달이 지났습니다. 몸이 많이 변화했어요.', SYSTIMESTAMP, 30, 8);

INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('운동 중 부상 예방 방법', '운동 중 부상 예방을 위해 어떤 점을 유의하시나요?', SYSTIMESTAMP, 15, 9);

INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('헬스장 소음 문제', '헬스장에서 소음이 너무 심합니다. 조치가 필요합니다.', SYSTIMESTAMP, 50, 10);

COMMIT;

INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES ('피트니스 트레이너', '개인 및 그룹 운동 지도 경험이 있는 자.', 'Administrator', 0);
INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES ('운동 생리학자', '운동 효과 분석 및 연구 경험 필수.', 'Administrator', 0);
INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES ('스포츠 영양사', '운동선수를 위한 맞춤형 영양 상담 경험.', 'Administrator', 0);
INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES ('요가 강사', '요가 자격증 보유 및 수업 진행 경험.', 'Administrator', 0);
INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES ('스포츠 마케팅 전문가', '스포츠 관련 브랜드 마케팅 경험.', 'Administrator', 0);
INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES ('팀 스포츠 코치', '팀 스포츠 지도 경험 및 전략 수립 능력.', 'Administrator', 0);
INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES ('운동 재활 전문가', '부상 회복 프로그램 개발 경험.', 'Administrator', 0);
INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES ('체육 교사', '교육학 및 체육 관련 자격증 보유.', 'Administrator', 0);
INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES ('트레이닝 프로그램 개발자', '운동 프로그램 설계 및 실행 경험.', 'Administrator', 0);
INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES ('피트니스 센터 매니저', '센터 운영 및 고객 관리 경험.', 'Administrator', 0);
INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES ('스포츠 의학 전문의', '운동 관련 부상 치료 및 상담 경험.', 'Administrator', 0);
INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES ('그룹 피트니스 강사', '다양한 운동 프로그램 진행 경험.', 'Administrator', 0);
INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES ('아웃도어 운동 가이드', '하이킹 및 캠핑 관련 경험.', 'Administrator', 0);
INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES ('스포츠 심리학자', '운동선수 심리 상담 및 멘탈 트레이닝 경험.', 'Administrator', 0);
INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES ('체력 단련 코치', '체력 평가 및 맞춤형 훈련 제공 경험.', 'Administrator', 0);

COMMIT;