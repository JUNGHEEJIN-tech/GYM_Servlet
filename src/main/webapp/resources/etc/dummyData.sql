
-- ȸ�� ���̵����� ����

INSERT INTO MEMBER (MEMBER_LEVEL, LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES (1, 'user1', 'pass1', 'ȫ�浿', SYSDATE, '12345', '����� ������', '���ﵿ 123-45', 'user1@example.com', '�޸� ����', '010-1234-5678');

INSERT INTO MEMBER (MEMBER_LEVEL, LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES (1, 'user2', 'pass2', '�迵��', SYSDATE, '54321', '����� ���ʱ�', '���ʵ� 543-21', 'user2@example.com', '�޸� ����', '010-2345-6789');

INSERT INTO MEMBER (MEMBER_LEVEL, LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES (2, 'user3', 'pass3', '��ö��', SYSDATE, '67890', '����� ������', '������ 678-90', 'user3@example.com', '�޸� ����', '010-3456-7890');

INSERT INTO MEMBER (MEMBER_LEVEL, LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES (2, 'user4', 'pass4', '�̼���', SYSDATE, '98765', '����� ���α�', '���� 987-65', 'user4@example.com', '�޸� ����', '010-4567-8901');

INSERT INTO MEMBER (MEMBER_LEVEL, LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES (1, 'user5', 'pass5', '�����', SYSDATE, '34567', '����� ������', 'ȭ� 345-67', 'user5@example.com', '�޸� ����', '010-5678-9012');

INSERT INTO MEMBER (MEMBER_LEVEL, LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES (1, 'user6', 'pass6', '�Ż��Ӵ�', SYSDATE, '76543', '����� ���ϱ�', '���ϵ� 765-43', 'user6@example.com', '�޸� ����', '010-6789-0123');

INSERT INTO MEMBER (MEMBER_LEVEL, LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES (3, 'user7', 'pass7', '������', SYSDATE, '11223', '����� �߱�', '�湫�� 112-23', 'user7@example.com', '�޸� ����', '010-7890-1234');

INSERT INTO MEMBER (MEMBER_LEVEL, LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES (2, 'user8', 'pass8', '�������', SYSDATE, '33445', '����� ���빮��', 'û���� 334-45', 'user8@example.com', '�޸� ����', '010-8901-2345');

INSERT INTO MEMBER (MEMBER_LEVEL, LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES (1, 'user9', 'pass9', '�念��', SYSDATE, '55667', '����� ���빮��', 'ȫ���� 556-67', 'user9@example.com', '�޸� ����', '010-9012-3456');

INSERT INTO MEMBER (MEMBER_LEVEL, LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES (3, 'user10', 'pass10', '���߱�', SYSDATE, '77889', '����� ��걸', '���¿� 778-89', 'user10@example.com', '�޸� ����', '010-0123-4567');

COMMIT;


-- �����Խ��� ���̵����� ����
INSERT INTO FREE_BOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('ù ��° �Խñ�', '�ȳ��ϼ���, ù ��° �Խñ��Դϴ�. �����Ӱ� �ǰ��� �����ּ���.', SYSTIMESTAMP, 10, 1);

INSERT INTO FREE_BOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('�� ��° �Խñ�', '�����Խ��� ��� ��Ģ�� Ȯ�����ּ���.', SYSTIMESTAMP, 25, 2);

INSERT INTO FREE_BOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('� �� ����', '������ � ��: ����Ʈ�� �ٸ� �ٷ� ��� ȿ�����Դϴ�.', SYSTIMESTAMP, 40, 3);

INSERT INTO FREE_BOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('���ο� �̺�Ʈ �ҽ�', '�����̽� GYM���� ���ο� �̺�Ʈ�� ���۵Ǿ����ϴ�. ���� ���� ��Ź�帳�ϴ�.', SYSTIMESTAMP, 5, 4);

INSERT INTO FREE_BOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('�����Խ��� �̿� ����', '�����Խ��ǿ��� ������ ��� ÷���� �� �ֳ���?', SYSTIMESTAMP, 12, 5);

INSERT INTO FREE_BOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('�ｺ�� ��õ���ּ���', '���� �������� ���� �ｺ���� ��õ�ް� �ͽ��ϴ�.', SYSTIMESTAMP, 8, 6);

INSERT INTO FREE_BOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('�Ĵ� ���� ��� �ϼ���?', '�������� � �Ĵ� ���� ����� ����Ͻó���?', SYSTIMESTAMP, 22, 7);

INSERT INTO FREE_BOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('�ｺ �������� 1��°', '��� �������� 1���� �������ϴ�. ���� ���� ��ȭ�߾��.', SYSTIMESTAMP, 30, 8);

INSERT INTO FREE_BOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('� �� �λ� ���� ���', '� �� �λ� ������ ���� � ���� �����Ͻó���?', SYSTIMESTAMP, 15, 9);

INSERT INTO FREE_BOARD (TITLE, CONTENT, REGIST_DATE, VIEWS, MEMBER_IDX) 
VALUES ('�ｺ�� ���� ����', '�ｺ�忡�� ������ �ʹ� ���մϴ�. ��ġ�� �ʿ��մϴ�.', SYSTIMESTAMP, 50, 10);

COMMIT;