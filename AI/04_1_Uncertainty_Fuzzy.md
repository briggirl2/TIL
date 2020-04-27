# 04_1.Uncertainty_Fuzzy

Created By: 수현 황
Last Edited: Apr 27, 2020 7:42 PM

# 불확실한 지식 표현

## 확률 기반 지식 표현

### 확률 (probability)

어떤 사건이 일어날 가능성

- 빈도주의 확률 (Frequentist probability)
: 모든 가능성을 지닌 경우의 수에 대한 원하는 경우의 수의 비
- 베이즈 확률 (Bayesian probability)
: 어떤 가설의 확률을 평가하기 위해 사전 확률을 먼저 밝히고 새로운 관련 데이터에 의한 새로운 확률값을 변경

### 결합 확률 (Joint probability)

- 사건 A와 B가 동시에 일어날 확률
- P(A∩B), P(A,B), P(AB)

### 조건부 확률 (Conditional probability)

- B가 일어났을 때 A가 일어날 확률
- P(A|B) *= P(A∩B) / P(B), P(B) > 0*

### 베이즈 정리 (Bayesian Theorem)

> P(A|B) = P(A∩B) / P(B) = P(B|A) P(A) / P(B)

결합 확률 P(A∩B)를 직접 구할 수 없기 때문에 가능도(*P(B|A)*)와 사전 확률(*P(A)*)을 이용하여 계산

---

## 퍼지 이론

### 퍼지 이론 (Fuzzy Theory)

애매함을 처리하는 수학 이론

추상적 개념(abstraction)이나 대략적 범위를 정하기에 유용

### 퍼지 집합 (Fuzzy Set)

[퍼지 집합 : 이광형. 오길록](http://www.aistudy.com/fuzzy/set_lee.htm#_bookmark_17724f0)

- **μA(x)**
전체 집합 X의 각 원소 x가 X의 퍼지 집합 A에 속하는 정도.
즉 퍼지 집합 A의 소속 함수(membership function).
*A = ∫ μA(x) / x    (0 ≤ μA(x) ≤ 1)*
- 퍼지 집합의 표현

    -  집합 x가 이산 : *A = {μA(x1)/x1, μA(x2)/x2, ... , μA(xn)/xn}*

    -  집합 x가 연속 : *A = ∫ (μA(x) / x)*

- **지지 집합 (Support Set)**
*Support(A) = {x ∈ X | μA(x) > 0}*
- **정규 퍼지 집합 (Normal Fuzzy Set)**
x ∈ X 중에서 적어도 하나의 원소가 퍼지 집합 A의 소속 함수 값이 1이 될 때, A는 정규 퍼지 집합이라 한다.
- **볼록 퍼지 집합 (Convex Fuzzy Set)**
- 상등
- 포함
- 퍼지 집합의 연산
합집합 → Max,  교집합 → Min, 여집합 → 1 - μA(x)


- **𝛼 - 컷**
A가 X의 퍼지 집합일 때 A의 𝛼 - 컷 집합은 소속 함수 값이 𝛼 이상인 원소로 구성

### 퍼지 수 (Fuzzy Number)

어느 퍼지집합이 **볼록 (convex)** 하고 **정규화 (normalized)** 되어 있으며 **실수** 에서 정의될 때 그 소속함수가 연속적 (piecewise continuous) 이면, 이 퍼지집합을 **퍼지숫자 (funny number)** 라고 부른다.

퍼지 수를 나타내는 퍼지 집합의 소속 함수

- 정규이고 볼록한 형태를 갖는 퍼지 집합
- 종형
- 삼각형
- 사다리꼴

### 퍼지 산술 (Fuzzy Arithmetic)

### 퍼지 이론의 응용

### 비퍼지화 (Defuzzification)

[퍼지 논리 제어 : Saeed B. Niku](http://www.aistudy.co.kr/robot/fuzzy_niku.htm#_bookmark_108f340)

퍼지 출력으로부터 하나의 명확한 제어 값이 필요한 경우 퍼지화와 반대되는 개념

- **무게 중심법**을 이용한 비퍼지화
