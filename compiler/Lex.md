# Lex
## Lex ?
- 사용자 정의의 Lexical Analyzer를 만들어주는 도구
- 입력: 정규 표현과 정규 표현에 해당하는 형태소가 나왔을 때 처리하는 함수로 구성된 Lex 코드
- 출력: Lexical analyzer(C코드)
- Lex의 한 종류인 Flex<br>
  <img width="529" alt="Screen Shot 2020-04-07 at 12 06 01 AM" src="https://user-images.githubusercontent.com/40483081/78573394-a6937b00-7863-11ea-9a59-cc8da06c4958.png">

## Lex 소스 코드 구성

```
% {

  … (1) 주로 #include, #define, 변수, 함수선언이 들어간다.
  
% }

  … (2) 생성 규칙이 들어간다. 입력되는 형식은 '[Nontermianl name]	[정규표현식]'이다.
  
%%
  
  … (3) (2)에서 작성한 정규 표현식에 해당하는 것이 나오면 처리하는 동작들 정의. C언어로 표현.
  
%%

  … (4) (3)에서 정의한 동작 중 사용자 정의 함수를 정의하는 부분.
  
```

## Lex에서의 정규 표현식 문법
- .: \n을 제외한 모든 1바이트 char
- *: 0번 이상 반복
- +: 1번 이상 반복
- |: or 연산자
- []: 1바이트 char들 간에 | 기호를 생략하고 묶을 수 있는 괄호 (ex) a|b|c|d = [abcd]
	- -: []안의 char들이 연속적인 경우 - 기호로 축약 가능 (ex) [abcd] = [a-d]
	- ^: []안에서 제일 앞에 적고 뒤에 나오는 char들을 제외한 나머지 문자를 말한다. (ex) [^0] = 0을 제외한 모든 문자
- (): 연산 우선순위를 위한 괄호. 
- $: Line의 맨 마지막을 뜻하는 char
- {}: 앞의 symbol의 반복되는 횟수를 지정. 범위일 때는 쉼표로 구분. (ex) ab{3}=abbb, ab{1,3}=ab,abb,abbb
- {}: 중괄호 안에 Nonterminal name을 적으면 그것을 정의한 문법을 사용하겠다는 의미
	- digit	[0-9]
	- nonzero	[1-9]
	- positive	{nonzero}{digit}*
- ?: 0번이나 1번 나옴
- Escape character
	- \로 시작하는 2바이트 문자
	- +, -, *, /, (, ), .,^ 등을 정규 표현식에 적고싶을 때는 앞에 \를 붙여서 사용

## Action 실행
- 만일 둘 이상의 패턴과 일치하게 된다면 더 긴 문자열에 해당하는 패턴의 Action이 실행
	- (ex) int8, int
- 같은 길이의 문자열이 같음 패턴과 일치하게 된다면 먼저 정의된 패턴의 Action 실행
	- 따라서 keyword를 id보다 먼저 정의해야한다.
- 문자열이 어떠한 규칙에도 대응되지 않으면 그 문자열 그대로 출력

## Action을 위한 Lex 기본 전역 변수 함수
- yytext: 입력스트림에서 정규표현에 해당하는 실제 문자열
- yyleng: yytext의 길이
- yyin: 형태소 분석기에 입력할 입력 파일 포인터
- yyout: 형태소 분석기의 출력값을 저장하는 출력 파일 포인터
- yylex(): (4)부분에 main 함수를 정의하면 main에서 call하는 함수. (3)에서 return 정수;하면 yylex의 반환값은 그 정수이다.
