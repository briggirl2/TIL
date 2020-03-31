# DDL (Data Definition Language)

데이터베이스 구조를 생성/ 수정/ 삭제하는 SQL명령의 부분집합<br>
ex) **CREATE TABLE, ALTER TABLE, DROP TABLE, RENAME TO**

### Oracle Data Type

- VARCHAR2(size): 문자데이터 동적 저장
- CHAR(size): 문자데이터 정적 저장
- NUMBER: 38자리 정밀도 부동 소수점 숫자 표현
- NUMBER(m,n): 소수점 이하 n자리, 소수점 포함 전체 m자리 표현
- DATE: 날짜,시간/ to_char(select), to_date(insert) 사용가능
- LONG: 2G까지의 가변 길이 문자데이터
- RAW(size): 번역되지 않는 byte, binary 데이터의 저장에 이용

### 테이블 구조보기
> DESCRIBE[DESC] table_name;

### 함께 사용 가능한 모든 테이블 보기
> SELECT * FROM TAB;

### 테이블 삭제
> DROP TABLE table_name;<br>
  purge recyclebin; (휴지통 비우기)

### 테이블 완전 삭제
> DROP TABLE table_name purge;

# DML (Data Manipulation Language)
application과 DBMS 사이의 통신 수단으로 데이터 처리 연산의 집합 (데이터 삽입,검색,삭제,변경 등)<br>
ex) **SELECT, INSERT INTO, UPDATE, DELETE FROM**

### 데이터 삽입
> INSERT INTO table_name [(column_name list)] VALUES (value list);

### 테이블의 원하는 컬럼 보기
> SELECT column1[,column2,...] FROM table_name;

### 테이블의 전체 레코드 보기
> SELECT * FROM table_name;

# SPOOL
### 오라클 화면(현재 SQL에서 수행되는 모든 내용)을 파일로 저장

### spool 명령어 이후의 화면을 filename.txt에 저장
> spool filename.txt;

### 저장된 스크립트 파일(print.txt)을 sqlplus 화면으로 출력
> get print.txt;

### 파일에 저장한 sql문을 실행
> start[또는 @] print.txt;

### 저장 완료
> spool off;
