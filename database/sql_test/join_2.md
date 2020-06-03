# 있었는데요 없었습니다.

문제 링크: https://programmers.co.kr/learn/courses/30/lessons/59043

## 설명

**INNER JOIN** : 교집합

## 코드

**MYSQL**

```sql
SELECT I.ANIMAL_ID, I.NAME
FROM ANIMAL_INS I 
INNER JOIN ANIMAL_OUTS O
ON I.ANIMAL_ID=O.ANIMAL_ID
WHERE I.DATETIME>O.DATETIME
ORDER BY I.DATETIME;
```
