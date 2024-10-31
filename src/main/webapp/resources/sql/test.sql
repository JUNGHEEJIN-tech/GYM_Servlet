SELECT MEMBER_IDX, TITLE, CONTENT, REGIST_DATE, VIEWS FROM FREEBOARD;

SELECT f.IDX, f.TITLE, f.CONTENT, f.REGIST_DATE, f.VIEWS, f.MEMBER_IDX 
    FROM FREEBOARD f JOIN MEMBER m ON f.MEMBER_IDX = m.MEMBER_IDX WHERE m.NAME LIKE '%김%';
delete from freeboard where title = '글을작성합니다';
commit;

select * from freeboard;
select * from recruit_board;
select * from member;
select * from notice_board;
select * from attraction;
select * from trainer;
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

SELECT A.*, B.MEMBER_IDX, B.NAME AS WRITER FROM NOTICE_BOARD A JOIN MEMBER B
ON A.MEMBER_IDX = B.MEMBER_IDX;

ALTER TABLE MEMBER MODIFY LOGIN_ID VARCHAR2(255) UNIQUE;

SELECT fb.IDX, fb.TITLE, fb.CONTENT, fb.REGIST_DATE,
	    		fb.VIEWS, m.MEMBER_IDX, m.NAME
	    		FROM FREEBOARD fb
	    		JOIN MEMBER m ON fb.MEMBER_IDX = m.MEMBER_IDX
	    		ORDER BY fb.REGIST_DATE DESC
	    		OFFSET 4 ROWS FETCH NEXT 10 ROWS ONLY;


SELECT * FROM TRAINER;
select * from member;
select * from trainer;
select * from attraction;
insert into trainer values (1, 12);
select a.*, b.* from trainer a left join member b on a.member_idx = b.member_idx;
commit;

select trainer_idx, member_idx, login_id, name
from trainer natural join member;

select * from attraction;
delete from attraction where attr_idx=22;
