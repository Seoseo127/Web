CREATE TABLE PRODUCT (
	NUM	NUMBER(10) PRIMARY KEY, --시퀀스 번호
	CATEGORY VARCHAR2(10) NOT NULL, --품목구분(컴퓨터:COM001, 가전제품:ELE002, 스포츠:SP003)
	PNUM VARCHAR2(20) NOT NULL, --제품번호
	NAME VARCHAR2(100) NOT NULL, --제품명
	COMPANY VARCHAR2(50) NOT NULL, --제조사(판매사)
	PRICE NUMBER(8)	NOT NULL, --판매가격
	SALEPRICE NUMBER(8)	NOT NULL, --판매가격(할인적용된)
	IMAGE_SMALL VARCHAR2(50), --사진이미지(작은)
	IMAGE_LARGE VARCHAR2(50), --사진이미지(큰)
	CONTENT	VARCHAR2(4000) NOT NULL, --제품상세정보
	REGDATE	DATE DEFAULT SYSDATE NOT NULL --제품 등록일
);

CREATE SEQUENCE PRODUCT_NUM NOCACHE;
/*
CREATE SEQUENCE PRODUCT_NUM
INCREMENT BY 1
START WITH 1
NOCACHE;
*/

INSERT INTO PRODUCT
       (NUM, CATEGORY, PNUM, NAME, COMPANY
     , PRICE, SALEPRICE, IMAGE_SMALL, IMAGE_LARGE
     , CONTENT
     , REGDATE)
VALUES (PRODUCT_NUM.NEXTVAL, 'sp003', 'RC-113', '로체스 인라인', '로체스'
     , 3200, 1150, 'pds1.jpg', 'pds1_z.jpg'
     , '바이오맥스 통풍 나일론-HGPU SHELL * 특수 충격 흡수 밑창 * 신발끈 메모리 버클 * 힐 락에 의한 신속한 신발끈 시스템 * 느린 메모리 포말에 의한 편안한 통풍성의 숨쉬는 라이너 * 쿨 통풍 시스템 * 통풍성의 인체공학적 신발밑창 * 손쉬운 엔트리 시스템(신기 편한 입구) * 몰디드 알루미늄 프레임 * 80mm 82a hyper dubbs 휠 * 강철 스페이서 * ABEC-5 베어링'
     , SYSDATE);

INSERT INTO PRODUCT 
       (NUM, CATEGORY, PNUM, NAME, COMPANY
     , PRICE, SALEPRICE, IMAGE_SMALL, IMAGE_LARGE
     , CONTENT
     , REGDATE)
VALUES (PRODUCT_NUM.NEXTVAL, 'ele002', 'vC-13', '사니PDP-TV', '사니'
     , 9200, 4750, 'pds4.jpg', 'pds4_z.jpg'
     , '질러~ 질러! 무조건 질러봐~ 후회 하지 않아~~'
     , SYSDATE);

COMMIT;

---------------------------------------------------------------
-- 추가 데이터
INSERT INTO PRODUCT 
       (NUM, CATEGORY, PNUM, NAME, COMPANY
     , PRICE, SALEPRICE, IMAGE_SMALL, IMAGE_LARGE
     , CONTENT
     , REGDATE)
VALUES (PRODUCT_NUM.NEXTVAL,'sp003', 'RC-500', '로체스헬멧', '로체스'
     , 2000, 1000, 'pds3.jpg', 'pds3_z.jpg'
     , '가볍고 튼튼한 소재와 통풍이 잘되는 구조로 안전과 쾌적함을 한 번에~~~'
     , SYSDATE);
     
INSERT INTO PRODUCT 
       (NUM, CATEGORY, PNUM, NAME, COMPANY
     , PRICE, SALEPRICE, IMAGE_SMALL, IMAGE_LARGE
     , CONTENT
     , REGDATE)
VALUES (PRODUCT_NUM.NEXTVAL,'sp003', 'RC-501', '로체스헬멧2', '로체스'
     , 2500, 1100, 'pds3.jpg', 'pds3_z.jpg'
     , '특수강화소재, 가볍고 튼튼한 소재와 통풍이 잘되는 구조로 안전과 쾌적함을 한 번에~~~'
     , SYSDATE);

COMMIT;

SELECT * FROM PRODUCT;


