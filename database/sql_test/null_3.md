# NULL 처리하기

문제 코드: https://programmers.co.kr/learn/courses/30/lessons/59410

## 풀이

**IFNULL(column_name, null일 경우 값)**


## 코드

**MYSQL**

```sql
SELECT ANIMAL_TYPE, IFNULL(NAME,'No name'), SEX_UPON_INTAKE
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;
```
