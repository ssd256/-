--------------------------------------------------
--------------     ���̺� �ʱ�ȭ    ------------------   
--------------------------------------------------
DROP TABLE APPLICATION CASCADE CONSTRAINTS ;
DROP TABLE BOARD CASCADE CONSTRAINTS ;
DROP TABLE MEMBER CASCADE CONSTRAINTS ;
DROP TABLE PRODUCT CASCADE CONSTRAINTS ;
DROP TABLE QUESTION CASCADE CONSTRAINTS ;
DROP TABLE REPORT CASCADE CONSTRAINTS ;
DROP TABLE CART CASCADE CONSTRAINTS ; 
DROP TABLE REVIEW CASCADE CONSTRAINTS ;
DROP TABLE VOLUNTEER CASCADE CONSTRAINTS ;
DROP TABLE ORDERS CASCADE CONSTRAINTS ;
DROP TABLE FILES CASCADE CONSTRAINTS ;
DROP TABLE COMMENTS CASCADE CONSTRAINTS ;
DROP TABLE SHARES CASCADE CONSTRAINTS ;
DROP TABLE WISH CASCADE CONSTRAINTS ;
DROP SEQUENCE SEQ_BOARD_NO;
DROP SEQUENCE SEQ_CART_NO;
DROP SEQUENCE SEQ_COMMENTS_NO;
DROP SEQUENCE SEQ_FILES_NO;
DROP SEQUENCE SEQ_ORDERS_NO;
DROP SEQUENCE SEQ_PRODUCT_NO;
DROP SEQUENCE SEQ_REPORT_NO;
DROP SEQUENCE SEQ_WISH_NO;

--------------------------------------------------
--------------        ��� ����       ------------------   
--------------------------------------------------
CREATE TABLE MEMBER (
   M_ID          VARCHAR2(10CHAR),
   M_PWD          VARCHAR2(20CHAR) NOT NULL,
   M_TEM          CHAR(1) DEFAULT 'N',
   M_NICKNAME       VARCHAR2(10CHAR) NOT NULL,
   M_NAME             VARCHAR2(5CHAR) NOT NULL,
   M_BIRTHDAY             DATE NOT NULL,
   M_GENDER          CHAR(1) NOT NULL,
   M_ADDRESS          VARCHAR2(40CHAR) NOT NULL,
   M_EAMIL         VARCHAR2(20CHAR) NOT NULL,
   M_PHONE            VARCHAR2(13CHAR) NOT NULL,
   M_INTERST          VARCHAR2(30CHAR) NULL,
   M_JOB          VARCHAR2(10CHAR) NULL,
   M_ENABLE       CHAR(1) DEFAULT 'N',
   M_GRADE            VARCHAR2(10CHAR) NOT NULL,
   M_KAKAO            NUMBER NULL,
	M_ID 			VARCHAR2(10CHAR),
	M_PWD 			VARCHAR2(100byte) NOT NULL,
	M_TEM 			CHAR(1) DEFAULT 'N',
	M_NICKNAME 		VARCHAR2(10CHAR) NOT NULL,
	M_NAME 				VARCHAR2(5CHAR) NOT NULL,
	M_BIRTHDAY 				DATE NOT NULL,
	M_GENDER 			CHAR(1) NOT NULL,
	M_ADDRESS 			VARCHAR2(40CHAR) NOT NULL,
	M_EAMIL			VARCHAR2(20CHAR) NOT NULL,
	M_PHONE				VARCHAR2(13CHAR) NOT NULL,
	M_INTERST 			VARCHAR2(30CHAR) NULL,
	M_JOB 			VARCHAR2(10CHAR) NULL,
	M_ENABLE		 CHAR(1) DEFAULT 'N',
	M_GRADE				VARCHAR2(10CHAR) NOT NULL,
	M_KAKAO				NUMBER NULL,
    
    CONSTRAINT PK_MEMBER PRIMARY KEY (M_ID)
);

    alter table MEMBER modify(M_PWD VARCHAR2(100 byte));
    commit;

    COMMENT ON COLUMN MEMBER.M_ID IS '���̵�';
    COMMENT ON COLUMN MEMBER.M_PWD IS '��й�ȣ';
    COMMENT ON COLUMN MEMBER.M_TEM IS '�ӽú�й�ȣ �߱޿���';
    COMMENT ON COLUMN MEMBER.M_NICKNAME IS '�г���';
    COMMENT ON COLUMN MEMBER.M_NAME IS '�̸�';
    COMMENT ON COLUMN MEMBER.M_BIRTHDAY IS '�������';
    COMMENT ON COLUMN MEMBER.M_GENDER IS '����';
    COMMENT ON COLUMN MEMBER.M_ADDRESS IS '�ּ�';
    COMMENT ON COLUMN MEMBER.M_EAMIL IS '�̸���';
    COMMENT ON COLUMN MEMBER.M_PHONE IS '�ڵ���';
    COMMENT ON COLUMN MEMBER.M_INTERST IS '���ɺо�';
    COMMENT ON COLUMN MEMBER.M_JOB IS '����';
    COMMENT ON COLUMN MEMBER.M_ENABLE IS 'Ż�𿩺�';
    COMMENT ON COLUMN MEMBER.M_GRADE IS '���';
    COMMENT ON COLUMN MEMBER.M_KAKAO IS 'īī�����̵�';

--------------------------------------------------
--------------     �Խ��� ����    ------------------   
--------------------------------------------------

CREATE TABLE BOARD (
   B_NO NUMBER,
   M_ID VARCHAR2(10CHAR),
   B_TITLE   VARCHAR2(20CHAR) NOT NULL,
   B_CONTENT VARCHAR2(500CHAR) NOT NULL,
   B_CATEGORY VARCHAR2(50)   NOT NULL,
   B_DATE DATE DEFAULT SYSDATE,
   B_MODIFYDATE DATE DEFAULT SYSDATE,
   B_STATUS CHAR(1) DEFAULT 'N',
    
    CONSTRAINT PK_BOARD PRIMARY KEY (B_NO),
    CONSTRAINT FK_MEMBER_TO_BOARD FOREIGN KEY (M_ID) REFERENCES MEMBER (M_ID)
);

    COMMENT ON COLUMN BOARD.B_NO IS '�Խñ۹�ȣ';
    COMMENT ON COLUMN BOARD.M_ID IS '�Խñ��ۼ���';
    COMMENT ON COLUMN BOARD.B_TITLE IS '����';
    COMMENT ON COLUMN BOARD.B_CONTENT IS '����';
    COMMENT ON COLUMN BOARD.B_CATEGORY IS '�Խ���ī�װ�';
    COMMENT ON COLUMN BOARD.B_DATE IS '�ۼ�����';
    COMMENT ON COLUMN BOARD.B_MODIFYDATE IS '��������';
    COMMENT ON COLUMN BOARD.B_STATUS IS '��������';


CREATE SEQUENCE  SEQ_BOARD_NO  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;

--------------------------------------------------
--------------        ��ǰ ����       ------------------   
--------------------------------------------------

CREATE TABLE PRODUCT (
   P_NO NUMBER,
   B_NO NUMBER,
   P_CATEGORY VARCHAR2(15CHAR)   NOT NULL,
   P_NAME VARCHAR2(30CHAR)   NOT NULL,
   P_PRICE   NUMBER   NOT NULL,
   P_COUNT   NUMBER   NOT NULL,
   P_COMMENT VARCHAR2(500CHAR) NOT NULL,
    
    CONSTRAINT PK_PRODUCT PRIMARY KEY (P_NO),
    CONSTRAINT FK_BOARD_TO_PRODUCT FOREIGN KEY (B_NO) REFERENCES BOARD (B_NO)
);

    COMMENT ON COLUMN PRODUCT.P_NO IS '��ǰ��ȣ';
    COMMENT ON COLUMN PRODUCT.B_NO IS '�Խñ۹�ȣ';
    COMMENT ON COLUMN PRODUCT.P_CATEGORY IS '��ǰī�װ�';
    COMMENT ON COLUMN PRODUCT.P_NAME IS '��ǰ��';
    COMMENT ON COLUMN PRODUCT.P_PRICE IS '��ǰ����';
    COMMENT ON COLUMN PRODUCT.P_COUNT IS '������';
    COMMENT ON COLUMN PRODUCT.P_COMMENT IS '��ǰ����';
   
   
CREATE SEQUENCE  SEQ_PRODUCT_NO  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;

--------------------------------------------------
--------------     ���� �Խ���    ------------------   
--------------------------------------------------

CREATE TABLE SHARES (
   B_NO NUMBER   NOT NULL,
   S_STATUS CHAR(1) DEFAULT 'N',
   S_ADDRESS VARCHAR2(20CHAR) NOT NULL,
   S_STOCK   NUMBER NOT NULL,
   S_REPORT NUMBER   DEFAULT 0,
    
    CONSTRAINT FK_BOARD_TO_SHARES FOREIGN KEY (B_NO) REFERENCES BOARD (B_NO)
);

    COMMENT ON COLUMN SHARES.B_NO IS '�Խñ۹�ȣ';
    COMMENT ON COLUMN SHARES.S_STATUS IS '��ǰ��������';
    COMMENT ON COLUMN SHARES.S_ADDRESS IS '�ּ�';
    COMMENT ON COLUMN SHARES.S_STOCK IS '���';
    COMMENT ON COLUMN SHARES.S_REPORT IS '�Ű�Ƚ��';
    
create or replace view slist
as
select *
from (select b_no, m_id, b_title, b_content, b_category, b_date, b_modifydate, b_status
     ,s_status, s_address, s_stock
    from board
    join shares using(b_no));
    
    
CREATE TABLE APPLY (
	B_NO NUMBER,
	S_APPLICANT VARCHAR2(10CHAR),
	A_APPLYINFO	VARCHAR2(20CHAR),
    
    CONSTRAINT FK_APPLY_TO_BOARD FOREIGN KEY (B_NO) REFERENCES BOARD (B_NO),
    CONSTRAINT FK_APPLY_TO_MEMBER FOREIGN KEY (S_APPLICANT) REFERENCES MEMBER (M_ID)
);
    
--------------------------------------------------
--------------     ���� Ȱ��    ------------------   
--------------------------------------------------
DROP TABLE VOLUNTEER CASCADE CONSTRAINTS ;

CREATE TABLE VOLUNTEER (
   B_NO NUMBER,
   V_DAY VARCHAR2(40CHAR) NOT NULL,
   V_TIME VARCHAR2(40CHAR)   NOT NULL,
   V_LOCATION VARCHAR2(40CHAR)   NOT NULL,
   V_AGENCY VARCHAR2(40CHAR) NOT NULL,
   V_RECRUITMENT NUMBER NOT NULL,
   V_APPLICANT NUMBER DEFAULT 0,
   V_RESPONSIBILITY VARCHAR2(40CHAR) NOT NULL,
   V_PHONE   NUMBER NOT NULL,
    
    CONSTRAINT FK_BOARD_TO_VOLUNTEER_1 FOREIGN KEY (B_NO) REFERENCES BOARD (B_NO)
);

    COMMENT ON COLUMN VOLUNTEER.B_NO IS '�Խñ۹�ȣ';
    COMMENT ON COLUMN VOLUNTEER.V_DAY IS '����Ⱓ';
    COMMENT ON COLUMN VOLUNTEER.V_TIME IS '����ð�';
    COMMENT ON COLUMN VOLUNTEER.V_LOCATION IS '�������';
    COMMENT ON COLUMN VOLUNTEER.V_AGENCY IS '��ϱ��';
    COMMENT ON COLUMN VOLUNTEER.V_RECRUITMENT IS '�����ο�';
    COMMENT ON COLUMN VOLUNTEER.V_APPLICANT IS '��û�ο�';
    COMMENT ON COLUMN VOLUNTEER.V_RESPONSIBILITY IS '����ڸ�';
    COMMENT ON COLUMN VOLUNTEER.V_PHONE IS '������ڵ�����ȣ';
    
--------------------------------------------------
--------------     ���� ��û    ------------------   
--------------------------------------------------
    CREATE TABLE PARTICIPATION (
   B_NO NUMBER NOT NULL,
   M_ID VARCHAR2(10CHAR) NOT NULL,
   V_STATUS CHAR(1) DEFAULT 'N',

    
    CONSTRAINT FK_BOARD_TO_VOLUNTEER_2 FOREIGN KEY (B_NO) REFERENCES BOARD (B_NO),
    CONSTRAINT FK_MEMBER_TO_BOARD_2 FOREIGN KEY (M_ID) REFERENCES MEMBER (M_ID)
);

    COMMENT ON COLUMN PARTICIPATION.B_NO IS '�Խñ۹�ȣ';
    COMMENT ON COLUMN PARTICIPATION.M_ID IS '���̵�';
    COMMENT ON COLUMN PARTICIPATION.V_STATUS IS '����Ȱ�� ��û����(N=��û����, Y=��һ���)';
    
    COMMIT;
--------------------------------------------------
--------------     Q/A  �Խ���    ------------------   
--------------------------------------------------
CREATE TABLE QUESTION (
   B_NO NUMBER,
   Q_CATEGORY VARCHAR2(50) NOT NULL,
    
    CONSTRAINT FK_BOARD_TO_QUESTION FOREIGN KEY (B_NO) REFERENCES BOARD (B_NO)
);

    COMMENT ON COLUMN QUESTION.B_NO IS '�Խñ۹�ȣ';
    COMMENT ON COLUMN QUESTION.Q_CATEGORY IS '����ī�װ�';

    
--------------------------------------------------
--------------        ��� ����       ------------------   
--------------------------------------------------
CREATE TABLE COMMENTS (
   C_NO NUMBER,
   B_NO NUMBER   NOT NULL,
   M_ID VARCHAR2(10CHAR) NOT NULL,
   C_CONTENT VARCHAR2(300CHAR) NOT NULL,
   C_DATE DATE   DEFAULT SYSDATE,
   C_MODIFYDATE DATE DEFAULT SYSDATE,
   C_STATUS CHAR(1) DEFAULT 'N',
   C_REPORT NUMBER   DEFAULT 0,
    
    CONSTRAINT PK_COMMENTS PRIMARY KEY (C_NO)
);

    COMMENT ON COLUMN COMMENTS.C_NO IS '��۹�ȣ';
    COMMENT ON COLUMN COMMENTS.B_NO IS '�Խñ۹�ȣ';
    COMMENT ON COLUMN COMMENTS.M_ID IS '����ۼ���';
    COMMENT ON COLUMN COMMENTS.C_CONTENT IS '��۳���';
    COMMENT ON COLUMN COMMENTS.C_DATE IS '�ۼ�����';
    COMMENT ON COLUMN COMMENTS.C_MODIFYDATE IS '��������';
    COMMENT ON COLUMN COMMENTS.C_STATUS IS '��������';
    COMMENT ON COLUMN COMMENTS.C_REPORT IS '�Ű�Ƚ��';
   
CREATE SEQUENCE  SEQ_COMMENTS_NO  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;   
    
--------------------------------------------------
--------------        ���� ����       ------------------   
--------------------------------------------------
CREATE TABLE FILES (
   F_NUM NUMBER,
   B_NO NUMBER   NOT NULL,
   F_PATH VARCHAR2(1000 BYTE) NOT NULL,
   F_ORIGINNAME VARCHAR2(255 BYTE) NOT NULL,
   F_CHANGENAME VARCHAR2(255 BYTE)   NOT NULL,
   F_LEVEL   NUMBER NOT NULL,
   F_STATUS VARCHAR2(1 BYTE) DEFAULT 'N',
    
    CONSTRAINT PK_FILES PRIMARY KEY (F_NUM)
);

    COMMENT ON COLUMN FILES.F_NUM IS '���Ϲ�ȣ';
    COMMENT ON COLUMN FILES.B_NO IS '�Խñ۹�ȣ';
    COMMENT ON COLUMN FILES.F_PATH IS '÷�����ϰ��';
    COMMENT ON COLUMN FILES.F_ORIGINNAME IS '���Ͽ����̸�';
    COMMENT ON COLUMN FILES.F_CHANGENAME IS '���Ϻ����̸�';
    COMMENT ON COLUMN FILES.F_LEVEL IS '���Ϸ���';
    COMMENT ON COLUMN FILES.F_STATUS IS '���ϻ�������';

CREATE SEQUENCE  SEQ_FILES_NO  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;   

--------------------------------------------------
--------------        ���� ����       ------------------   
--------------------------------------------------
CREATE TABLE ORDERS (
   O_NO VARCHAR2(50),
   M_ID VARCHAR2(50) NOT NULL,
   B_NO VARCHAR2(50) NOT NULL,
   P_NO VARCHAR2(50) NOT NULL,
   O_COUNT   NUMBER NOT NULL,
   O_RECIPIENT   VARCHAR2(5CHAR)   NOT NULL,
   O_PHONE   VARCHAR2(11CHAR) NOT NULL,
   O_ADDRESS VARCHAR2(40CHAR) NOT NULL,
   O_PAY NUMBER NOT NULL,
   O_WAY VARCHAR2(10CHAR) NOT NULL,
   O_ADDMASSEGE VARCHAR2(15CHAR),
   O_PAY_DATE DATE DEFAULT SYSDATE,
   O_STATE   VARCHAR2(20) DEFAULT '�����Ϸ�',
   O_DELIVERY VARCHAR2(20)   DEFAULT '��ǰ�غ���', 
    
    CONSTRAINT PK_ORDERS PRIMARY KEY (O_NO)
);

    COMMENT ON COLUMN ORDERS.O_NO IS '�ֹ���ȣ';
    COMMENT ON COLUMN ORDERS.M_ID IS '�ֹ��ھ��̵�';
    COMMENT ON COLUMN ORDERS.B_NO IS '�Խñ۹�ȣ';
    COMMENT ON COLUMN ORDERS.P_NO IS '��ǰ��ȣ';
    COMMENT ON COLUMN ORDERS.O_COUNT IS '����';
    COMMENT ON COLUMN ORDERS.O_RECIPIENT IS '������';
    COMMENT ON COLUMN ORDERS.O_PHONE IS '�����ο���ó';
    COMMENT ON COLUMN ORDERS.O_ADDRESS IS '�����';
    COMMENT ON COLUMN ORDERS.O_PAY IS '�����ݾ�';
    COMMENT ON COLUMN ORDERS.O_WAY IS '�������';
    COMMENT ON COLUMN ORDERS.O_ADDMASSEGE IS '��ۿ�û����';
    COMMENT ON COLUMN ORDERS.O_PAY_DATE IS '������¥';
    COMMENT ON COLUMN ORDERS.O_STATE IS '�ֹ�����(�����Ϸ�/���/����Ȯ��)';
    COMMENT ON COLUMN ORDERS.O_DELIVERY IS '��ۻ��¿���(��ǰ�غ���, ����غ���, �����, ��ۿϷ�)';

CREATE SEQUENCE  SEQ_ORDERS_NO  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;   

--------------------------------------------------
--------------        ��ٱ���       ------------------   
--------------------------------------------------
CREATE TABLE CART (
   CARTNO NUMBER,
   P_NO NUMBER   NOT NULL,
   B_NO NUMBER   NOT NULL,
   M_ID VARCHAR2(50) NOT NULL,
   CART_COUNT NUMBER NOT NULL,
    
    CONSTRAINT PK_CART PRIMARY KEY (CARTNO),
    CONSTRAINT FK_PRODUCT_TO_CART FOREIGN KEY (P_NO) REFERENCES PRODUCT (P_NO),
    CONSTRAINT FK_BOARD_TO_CART FOREIGN KEY (B_NO) REFERENCES BOARD (B_NO),
    CONSTRAINT FK_MEMBER_TO_CART FOREIGN KEY (M_ID) REFERENCES MEMBER (M_ID)
);
    COMMENT ON COLUMN CART.CARTNO IS '��ٱ��Ϲ�ȣ';
    COMMENT ON COLUMN CART.P_NO IS '��ǰ��ȣ';
    COMMENT ON COLUMN CART.B_NO IS '�Խñ۹�ȣ';
    COMMENT ON COLUMN CART.M_ID IS '���̵�';
    COMMENT ON COLUMN CART.CART_COUNT IS '����';

CREATE SEQUENCE  SEQ_CART_NO  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;   

--------------------------------------------------
--------------        ���ϱ�       ------------------   
--------------------------------------------------
CREATE TABLE WISH (
   W_NO NUMBER,
   P_NO NUMBER   NOT NULL,
   B_NO NUMBER   NOT NULL,
   M_ID VARCHAR2(50) NOT NULL,
    
    CONSTRAINT PK_WISH PRIMARY KEY (W_NO)
);

    COMMENT ON COLUMN WISH.W_NO IS '���ϱ��ȣ';
    COMMENT ON COLUMN WISH.P_NO IS '��ǰ��ȣ';
    COMMENT ON COLUMN WISH.B_NO IS '�Խñ۹�ȣ';
    COMMENT ON COLUMN WISH.M_ID IS '���̵�';

CREATE SEQUENCE  SEQ_WISH_NO  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;   

--------------------------------------------------
--------------       �Ű�       ------------------   
--------------------------------------------------
CREATE TABLE REPORT (
   R_NO NUMBER,
   B_NO NUMBER NOT NULL,
   C_NO NUMBER   NOT NULL,
   R_REASON VARCHAR2(20CHAR) NOT NULL,
   R_CATEGORY VARCHAR2(10CHAR) NOT NULL,
   R_STATUS VARCHAR2(10CHAR) NOT NULL,
    
    CONSTRAINT PK_REPORT PRIMARY KEY (R_NO)
);
    
     COMMENT ON COLUMN REPORT.R_NO IS '�Ű��ȣ';
     COMMENT ON COLUMN REPORT.B_NO IS '�Խñ۹�ȣ';
     COMMENT ON COLUMN REPORT.C_NO IS '��۹�ȣ';
     COMMENT ON COLUMN REPORT.R_REASON IS '�Ű����';
     COMMENT ON COLUMN REPORT.R_CATEGORY IS '�Ű�����(�Խñ�/���)';
     COMMENT ON COLUMN REPORT.R_STATUS IS '�Ű�ó������';

CREATE SEQUENCE  SEQ_REPORT_NO  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;   
     
--------------------------------------------------
--------------         ����       ------------------   
--------------------------------------------------
CREATE TABLE REVIEW (
   P_NO NUMBER,
   B_NO NUMBER NOT NULL,
   O_NO VARCHAR2(50) NOT NULL,
   R_CONTENT VARCHAR2(300CHAR) NOT NULL,
   R_STAR NUMBER DEFAULT 5,
    
    CONSTRAINT FK_PRODUCT_TO_REVIEW_1 FOREIGN KEY (P_NO) REFERENCES PRODUCT (P_NO),
    CONSTRAINT FK_BOARD_TO_REVIEW_1 FOREIGN KEY (B_NO) REFERENCES BOARD (B_NO)
	
);

    ALTER TABLE REVIEW ADD R_DATE DATE DEFAULT SYSDATE NOT NULL;
    ALTER TABLE REVIEW ADD R_STATUS VARCHAR2(1CHAR) DEFAULT 'N' NOT NULL;
    ALTER TABLE REVIEW MODIFY R_STATUS VARCHAR2(1CHAR) DEFAULT 'N';

    COMMENT ON COLUMN REVIEW.P_NO IS '��ǰ��ȣ';
    COMMENT ON COLUMN REVIEW.B_NO IS '�Խñ۹�ȣ';
    COMMENT ON COLUMN REVIEW.O_NO IS '�ֹ���ȣ';
    COMMENT ON COLUMN REVIEW.R_CONTENT IS '�ı��ۼ�����';
    COMMENT ON COLUMN REVIEW.R_STAR IS '����';
    COMMENT ON COLUMN REVIEW.R_DATE IS '�ı��ϳ�¥';
    COMMENT ON COLUMN REVIEW.R_STATUS IS '�ı��������';
--------------------------------------------------
--------------     ��û ����       ------------------   
--------------------------------------------------
CREATE TABLE APPLICATION (
   B_NO NUMBER,
   M_ID VARCHAR2(50) NOT NULL,
   A_STATUS VARCHAR2(1CHAR) DEFAULT 'N',
    
    CONSTRAINT FK_BOARD_TO_APPLICATION FOREIGN KEY (B_NO) REFERENCES BOARD (B_NO)
);

    COMMENT ON COLUMN APPLICATION.B_NO IS '�Խñ۹�ȣ';
    COMMENT ON COLUMN APPLICATION.M_ID IS '��û�ھ��̵�';
    COMMENT ON COLUMN APPLICATION.A_STATUS IS '��û��ҿ���';

--------------------------------------------------
----------------   VIEW ����	   -------------------	
--------------------------------------------------

-- �����̹��� ����Ʈ VIEW
CREATE OR REPLACE VIEW MAINIMAGELIST
AS
SELECT ROWNUM RNUM,MAINIMAGELIST.*
FROM (SELECT *
        FROM BOARD 
        JOIN FILES USING(B_NO)
    WHERE B_STATUS='N' AND B_CATEGORY='�����̹���'
    ORDER BY B_NO DESC) MAINIMAGELIST
WHERE F_STATUS ='N'

--slist VIEW
create or replace view slist
    as
    select *
    from (select b_no, m_id, b_title, b_content, b_category, b_date, b_modifydate, b_status
         ,s_status, s_address, s_stock
        from board
        join shares using(b_no));

--------------------------------------------------
--------------  ���� ������ ���� ���� ---------------   
--------------------------------------------------

-- INSERT MEMBER 
INSERT INTO MEMBER VALUES('admin', '$2a$10$8S3kn/iSZ/MmSj8.9MeIwOaU5JbmGTwJ.qu6X1v5ABJtmAaLURI2O', default, '���', '����', '90/01/01' , 'M', '����Ư���� ������', 'admin@nate.com' , '010-1234-5678', '�ڿ�' , '������' , default,  'admin', NULL);
INSERT INTO MEMBER VALUES('user01', '$2a$10$LaC5PBDXrXU4w.smNlO4uecCdG6GjbubUmaKl2Di/hbcRSQPYD8di', default, '������', '����1', '90/02/02' , 'M', '����Ư���� ������', 'user1@nate.com' , '010-1234-5678', '�ڿ�' , 'ȸ��' , default,  'user', NULL);


-- INSERT BOARD, QUESTION
insert into board values(SEQ_BOARD_NO.nextval, 'admin', '����� �󸶳� �ɸ�����?', '����� �����ڰ� �ֹ� Ȯ�� �� ���� ����� �ϴ� �ý����Դϴ�.
���� �ֹ��Ϸ� �� 2,3�� �Ŀ� ����غ� �����Ͽ� �� ������ �̳��� ��ǰ�� �޾ƺ��� �� �ֽ��ϴ�.', '���ֹ�������', sysdate, sysdate, 'N');

insert into board values(SEQ_BOARD_NO.nextval, 'admin', '��ǰ������ �������ΰ���?', '��ǰ������ ���������� �����ް� ������, 
����Ͻ� ���� ����� �߰��� ���� �����մϴ�.', '���ֹ�������', sysdate, sysdate, 'N');

insert into question values(SEQ_BOARD_NO.currval, '��ǰ�ǸŹ���');

insert into question values(SEQ_BOARD_NO.currval, '��ǰ��������');

Insert into BOARD (B_NO,M_ID,B_TITLE,B_CONTENT,B_CATEGORY,B_DATE,B_MODIFYDATE,B_STATUS) values (SEQ_BOARD_NO.nextval,'admin','�ε���Ȱü���� �ܰ� �� �ǳ� û��','�� ���� : ü���� �ֺ� �ܰ�û��(������, ����&��������) �� ü���� ����(ȭ���, �ްԽ� ��) ����û�� �� �̿��� ����ũ ���� �ȳ�
�� �ڿ�����ð� : 17:00~21:00 (�Ϸ� 4�ð� ����) 
�� ������� : ���������� ���� ������ 669-13 �ε���Ȱü����(ī����)
�� ����ó : 042-221-5038
�� ��û �� ���� �� �� ��û�� ��ƽ��ϴ�!(���� �� ���� ��Ź�帳�ϴ�.)','����Ȱ��',to_date('20/12/02','RR/MM/DD'),to_date('20/12/02','RR/MM/DD'),'N');
Insert into GREEN.VOLUNTEER (B_NO,V_DAY,V_TIME,V_LOCATION,V_AGENCY,V_RECRUITMENT,V_APPLICANT,V_RESPONSIBILITY,V_PHONE) values (SEQ_BOARD_NO.CURRVAL,'2020-12-05~2020-12-27','17:31~21:00','���� ���� ������ 669-13/�ε�ü����','���������� ����',4,0,'�̿�',102215038);
Insert into BOARD (B_NO,M_ID,B_TITLE,B_CONTENT,B_CATEGORY,B_DATE,B_MODIFYDATE,B_STATUS) values (SEQ_BOARD_NO.nextval,'admin','�ѱ��ؾ�ҳ�����Ͽ����Ʒ���','�ѱ��ؾ�ҳ�����Ͽ����Ʒ��� ȯ�溸ȣ, ��ȭ�۾�, �ϼ�����
��,��,�� �л��� ���� ���� 4�ð� ����
��,����,�Ϲ����� ��Ȳ������ 8�ð� ����
���� ��ü�� �������� ����','����Ȱ��',to_date('20/12/02','RR/MM/DD'),to_date('20/12/02','RR/MM/DD'),'N');
Insert into GREEN.VOLUNTEER (B_NO,V_DAY,V_TIME,V_LOCATION,V_AGENCY,V_RECRUITMENT,V_APPLICANT,V_RESPONSIBILITY,V_PHONE) values (SEQ_BOARD_NO.CURRVAL,'2020-09-26~2020-12-25','09:35~18:35','���� ����� ������ 107/�Ʒ���','����ϵ� �����',10,0,'�迵',104660953);
Insert into BOARD (B_NO,M_ID,B_TITLE,B_CONTENT,B_CATEGORY,B_DATE,B_MODIFYDATE,B_STATUS) values (SEQ_BOARD_NO.nextval,'admin','�����������»��н�����','��Ȱ������
��Ȱ���ð� : ���� 10�� ~ 12��
12�� 5��(��), 12�� 12��(��), 12�� 19��(��), 12�� 26��(��)
��Ȱ�����: �������������н�����
���ο�: 1999��� ���� ����� 25��
��Ȱ������
- ������ Ү ������ ������ ������ �����ϴ� �۾�
- ������ ������ ����ҷ� ��� �� �����۾�


�����ǻ���
1) ����ȭ �Ǵ� AI�� ���� ������ �������� �� Ȱ���� ��� �� �� �ֽ��ϴ�.
2) �湮 �� ü���� üũ�ϸ� �̻��� �߰ߵ� �� �Ͱ���ġ�մϴ�. ���� �湮�� ����ũ�� �ʼ��� �������ֽñ� �ٶ�� ���������� ö���Ͽ� �ֽñ� �ٶ��ϴ�.
3) ��üȰ�� ������ �����Ƿ� ��û�Ͻôµ� �� �� ����Ͽ� ��û���ֽñ� �ٶ��ϴ�.','����Ȱ��',to_date('20/12/02','RR/MM/DD'),to_date('20/12/02','RR/MM/DD'),'N');
Insert into GREEN.VOLUNTEER (B_NO,V_DAY,V_TIME,V_LOCATION,V_AGENCY,V_RECRUITMENT,V_APPLICANT,V_RESPONSIBILITY,V_PHONE) values (SEQ_BOARD_NO.CURRVAL,'2020-12-05~2020-12-26','10:37~00:37','���� ������ �������4���� 46/�����������»��н�����','����Ư���� ������',25,0,'����',107132835);
Insert into BOARD (B_NO,M_ID,B_TITLE,B_CONTENT,B_CATEGORY,B_DATE,B_MODIFYDATE,B_STATUS) values (SEQ_BOARD_NO.nextval,'admin','����ķ������ �ȳ� �� ȯ����ȭ','���ѹ̱� ���� ��ȯ�� ���� ķ������ �������� ���Ͽ� ������ �ü� �̿��� ���Ͽ� �ȳ� �� �������(û��, �������� ��) �����ڸ� �����մϴ�.

- �Ͻ� : �ָ� �� ������, 13:00~17:00

- ��� : ����ķ������ ���� ���� (���� ��487-1, ������� ������ ������) 

- ��� : ķ�����Ͽ� ������ �ִ� ����л�, ���л�, ���� ������

- ���� : ķ������ �̿밴 �ȳ�, ȯ����ȭ , �������� ��

- ���� : �����ڿ����缾�� ����� 032-509-8770
           (���� 9:00~18:00 ��� ���� / ���ɽð� 12:00~13:00 ��ȭ �Ұ�)

�� ���ǻ���(�ʵ�) ��
 - �����ð���ŭ�� ����ð� ����(���� �� �ش�ð���ŭ ����ð� ����) 
 - �� ������ �и� ��û ���(��û �� ���� �� ���� �����û ���ѵ� ����)','����Ȱ��',to_date('20/12/02','RR/MM/DD'),to_date('20/12/02','RR/MM/DD'),'N');
Insert into GREEN.VOLUNTEER (B_NO,V_DAY,V_TIME,V_LOCATION,V_AGENCY,V_RECRUITMENT,V_APPLICANT,V_RESPONSIBILITY,V_PHONE) values (SEQ_BOARD_NO.CURRVAL,'2021-01-01~2021-01-31','13:42~17:42','��õ ���� �� 48-7/������� ������ ������','��û������ ����',6,0,'���',105098770);
Insert into BOARD (B_NO,M_ID,B_TITLE,B_CONTENT,B_CATEGORY,B_DATE,B_MODIFYDATE,B_STATUS) values (SEQ_BOARD_NO.nextval,'admin','��������� �� ȯ����ȭ Ȱ��','* ���� 1�� ���� �ð��Դϴ�. 
 (���� 1�ñ��� ��������� �����繫�ҷ� ���ż� Ȱ�� ���� Ȯ�� �� ����Ȱ�� �����Ͻø� �˴ϴ�.
 (Ȱ�� ���� �Ŀ��� �����繫�ҿ��� ���� Ȯ�� �����ž� �մϴ�.)

* ����ũ ������ �� ��Ź�帳�ϴ�. �ڷγ� ������ �ǽɵ� ��� �����ϼŵ� �˴ϴ�. 
���� ������ �� �ּŵ� �˴ϴ�.

* �����, �Ͽ��� ����Ȱ�� ��û�� ����Ȱ�� �ش� �� ����ϱ��� ������ �Ϸ��ϼž� �մϴ�.
(���Ŀ� ��û���� ���� ��ġ�� ������� �־� ��û�� �ݷ����� ���� ��Ź�帳�ϴ�.)

* �ָ� ����Ȱ�� �� ����ð� ����� ���� �� ���߿� �����Ͽ��� 
����Ȱ�� �ð��� �ñ��ϰ� �ʿ��Ͻ� ���� �� ���� �����Ͽ� �ֽñ� �ٶ��ϴ�.

* ���尩�� ���� ��Ź�帳�ϴ�.(���������, ���� ����)
','����Ȱ��',to_date('20/12/02','RR/MM/DD'),to_date('20/12/02','RR/MM/DD'),'N');
Insert into GREEN.VOLUNTEER (B_NO,V_DAY,V_TIME,V_LOCATION,V_AGENCY,V_RECRUITMENT,V_APPLICANT,V_RESPONSIBILITY,V_PHONE) values (SEQ_BOARD_NO.CURRVAL,'2020-11-28~2020-12-27','13:57~18:57','�泲 ���걺 ������ ��������� 161/���������','�������� ���걺',10,0,'�̹�',103398286);
Insert into BOARD (B_NO,M_ID,B_TITLE,B_CONTENT,B_CATEGORY,B_DATE,B_MODIFYDATE,B_STATUS) values (SEQ_BOARD_NO.nextval,'admin','ȯ����ȭȰ��','���� �� ������ �ݱ�, ���� ����
�ǳ� û��','����Ȱ��',to_date('20/12/02','RR/MM/DD'),to_date('20/12/02','RR/MM/DD'),'N');
Insert into GREEN.VOLUNTEER (B_NO,V_DAY,V_TIME,V_LOCATION,V_AGENCY,V_RECRUITMENT,V_APPLICANT,V_RESPONSIBILITY,V_PHONE) values (SEQ_BOARD_NO.CURRVAL,'2020-11-11~2020-12-31','09:59~18:00','���� ���� �뵿�� �е��� 1398-77/�ڿ����°���','���󳲵� ����',10,0,'�ڼ�',103202857);
Insert into BOARD (B_NO,M_ID,B_TITLE,B_CONTENT,B_CATEGORY,B_DATE,B_MODIFYDATE,B_STATUS) values (SEQ_BOARD_NO.nextval,'admin','��̹ٴٰ��а� �ǳ��� ȯ������','"�ʵ�" 
1. ����Ȱ�� ����ڴ� �Ƶ�, û�ҳ��Դϴ�.
2. �¶��� ������ �ִ� ���� ����Ȱ�� �Ұ��մϴ�.','����Ȱ��',to_date('20/12/02','RR/MM/DD'),to_date('20/12/02','RR/MM/DD'),'N');
Insert into GREEN.VOLUNTEER (B_NO,V_DAY,V_TIME,V_LOCATION,V_AGENCY,V_RECRUITMENT,V_APPLICANT,V_RESPONSIBILITY,V_PHONE) values (SEQ_BOARD_NO.CURRVAL,'2020-11-01~2020-12-31','10:03~13:03','���� ������ ���з�92���� 98/������̹ٴٰ��а�','���󳲵� ������',3,0,'����',102708882);
Insert into BOARD (B_NO,M_ID,B_TITLE,B_CONTENT,B_CATEGORY,B_DATE,B_MODIFYDATE,B_STATUS) values (SEQ_BOARD_NO.nextval,'admin','Ŭ���� �����°��� ȯ����ȭȰ��','�� ��� : ������ �����ϴ� û�ҳ� �ڿ�������(�ʵ��л�~����л�)
�� ��û �� Ȱ�� �Ⱓ : ���������� ����!
�� �Ϸ翡 ���������� 2�� û�� �� 1�ð� ����!  (��, 1�� �ִ� 1�ð� ����, �� �� �ִ� 4�ð� ����)
�� ��ü Ȱ�� �� ���������� �� ���� 3�� ���ϸ� ����!   (������ ���� ���� ��� / ��ü�� ��� ��ü ���� ��� Ȱ��)
�� Ȱ����� : ��õ ���� ���� ����������
�� Ȱ�� ���
  1. Ȱ�� �� : 1365���� �ڿ������û
  2. Ȱ�� �� : ���Կ� ��ȸ�� �尩, ���������, ī�޶� �� ���� �����Ͽ� Ȱ�� ����!
    (Ȱ�� ������ ����, ���ΰ� ������ ����, ������1�� �ʼ�, ������� ������ �������� �и�����)
  3. Ȱ�� �� : ���� ��� �ٿ�޾�(÷������) ���� ÷���Ͽ� seogu-center@hanmail.net �� �ۺ�
     �� ������ ��Ŭ���� ����_�̸��� ���� ����','����Ȱ��',to_date('20/12/02','RR/MM/DD'),to_date('20/12/02','RR/MM/DD'),'N');
Insert into GREEN.VOLUNTEER (B_NO,V_DAY,V_TIME,V_LOCATION,V_AGENCY,V_RECRUITMENT,V_APPLICANT,V_RESPONSIBILITY,V_PHONE) values (SEQ_BOARD_NO.CURRVAL,'2020-10-26~2020-12-26','07:17~21:17','��õ ���� ��������202���� 6/���� ���� �����°���','��õ������ ����',30,0,'����',105681365);
Insert into BOARD (B_NO,M_ID,B_TITLE,B_CONTENT,B_CATEGORY,B_DATE,B_MODIFYDATE,B_STATUS) values (SEQ_BOARD_NO.nextval,'admin','���������⸦ ���� �ڿ������� ����','Ȱ������ 
 1.  �����������⸦ ���� �Ÿ� ���ð�� ����
 2. �ڿ������ڵ��� ������ ������ Ư���ִ� ���μ��� ����
 3. �ܿ����� ��ȣ �� ����ڸ꿡 ����

- ���������ð�: �ִ� 4�ð�(�ǳ� �� �ǿ�Ȱ��), ���� �� �Ļ� ������.
- ����Ȱ���ð�: 10.19-12.19(�Ͽ��� ����)

- �غ�:  �����ʴ� �ܿ� ��Ʈ��(�β��� ���Ǹ�), ����ũ����, 

*������û �� �������ڹ߼��ϸ� ���ε� ������� ����Ȱ�� ���� ����*
*�ڷγ�19�� �ּ��ο��� �����ϸ� ö���� �濪(��ü �濪�⸦ Ȱ���� ���� �濪, �ռҵ���, QR�ڵ� üũ)�� �⺻���� �Ͽ� �ڿ�����Ȱ���� �ǽ��մϴ�*
','����Ȱ��',to_date('20/12/02','RR/MM/DD'),to_date('20/12/02','RR/MM/DD'),'N');
Insert into GREEN.VOLUNTEER (B_NO,V_DAY,V_TIME,V_LOCATION,V_AGENCY,V_RECRUITMENT,V_APPLICANT,V_RESPONSIBILITY,V_PHONE) values (SEQ_BOARD_NO.CURRVAL,'2020-10-21~2020-12-19','10:19~18:20','��õ ������ ������� 712/���������� 106ȣ','��õ������ ������',5,0,'����',1023469533);
Insert into BOARD (B_NO,M_ID,B_TITLE,B_CONTENT,B_CATEGORY,B_DATE,B_MODIFYDATE,B_STATUS) values (SEQ_BOARD_NO.nextval,'admin','�ڷγ�-19 ������ �濪��Ģ ��Ű��','�ű�6�� �ֹμ��� �ڷγ�-19 ������ �濪��Ģ ��Ű�� �ڿ������ڸ� �Ʒ��� ���� �����մϴ�.
0. Ȱ���Ͻ� : 2020.12.01. ~ 12.31(���� 1��)
0. Ȱ���ð� : 14:00 ~ 18:00
0. Ȱ����� : �ű�6�� �ֹμ���
0. �����ο� : 1�� /1��(�ߺ���û ����)
0. Ȱ������
  - ������ �߿�����ī�޶� üũ, �ڷγ�19 �����Ģ �ؼ����� �ȳ� ��','����Ȱ��',to_date('20/12/02','RR/MM/DD'),to_date('20/12/02','RR/MM/DD'),'N');
Insert into GREEN.VOLUNTEER (B_NO,V_DAY,V_TIME,V_LOCATION,V_AGENCY,V_RECRUITMENT,V_APPLICANT,V_RESPONSIBILITY,V_PHONE) values (SEQ_BOARD_NO.CURRVAL,'2020-12-01~2020-12-31','14:21~18:21','���� �������� �ű浿 3741-11/�ֹμ���','����Ư���� ��������',1,1,'���',1026701340);
Insert into BOARD (B_NO,M_ID,B_TITLE,B_CONTENT,B_CATEGORY,B_DATE,B_MODIFYDATE,B_STATUS) values (SEQ_BOARD_NO.nextval,'admin','���� ���峪�� ����','Ȱ�� ����
- �Ѱ��� ������ �����뿡 ���� �˾ƺ��� �Բ� ���� ���峪�� ���� ���پ��.
- ���� ������ ���°豳�� �Ĺ��� ���� �˾ƺ��� �Բ� ���� ���پ��.
- ���°豳�� �Ĺ� ����
- ���� �ɱ�� ���ٱ� (�� �ֱ� ��)
- ȯ�� ��ȭ Ȱ��

�Ͻ�: ���� ���� 2�� ~ 5��
���: ���ǵ��������°��� �湮�ڼ���(���ǻ�������ü���)
�غ�: Ȱ���ϱ� ���� ����, �Һ�, ����, ����ũ
*Ȱ�� ���� ���� ���簡 �ֽ��ϴ�.
����: ��ȸ���������� �Ѱ� 070-4647-0825
1. �ڿ������� ����ũ ���� 2. �ڿ������� �� 2m ���� ����','����Ȱ��',to_date('20/12/02','RR/MM/DD'),to_date('20/12/02','RR/MM/DD'),'N');
Insert into GREEN.VOLUNTEER (B_NO,V_DAY,V_TIME,V_LOCATION,V_AGENCY,V_RECRUITMENT,V_APPLICANT,V_RESPONSIBILITY,V_PHONE) values (SEQ_BOARD_NO.CURRVAL,'2020-10-05~2020-12-19','14:23~17:23','���� ���α� �����ȷ� 92/1803ȣ','����Ư���� ���α�',9,0,'���',1044051156);
Insert into BOARD (B_NO,M_ID,B_TITLE,B_CONTENT,B_CATEGORY,B_DATE,B_MODIFYDATE,B_STATUS) values (SEQ_BOARD_NO.nextval,'admin','���ȯ�湮ȭ�','�ڷγ� 2.0 ��ġ�� ���� ����Ȱ�� �ð���ȹ�� �ε��� ����Ǿ����ϴ�
* 28���� ���� 10�� ����~ ����Ȱ�� �ǽ��մϴ�(20��)
* ���κ� ��ü���� �ǽ��ϴ� �������� ȯ�汳�� 2�ð� �ʼ��̸� �� ��ȭ�� ����Ȱ�� ���ڿ� �ð� Ȯ���Ͻñ� �ٶ��ϴ�
1. ȯ����� ������ �� Ȱ����ȹ ����(û��/���������� ��ī�̺ҷ�) ��(�����ο�10��) 
2. ȫ�� ������, ȫ����ȹ ������Ʈ ������ (�����ο�10��)
3. �ڷγ�19 �� ���ð���� �ع����� Ȯ���� ���� �ҹ����ܱ��� ������ ���� ȫ��, ķ����(�ڷγ��� ������� ���� / �̸����� ���� ���� 20��)
4. ����ö���� �� ��Ÿ� ȫ��ķ����(�������� �� ���� �� �����ս� ��) (���� 10��)
5. û�� : ��������(û�Һ񿵸����� ��������(�繫, ���, â�� ��ǰ���� ��  5��','����Ȱ��',to_date('20/12/02','RR/MM/DD'),to_date('20/12/02','RR/MM/DD'),'N');
Insert into GREEN.VOLUNTEER (B_NO,V_DAY,V_TIME,V_LOCATION,V_AGENCY,V_RECRUITMENT,V_APPLICANT,V_RESPONSIBILITY,V_PHONE) values (SEQ_BOARD_NO.CURRVAL,'2020-11-18~2020-12-30','10:24~17:24','���� �������� ����� 28/ȯ�������� NPO����','����Ư���� ��������',20,0,'�ֺ�',103383499);
Insert into BOARD (B_NO,M_ID,B_TITLE,B_CONTENT,B_CATEGORY,B_DATE,B_MODIFYDATE,B_STATUS) values (SEQ_BOARD_NO.nextval,'admin','������ �ݱ� ���� Ȱ��','�� �ݰ� ��������� ��ġ�� �ݻ걺 �ߺθ� ��ǳõ �ϴ� ���������� ������ ���� ������ �ݱ� ���� �Դϴ�.
�� ���� ��� : �ߺθ� ��ǳõ �ϴ� 
�� ���� ��ġ : �ߺ� �ʵ��б� ���� (��û���� �ݻ걺 �ߺθ� �ϸ����� 23) 
�� Ȱ�� �ð� : ���� 10 : 00 ~ 13 : 00 (3�ð�)

������ ������ ���� ������ �� �ִ� ���� Ȱ���Դϴ�! 
�� ���, �� ����� �ձ��� �츮�� ������ �ݻ��� ����ϴ�^^ ���� ���� ��Ź�帳�ϴ�.


�� ����ũ�� �ʼ��� �ϰ� ���ñ� �ٶ��ϴ�! ��



�� ���ǻ��� : ����� ������ / 010-8990-4958','����Ȱ��',to_date('20/12/02','RR/MM/DD'),to_date('20/12/02','RR/MM/DD'),'N');
Insert into GREEN.VOLUNTEER (B_NO,V_DAY,V_TIME,V_LOCATION,V_AGENCY,V_RECRUITMENT,V_APPLICANT,V_RESPONSIBILITY,V_PHONE) values (SEQ_BOARD_NO.CURRVAL,'2020-12-12~2020-12-12','10:56~03:57','�泲 �ݻ걺 �ߺθ� �ϸ����� 23/�ߺ��ʵ��б�','��û���� �ݻ걺',30,0,'����',102384953);










