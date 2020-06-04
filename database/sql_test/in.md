# 루시와 엘라 찾기

문제 링크: https://programmers.co.kr/learn/courses/30/lessons/59046

## 설명

1) **IN**(value1, value2 ...)<br>
2) 문자열 '---'


## 코드

```sql
SELECT ANIMAL_ID, NAME, SEX_UPON_INTAKE
FROM ANIMAL_INS
WHERE NAME IN ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty')
ORDER BY ANIMAL_ID;
```
