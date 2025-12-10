# 처리량과 응답시간

## 응답시간

- 요청을 처리하는 데 걸리는 시간
- 서버에 연결, 데이터 전송, 서버 실행 포함
- 응답시간이 왜 중요한가? Amazon에서 응답시간이 100ms 증가할때마다 매출이 1% 감소한다고 발표했다. 즉 응답시간이 증가하면 트래픽과 매출이 줄어든다. 사업에 주는 영향이 크다.

## 표현 종류

- TTFB (Time to First Byte)
- TTLB (Time to Last Byte)
- 전송할 데이터의 크기와 네트워크 속도가 느릴 경우, TTFB와 TTLB의 차이가 커질 수 있다.

## 서버 처리 시간의 구성 요소

- 로직 수행
- DB 연동
- 외부 API 연동
- 응답 데이터 생성(전송)

주로 DB 연동, 외부 API 연동이 요청 처리 시간의 큰 비중을 차지

---

## 처리량

- 단위 시간당 시스템이 처리하는 작업량

## 표시 방법

- TPS (transaction per second)
- RPS (request per second)

## TPS 높이는 방법

- 동시 처리량 늘려서 대기시간을 줄인다.
- 처리시간 자체를 줄인다.

## TPS  확인 방법

- 모니터링 시스템 사용
    - ex) 스카우터, 핀포인트, 뉴렐릭
    - 과거 시점의 TPS도 확인 가능
    - 주로 근사치 활용
- 정확한 TPS는 웹 서버 접근 로그 활용
    - 엘라스틱서치나 핀포인트 같은 별도 시스템에 접근 로그 수집해서 분석
    - 또는 직접 접근로그 파싱해서 TPS 계산. 리눅스 명령어와 코딩만으로 구현 가능.

---

## 요약

**성능개선을 위해서 우선적으로 트래픽 많은 시간의 TPS와 응답시간을 확인하자!** 

그 이후에 목표 TPS와 응답시간을 설정할 수 있을 것이다.

**TODO**

- pinpoint 적용해보기
    - https://guide.ncloud-docs.com/docs/pinpointcloud-use
    - https://dgjinsu.tistory.com/91
    - https://tech.trenbe.com/2022/02/22/pinpoint.html