SELECT MEMBER_IDX, TITLE, CONTENT, REGIST_DATE, VIEWS FROM FREEBOARD;

SELECT f.IDX, f.TITLE, f.CONTENT, f.REGIST_DATE, f.VIEWS, f.MEMBER_IDX 
    FROM FREEBOARD f JOIN MEMBER m ON f.MEMBER_IDX = m.MEMBER_IDX WHERE m.NAME LIKE '%김%';
delete from freeboard where title = '글을작성합니다';
commit;

select * from freeboard;
select * from recruit_board;
select * from member;

SELECT fb.IDX, fb.TITLE, fb.CONTENT, fb.REGIST_DATE,
	    		 fb.VIEWS, m.MEMBER_IDX, m.NAME 
	    		FROM FREEBOARD fb 
	    		JOIN MEMBER m ON fb.MEMBER_IDX = m.MEMBER_IDX 
	    		ORDER BY IDX DESC;
                
                DELETE FROM FREEBOARD WHERE IDX = 13;
commit;
delete from freeboard where idx = 45;

SELECT fb.IDX, fb.TITLE, fb.CONTENT, fb.REGIST_DATE, 
        fb.VIEWS, fb.MEMBER_IDX, m.NAME
	        FROM FREEBOARD fb
	        JOIN MEMBER m ON fb.MEMBER_IDX = m.MEMBER_IDX
            WHERE FB.IDX = 2;
            
SELECT f.IDX, f.TITLE, f.CONTENT, f.REGIST_DATE, f.VIEWS, f.MEMBER_IDX, m.NAME
        FROM FREEBOARD f LEFT JOIN MEMBER m ON f.IDX = m.MEMBER_IDX
        WHERE f.TITLE LIKE '%ù%' OR f.CONTENT LIKE '%ù%';

SELECT f.IDX, f.TITLE, f.CONTENT, f.REGIST_DATE, f.VIEWS, f.MEMBER_IDX, m.NAME
        FROM FREEBOARD f LEFT JOIN MEMBER m ON f.IDX = m.MEMBER_IDX WHERE m.NAME LIKE '%��%';            
            
SELECT * FROM FREEBOARD WHERE IDX = 2;
SELECT * FROM FREEBOARD;

SELECT * FROM MEMBER;

UPDATE MEMBER SET MEMBER_LEVEL = 1;
COMMIT;


INSERT INTO MEMBER (MEMBER_LEVEL, LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES (2, 'admin1', 'adminpass1', '관리자', SYSDATE, '11111', '서울시 중구', '을지로 111-11', 'admin1@example.com', '관리자 메모 없음', '010-5678-1234');

INSERT INTO MEMBER (MEMBER_LEVEL, LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) 
VALUES (2, 'admin2', 'adminpass2', '스페이스씨엘', SYSDATE, '22222', '서울시 용산구', '이태원 222-22', 'admin2@example.com', '관리자 메모 없음', '010-6789-2345');
            