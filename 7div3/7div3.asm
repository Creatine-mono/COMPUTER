LOADA 15 
SUB 14 // 피제수 -= 제수
JMPC 7 // 피제수가 제수보다 크면 RAM의 7번 주소로 점프
JMPZ 7 // 피제수가 제수와 같으면 RAM의 7번 주소로 점프
LOADA 13 
OUT
HLT
STOREA 15 // 현재 레지스터 A의 값을 피제수로 업데이트
LOADI 1 // 몫 += 1
ADD 13
STOREA 13
JMP 0

0 // 몫
3 // 제수
7 // 피제수(결과는 나머지)