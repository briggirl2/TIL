# SQL JOIN

## JOIN (조인)

관계형 데이터베이스에서 중복을 피하기 위해 데이터들을 여러 테이블에 나누어 저장한다.<br>
이 테이블들 중에서 관계가 있는 하나 이상의 테이블을 연결하여 원하는 데이터를 검색하기 위해 JOIN을 사용한다.<br>
- 보통 테이블 사이에 관련있는 column(주로 primary key나 foreign key)을 사용해서 join을 실행한다.

### JOIN의 종류
- Inner Join
	- Cartesian Product (Cross Join)
	- Equi Join
	- Non-Equi Join
- Self Join
- Outer Join

## Cartesian Product (카티션 곱, Cross Join)

모든 가능한 행들의 조합(JOIN)으로 조인에 사용된 테이블들의 모든 데이터가 반환된다.

### Cartesian Product가 발생하는 대표적 경우
- 조인 조건을 정의하지 않은 경우
- 조인 조건이 잘못된 경우
- 첫 번째 테이블의 모든 행들이 두 번째 테이블의 모든 행과 조인되는 경우

## Equi Join (동등 조인)
조인 조건에서 '='을 사용해서 값들이 정확하게 일치하는 경우에 사용하는 조인.

## Non-Equi Join (비등가 조인)
조인 조건에 '=' 이외의 연산자(BETWEEN AND, IS NULL, IN 등)을 사용하는 조인.

## Self Join (셀프 조인)
자기 자신과 하는 조인 (ex) 각 직원의 관리자 정보 검색

## Outer Join (외부 조인)
- 정상적으로 조인 조건을 만족하지 못하는 행들을 보기 위해 Outer Join을 사용한다.
- Outer Join의 연산자는 표현식의 한 편에만 사용한다. 조인시킬 값이 없는 측에 (+)
- Outer Join은 IN 연산자를 사용할 수 없고 OR 연산자에 의해 다른 하나의 조건에 연결될 수 없다.
