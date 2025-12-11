# 3. 성능을 좌우하는 DB 설계

“DB 성능에 문제가 생기면 전체 서비스에 영향을 준다.”

즉 DB에 부하가 생기면 DB에 연결된 모든 서버의 응답 시간을 증가시키고 이는 다시 클라이언트에 영향을 준다.

## 조회 트래픽을 고려한 인덱스 설계

1. 단일 인덱스와 복합 인덱스
2. 선택도
    1. 인덱스에서 특정 컬럼의 고유한 값 비율
3. 커버링 인덱스 활용
    1. 커버링 인덱스 특정 쿼리를 실행하는 데 필요한 컬럼을 모두 포함하는 인덱스
    2. ex)
    
    ```sql
    select activityDate, activityType
    from activityLog
    where activityDate = '2024-07-31' and activityType = 'VISIT'
    ```
    
4. 인덱스 필요한 만큼만 만들기
    1. 너무 많은 인덱스를 만들면 인덱스 관리에 따른 비용(시간) 추가된다. 인덱스도 데이터이기 때문에 메모리, 디스크 사용량도 함께 증가한다.
    2. 같은 컬럼에 대한 인덱스 또 추가하지 말자. 인덱스 추가 전에 기존에 어떤 인덱스가 존재하는지, 동일한 효과를 낼 수 있는 다른 인덱스가 있는지 사전 검토 필요
    3. 사전 검토 방법
        
        [인덱스 사전 검토 유용한 방법](3%20%EC%84%B1%EB%8A%A5%EC%9D%84%20%EC%A2%8C%EC%9A%B0%ED%95%98%EB%8A%94%20DB%20%EC%84%A4%EA%B3%84/%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EC%82%AC%EC%A0%84%20%EA%B2%80%ED%86%A0%20%EC%9C%A0%EC%9A%A9%ED%95%9C%20%EB%B0%A9%EB%B2%95%202c63e0fc1ac7803a8f84f041aff2c74c.md)
        

## 조회 성능 개선 방법

“평소에 APM으로 응답시간을 파악하고 있다가 살짝 올라간 것을 발견할 수 있으면 조기에 발견 가능”

1. 미리 집계하기
2. 페이지 기준 목록 조회(offset 사용) 대신 ID 기준 목록 조회 방식 사용하기
    1. ex) DB에서 어떤 id 값이 990인지 모르기 때문에 id를 역순으로 990까지 세고 나서 10개 데이터 조회한다. 차라리 where id > ~ 이런식으로 id 사용 권장
    
    ```sql
    select id
    from article
    order by id desc
    limit 10 offset 990
    ```
    
3. 조회 범위를 시간 기준으로 제한하기
4. 전체 개수 세지 않기
5. 오래된 데이터 삭제 및 분리 보관하기
    1. 단편화의 최적화
        1. 단편화(fragmentation)? 데이터가 반복적으로 추가/변경/삭제되는 과정에서 데이터가 흩어져 저장되고 빈 공간이 생기는 현상 → 디스크 IO 증가, 디스크 낭비, 쿼리 성능 저하
        2. 단편화 최적화 방법
            
            [단편화 최적화 방법](3%20%EC%84%B1%EB%8A%A5%EC%9D%84%20%EC%A2%8C%EC%9A%B0%ED%95%98%EB%8A%94%20DB%20%EC%84%A4%EA%B3%84/%EB%8B%A8%ED%8E%B8%ED%99%94%20%EC%B5%9C%EC%A0%81%ED%99%94%20%EB%B0%A9%EB%B2%95%202c63e0fc1ac780058fc4f4645ba49d8e.md)
            
6. DB 장비 확장
    1. scale up (수직 확장)
    2. primary DB - Replica DB 구조 사용
        1. 주로 데이터 변경은 primary, 조회는 replica에서.
        2. 상태 변경을 위한 조회라면 primary에서.
7. 별도 캐시 서버 구성하기
    1. ex) redis 

## DB 관련 주의사항

1. 쿼리 타임아웃은 서비스와 기능의 특성에 맞게 설정.
2. 상태 변경 기능은 replica DB에서 조회하지 않기.
    1. select더라도 변경을 위한 select은 primary에서.
3. 배치 쿼리 실행 시간 증가시
    1. 커버링 인덱스 활용
    2. 데이터를 일정 크기로 나눠 처리
4. 타입이 다른 컬럼 조인 주의
    1. ex) 타입을 변환해 두 칼럼의 타입을 일치시킨 후 비교해야한다.
    
    ```sql
    select u.userId, u.name, p.*
    from user u, push p
    where u.userId = 145 
     and case(u.userId as char character sest utf8mb4) collate 'utf8mb4_unicode_ci' = p.receiverId 
     and p.receiverType ='MEMBER'
    order by p.id desc
    limit 100;
    ```
    
5. 테이블 변경은 신중해야한다.
    1. DB의 테이블 변경 방식 때문이다.
    2. ex) MySQL은 테이블 변경할 때 새 테이블 생성하고 원본 데이터를 복사한 뒤, 복사가 완료되면 새 테이블로 대체한다. 이 복사 과정에서 DML(update, insert, delete) 허용 안한다.
    3. 보통은 서비스를 잠시 중단한 뒤 변경 작업을 수행하는 것이 가장 안정적.
6. DB 최대 연결 개수
    1. ex) API 서버의 커넥션 풀 30, 서버 4개 → 필요한 커넥션 수는 120. 이 때 DB의 최대 연결 개수 120 이상이여야한다.
    2. 무작정 DB 최대 연결 개수 늘리기보다 캐시 서버 구성이나 쿼리 튜닝 같은 조치도 고려해야한다.

## 실패와 트랜잭션 고려하기

- 보통은 일부 기능에서 오류가 발생하면 전체 트랜잭션을 롤백한다.
- 상황에 따라 트랜잭션 범위 고려해야한다.
    - ex)
    
    ```java
    @Transactional // for transaction
    public void join(JoinRequest join) {
    	...
    	memberDao.insert(member); // add data to DB
    	try {
    		mailClient.sendMail(...); // send mail
    	} catch (Exception ex) {
    		// ignore "send mail" error
    		// log for monitoring
    	}
    }
    ```