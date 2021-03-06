# 컴파일러 개론

## 언어 처리기

**컴파일러**: <u>원시언어(Source language)</u>로 만들어진 프로그램을 읽어서 의미가 다른 언어<u>(목표언어: Target language)</u>로 번역하는 프로그램<br>

**인터프리터(interpreter)**: 원시 프로그램을 직접 실행해주는 프로그램<br>

**컴파일러와 인터프리터의 차이점** :<br>
<img width="585" alt="Screen Shot 2020-04-02 at 12 38 59 AM" src="https://user-images.githubusercontent.com/40483081/78157315-c8af8680-747a-11ea-918c-ce5b508c9d90.png">



<br>

## 원시 언어를 프로그램으로 번역하는 과정

<img width="842" alt="Screen Shot 2020-04-02 at 12 30 28 AM" src="https://user-images.githubusercontent.com/40483081/78156098-3e1a5780-7479-11ea-8fda-30f847709bb0.png">


**1. 전처리기**

- 원시 언어에서 전처리 항목들을 처리하는 도구
- C언어에서 #으로 시작하는 line들을 처리

**2. 컴파일러**

- 원시언어를 목표언어로 바꿔주는 도구
- gcc에서 컴파일만 원하면 -s 옵션을 사용
-  넓은 의미의 컴파일러는 과정 전부 다를 의미

**3. 어셈블러**

- 어셈블리어를 기계어로 바꿔주는 도구

**4. 링커**

- 기계어에 라이브러리를 추가하여 목표 프로그램을 만들어주는 도구

<br>

## 컴파일러의 구조/ 구성요소
> 원시프로그램 => 어휘분석기 => 구문분석기 => 의미분석기 => 중간코드 생성기 => <br>
Machine independent program 최적화기 => 코드생성기 =>  Machine dependent program 최적화기 => 목표프로그램

**1. 어휘분석기 (Lexical analysis)**

- Scanning하면서 원시프로그램을 의미를 나타내는 최소 단위인 <u>형태소(token)</u>로 분리
- 각 형태는 <토큰이름, 속성값> 형태로 변환된다. 속성값은 다루기 쉬운 정수이다.

**2. 구문분석기 (Syntax analysis)**

- Parsing하면서 Syntax checking을 하고 올바른 경우 형태소의 문법 구조를 Tree로 나타냄

**3. 의미분석기 (Sematic analyzer)**

- 구문 트리와 symbol table에 있는 정보를 이용해 프로그램이 언어 정의에 의미적으로 일치하는지 검사
- Type checking! (C언어의 경우 타입을 강제 변환하기도 함)

**4. 중간 코드 생성**

- 어셈블리어로 번역하기 전 단계
- 주로 3주소 코드(각 라인에 최대 3개의 주소를 저장)를 사용.

**5. 코드 최적화**

- 실행시간을 줄이기 위해서 어셈블리어의 라인 수를 줄이는 것이 중요.

**6. 코드 생성**

- (기계어와 1:1 대응해서 변환이 쉬운)어셈블리어를 만드는 과정





