LOADA 14 // A = RAM[14]
SUB 12 // A -= RAM[12]
JMPC 6 // CF 활성시 6번 주소로 점프
LOADA 13 // 13번 주소에 있는 곱셈 결과를 레지스터 A에 저장
OUT
HLT
STOREA 14
LOADA 13
ADD 15
STOREA 13
JMP 0

1 // 반복할 때 빼주는 값
0 // 곱셉 결과
4 // 승수
5 // 피승수