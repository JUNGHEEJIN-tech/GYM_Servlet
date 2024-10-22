
-- ȸ�� ���̵����� ����

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user1', 'pass1', 'ȫ�浿', SYSDATE, '12345', '����� ������', '���ﵿ 123-45', 'user1@example.com', '�޸� ����', '010-1234-5678');

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user2', 'pass2', '�迵��', SYSDATE, '54321', '����� ���ʱ�', '���ʵ� 543-21', 'user2@example.com', '�޸� ����', '010-2345-6789');

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user3', 'pass3', '��ö��', SYSDATE, '67890', '����� ������', '������ 678-90', 'user3@example.com', '�޸� ����', '010-3456-7890');

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user4', 'pass4', '�̼���', SYSDATE, '98765', '����� ���α�', '���� 987-65', 'user4@example.com', '�޸� ����', '010-4567-8901');

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user5', 'pass5', '�����', SYSDATE, '34567', '����� ������', 'ȭ� 345-67', 'user5@example.com', '�޸� ����', '010-5678-9012');

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user6', 'pass6', '�Ż��Ӵ�', SYSDATE, '76543', '����� ���ϱ�', '���ϵ� 765-43', 'user6@example.com', '�޸� ����', '010-6789-0123');

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user7', 'pass7', '������', SYSDATE, '11223', '����� �߱�', '�湫�� 112-23', 'user7@example.com', '�޸� ����', '010-7890-1234');

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user8', 'pass8', '�������', SYSDATE, '33445', '����� ���빮��', 'û���� 334-45', 'user8@example.com', '�޸� ����', '010-8901-2345');

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user9', 'pass9', '�念��', SYSDATE, '55667', '����� ���빮��', 'ȫ���� 556-67', 'user9@example.com', '�޸� ����', '010-9012-3456');

INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES ('user10', 'pass10', '���߱�', SYSDATE, '77889', '����� ��걸', '���¿� 778-89', 'user10@example.com', '�޸� ����', '010-0123-4567');

-- �����ڿ� ������ ����

INSERT INTO MEMBER (MEMBER_LEVEL, LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES (2, 'admin', 'pass1', '������', SYSDATE, '11111', '����� �߱�', '������ 111-11', 'admin1@example.com', '������ �޸� ����', '010-5678-1234');

INSERT INTO MEMBER (MEMBER_LEVEL, LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES (2, 'admin2', 'pass2', '�����̽�����', SYSDATE, '22222', '����� ��걸', '���¿� 222-22', 'admin2@example.com', '������ �޸� ����', '010-6789-2345');

COMMIT;


-- �����Խ��� ���̵����� ����
INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('ù ��° �Խñ�', '�ȳ��ϼ���, ù ��° �Խñ��Դϴ�. �����Ӱ� �ǰ��� �����ּ���.', SYSTIMESTAMP, 10, 1);

INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('�� ��° �Խñ�', '�����Խ��� ��� ��Ģ�� Ȯ�����ּ���.', SYSTIMESTAMP, 25, 2);

INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('� �� ����', '������ � ��: ����Ʈ�� �ٸ� �ٷ� ��� ȿ�����Դϴ�.', SYSTIMESTAMP, 40, 3);

INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('���ο� �̺�Ʈ �ҽ�', '�����̽� GYM���� ���ο� �̺�Ʈ�� ���۵Ǿ����ϴ�. ���� ���� ��Ź�帳�ϴ�.', SYSTIMESTAMP, 5, 4);

INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('�����Խ��� �̿� ����', '�����Խ��ǿ��� ������ ��� ÷���� �� �ֳ���?', SYSTIMESTAMP, 12, 5);

INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('�ｺ�� ��õ���ּ���', '���� �������� ���� �ｺ���� ��õ�ް� �ͽ��ϴ�.', SYSTIMESTAMP, 8, 6);

INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('�Ĵ� ���� ��� �ϼ���?', '�������� � �Ĵ� ���� ����� ����Ͻó���?', SYSTIMESTAMP, 22, 7);

INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('�ｺ �������� 1��°', '��� �������� 1���� �������ϴ�. ���� ���� ��ȭ�߾��.', SYSTIMESTAMP, 30, 8);

INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('� �� �λ� ���� ���', '� �� �λ� ������ ���� � ���� �����Ͻó���?', SYSTIMESTAMP, 15, 9);

INSERT INTO FREEBOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('�ｺ�� ���� ����', '�ｺ�忡�� ������ �ʹ� ���մϴ�. ��ġ�� �ʿ��մϴ�.', SYSTIMESTAMP, 50, 10);

INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES 
('피트니스 트레이너', '개인 및 그룹 운동 지도 경험이 있는 자.', 'Administrator', 0);

INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES 
('운동 생리학자', '운동 효과 분석 및 연구 경험 필수.', 'Administrator', 0);

INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES 
('스포츠 영양사', '운동선수를 위한 맞춤형 영양 상담 경험.', 'Administrator', 0);

INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES 
('요가 강사', '요가 자격증 보유 및 수업 진행 경험.', 'Administrator', 0);

INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES 
('스포츠 마케팅 전문가', '스포츠 관련 브랜드 마케팅 경험.', 'Administrator', 0);

INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES 
('팀 스포츠 코치', '팀 스포츠 지도 경험 및 전략 수립 능력.', 'Administrator', 0);

INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES 
('운동 재활 전문가', '부상 회복 프로그램 개발 경험.', 'Administrator', 0);

INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES 
('체육 교사', '교육학 및 체육 관련 자격증 보유.', 'Administrator', 0);

INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES 
('트레이닝 프로그램 개발자', '운동 프로그램 설계 및 실행 경험.', 'Administrator', 0);

INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES 
('피트니스 센터 매니저', '센터 운영 및 고객 관리 경험.', 'Administrator', 0);

INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES 
('스포츠 의학 전문의', '운동 관련 부상 치료 및 상담 경험.', 'Administrator', 0);

INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES 
('그룹 피트니스 강사', '다양한 운동 프로그램 진행 경험.', 'Administrator', 0);

INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES 
('아웃도어 운동 가이드', '하이킹 및 캠핑 관련 경험.', 'Administrator', 0);

INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES 
('스포츠 심리학자', '운동선수 심리 상담 및 멘탈 트레이닝 경험.', 'Administrator', 0);

INSERT INTO RECRUIT_BOARD (TITLE, CONTENT, WRITER, VIEWS) VALUES 
('체력 단련 코치', '체력 평가 및 맞춤형 훈련 제공 경험.', 'Administrator', 0);

COMMIT;