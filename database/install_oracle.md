# MAC에 Oracle DB 설치하기

### 1. docker 설치하기<br>
<a href="https://velog.io/@stampid/Docker%EB%9E%80">Docker란?</a><br>

**Tip!!**<br>
도커에서 프로그램(컨테이너)을 실행시킨 다음 생성된 데이터는 프로그램(컨테이너)을 종료하면 저장되지 않고 사라진다.<br>
그렇기 때문에 oracle을 docker로 사용하려면 -v 옵션으로 데이터를 프로그램(컨테이너)외부에 저장해야 한다.<br>
이때 컨테이너의 외부에 저장한다는 것은 나의 맥북에 저장하는 것을 말한다.
  

### 2. oracle 설치
<a href="https://banbanmumani.github.io/2018/01/05/osx%EC%97%90%EC%84%9CoracleDB%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0/">
맥(osx)에서 oracle DB 사용하기</a><br><br>
  
> \> docker search oracle-12c

![image](https://user-images.githubusercontent.com/40483081/77932485-9110d500-72e8-11ea-9121-3a5cc9e7acb9.png)

> \> docker run --name oracle12c -d -p 8080:8080 -p 1521:1521 -v /Users/suhyun:/u01/app/oracle truevoly/oracle-12c

- --name 옵션으로 컨테이너의 이름을 지정한다.
- -v 옵션을 통해서 두 디렉토리를 연결한다.<br>
이 경우, /Users/suhyun은 컨테이너 디렉토리이고 /u01/app/oracle은 호스트 디렉토리이다.<br>


> \> docker logs -f oracle12c

- 오라클 초기화

> \> lsof -PiTCP -sTCP:LISTEN

- 포트 확인

### 3. sqlplus 접속

> \> docker exec -it oracle12c sqlplus

- 초기 로그인 : (username: system), (password: oracle)
- SQL> conn sys as sysdba; // sys 계정으로 로그인
- SQL> create user user_id identified by user_pw // user 생성
- SQL> grant connect, resource to user_id
- SQL> GRANT UNLIMITED TABLESPACE TO user_id; // 나중에 ORA-01950: no privileges on tablespace 에러가 나면.
- SQL> conn user_id/user_pw // user_id 계정으로 로그인
