# 컴파일러 개론

## 언어 처리기

**컴파일러**: <u>원시언어(Source language)</u>로 만들어진 프로그램을 읽어서 의미가 다른 언어<u>(목표언어: Target language)</u>로 번역하는 프로그램<br>

**인터프리터(interpreter)**: 원시 프로그램을 직접 실행해주는 프로그램<br>

**컴파일러와 인터프리터의 차이점** :<br>

- [Source Language -> **Compiler** -> Target Program] **=>** [input -> **Target Program** -> output]
-  [Source Language, input -> **interpreter** -> output]

<br>

## 원시 언어를 프로그램으로 번역하는 과정

### 전처리기
- 원시 언어에서 전처리 항목들을 처리하는 도구
- C언어에서 #으로 시작하는 line들을 처리

### 컴파일러
- 원시언어를 목표언어로 바꿔주는 도구

### 어셈블러
- 어셈블리어를 기계어로 바꿔주는 도구

### 링커
- 기계어에 라이브러리를 추가하여 목표 프로그램을 만들어주는 도구

