# < 구문 분석 (SyntaxAnalysis, Parsing) >

## Context-Free 문법
### Context-Free 문법의 4가지 요소
- Terminal: 의미를 가진 가장 작은 요소. 형태소.
- Nonterminal: 문자열들의 집합
- Start Symbol: Nonterminal 중 하나
- 생성 규칙: A -> B
> (ex) Expr -> Expr op Expr | (Expr) | id | num <br><br>
(위의 경우에는 terminal: id, num, op / nonterminal: Expr / start symbol: Expr)

### 문법 확인 방법 1: Left Derivation & Right Derivation
- Left Derivation: 가장 왼쪽의 nonterminal부터 생성규칙을 적용하는 방법.
- Right Defivation: 가장 오른쪽부터.

### 문법 확인 방법 2: Derivation Tree (Parse Tree)
- Root node는 Start symbol
- 중간 node는 Nonterminal symbol
- Leaf node는 Terminal symbol이나 ε
- Top-down Parsing(하향식 파싱): root node부터 만들어나가는 방식

<hr>

## 문법의 모호성
### 문법의 모호성
문법 G에 대해 G에 의해 생성되는 어떤 문장이 두개 이상의 derication tree를 가질 수 있을 때<br>
G에 대해 모호(ambiguous)하다고 한다.<br>
일반적으로 *E -> E ⍺ E* 형태의 생성규칙이 있으면 문법이 모호해진다.<br><br>
**<예시>**
- Expr -> Expr op Expr | (Expr) | id | num
- <p>Stmt -> if (Expr) Stmt else Stmt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Stmt -> if (Expr) Stmt</p>

### 문법의 모호성 제거
문법을 설계할 때는 모호성을 없애야한다!
```
Expr -> Expr op1 Term | Term
Term -> Term op2 Factor | Factor
Factor -> (Expr) | num | id
(op1: +,- 이고 op2: *,/)
```
```
Stmt -> Matched_Stmt | Open_Stmt
Matched_Stmt -> if (Expr) Matched_Stmt else Matched_Stmt
Open_Stmt -> if (Expr) Stmt | if (Expr) Matched_Stmt else Open_Stmt
```

<hr>

## Left-recursion & Left-factoring

### Left-recursion 
Top-down parsing과 leftmost derivation을 이용해 구문 분석을 할 때,<br>
생성 규칙이 순환적으로 적용되어 무한루프에 빠지는 경우를 말한다.<br>
주로 **A -> A⍺** 형식이 있을 경우 발생한다.

### Left-factoring
left-recursion을 없애기 위한 방법<br>
> A -> A⍺ | β <br>
A -> β⍺* <br>
A -> βA', A' -> ⍺A' | ε<br>

```
Expr -> Term Expr'
Expr' -> op1 Term Expr' | ε
Term -> Factor Term'
Term' -> op2 Factor Term' | ε
Factor -> (Expr) | num | id
(op1: +,- 이고 op2: *,/)
```

