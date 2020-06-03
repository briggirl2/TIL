# 없어진 기록 찾기

문제 링크: https://programmers.co.kr/learn/courses/30/lessons/59042

## 설명

**"LEFT OUTER JOIN"** <br>
왼쪽 테이블은 무조건 조회되며, 오른쪽 테이블은 조건과 일치하는 것만 조회.<br>
이 때 오른쪽 테이블에 일치하는 것이 없으면 NULL 값으로 처리되어서 들어온다.

## 코드

**MYSQL**<br><br>
방법1) 조인 사용
```sql
SELECT O.ANIMAL_ID, O.NAME
FROM ANIMAL_OUTS O
LEFT OUTER JOIN ANIMAL_INS I
ON O.ANIMAL_ID=I.ANIMAL_ID
WHERE I.ANIMAL_ID IS NULL
ORDER BY O.ANIMAL_ID;

```

방법2) distict 사용
```sql
SELECT ANIMAL_ID, NAME 
FROM ANIMAL_OUTS 
WHERE ANIMAL_ID NOT IN (
    SELECT DISTINCT ANIMAL_ID 
    FROM ANIMAL_INS
);
-- https://mentha2.tistory.com/67
```

## 참고

https://it-jin-developer.tistory.com/40 <br>
