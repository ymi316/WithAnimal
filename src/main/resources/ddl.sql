-- 회원 정보 테이블
DROP TABLE withanimal_member;			
CREATE TABLE withanimal_member(			
	idx			NUMBER			PRIMARY KEY NOT NULL,
	u_id		VARCHAR2(50)	NOT NULL,
	u_pw		VARCHAR2(50)	NOT NULL,
	u_name		VARCHAR2(50)	NOT NULL,
	u_birth		TIMESTAMP		NULL,
	u_phone		VARCHAR2(20)	NOT NULL,
	u_zipcode	VARCHAR2(10)	NULL,
	u_addr1		VARCHAR2(100)	NULL,
	u_addr2		VARCHAR2(100)	NULL,
	u_use		NUMBER			NULL,
	u_regdate	TIMESTAMP		NOT NULL	
);			
SELECT * FROM withanimal_member;			
CREATE SEQUENCE withanimal_member_idx_seq;			

INSERT INTO withanimal_member VALUES (withanimal_member_idx_seq.nextval,'hgd@naver.com','123456','홍길동','1995-12-01','010-1111-1111','','','','0',SYSDATE);
COMMIT;
SELECT * FROM withanimal_member;


-- 반려동물 분실등록/제보
-- 갤러리 게시판
DROP TABLE withanimal_lost;					
CREATE TABLE withanimal_lost(					
	content_idx		NUMBER			PRIMARY KEY NOT NULL,	
	u_id			VARCHAR2(50)	NOT NULL,	
	u_pw			VARCHAR2(50)	NOT NULL,	
	u_name			VARCHAR2(50)	NOT NULL,	
	subject			VARCHAR2(200)	NULL,	
	content			VARCHAR2(500)	NULL,	
	content_regdate	TIMESTAMP		NULL,	
	ip				VARCHAR2(20)	NULL	
);					
SELECT * FROM withanimal_lost;	
CREATE SEQUENCE withanimal_lost_idx_seq;	

INSERT INTO withanimal_lost VALUES (withanimal_lost_idx_seq.nextval,'hgd@naver.com','123456','홍길동','게시물 등록합니다.','일빠다~~~',SYSDATE,'');
COMMIT;
SELECT * FROM withanimal_lost;	


insert into withanimal_lost values 
(withanimal_lost_idx_seq.nextval,'#{u_id}','#{u_pw}','#{u_name}','#{subject}','#{content}',SYSDATE,'#{ip}') ;


-- 유기동물 조회 서비스
-- 갤러리 게시판
DROP TABLE withanimal_protect;				
CREATE TABLE withanimal_protect				
(	
	content_idx		NUMBER			PRIMARY KEY NOT NULL,	
	age				VARCHAR2(30)	NULL,	
	careAddr		VARCHAR2(200)	NULL,	
	careNm			VARCHAR2(50)	NULL,	
	careTel			VARCHAR2(14)	NULL,	
	chargeNm		VARCHAR2(20)	NULL,	
	colorCd			VARCHAR2(30)	NULL,	
	desertionNo		VARCHAR2(20)	NULL,	
	filename		VARCHAR2(100)	NULL,	
	happenDt		VARCHAR2(8)		NULL,	
	happenPlace		VARCHAR2(100)	NULL,	
	kindCd			VARCHAR2(50)	NULL,	
	neuterYn		VARCHAR2(1)		NULL,	
	noticeEdt		VARCHAR2(8)		NULL,	
	noticeNo		VARCHAR2(30)	NULL,	
	noticeSdt		VARCHAR2(8)		NULL,	
	officetel		VARCHAR2(14)	NULL,	
	orgNm			VARCHAR2(50)	NULL,	
	popfile			VARCHAR2(100)	NULL,	
	processState	VARCHAR2(10)	NULL,	
	sexCd			VARCHAR2(1)		NULL,	
	specialMark		VARCHAR2(200)	NULL,	
	weight			VARCHAR2(30)	NULL,
	bgnde			VARCHAR2(20)	NULL,	
	endde			VARCHAR2(20)	NULL	
);				
CREATE SEQUENCE withanimal_protect_idx_seq;
SELECT * FROM withanimal_protect;				




