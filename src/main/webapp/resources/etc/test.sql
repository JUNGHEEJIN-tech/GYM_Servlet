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


select * from attraction;
SELECT 
    attr_idx, 
    title, 
    content, 
    trainer_idx, 
    to_char(prog_TIME, 'YYYY-MM-DD') || 'T' ||
    to_char(prog_TIME, 'HH24:MI:SS')  AS PROG_TIME,    
    to_char(END_TIME + INTERVAL '1' HOUR * PERIOD, 'YYYY-MM-DD') || 'T' ||
    TO_CHAR(END_TIME + INTERVAL '1' HOUR * PERIOD, 'hh24:MI:SS') AS END_TIME
    FROM ATTRACTION;
    
    update attraction set end_time = '' where attr_idx in (6,7);
    commit;
    
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
insert into trainer values (1, 12);
select a.*, b.* from trainer a left join member b on a.member_idx = b.member_idx;
commit;