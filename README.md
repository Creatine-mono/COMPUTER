# 디지털 논리 회로 설명서

이 문서는 PIC 폴더에 있는 디지털 논리 회로 이미지들에 대한 설명입니다.

## 목차
1. [기본 논리 게이트](#1-기본-논리-게이트)
2. [산술 연산 회로](#2-산술-연산-회로)
3. [멀티플렉서 (MUX)](#3-멀티플렉서-mux)
4. [디코더](#4-디코더)
5. [메모리/래치 회로](#5-메모리래치-회로)
6. [버퍼](#6-버퍼)
7. [ALU](#7-alu-산술논리연산장치)

---

## 1. 기본 논리 게이트

### AND게이트.jpg

![AND게이트](./PIC/AND게이트.jpg)

- **기능**: 논리곱 연산 수행
- **입력**: A, B (2개)
- **출력**: Q = A AND B
- **특징**: 두 입력이 모두 1일 때만 출력이 1

### OR게이트.jpg

![OR게이트](./PIC/OR게이트.jpg)

- **기능**: 논리합 연산 수행
- **입력**: A, B (2개)
- **출력**: Q = A OR B
- **특징**: 입력 중 하나라도 1이면 출력이 1

### NOT게이트.jpg

![NOT게이트](./PIC/NOT게이트.jpg)

- **기능**: 논리 반전 (인버터)
- **입력**: A (1개)
- **출력**: Q = NOT A
- **특징**: 입력을 반대로 변환 (0→1, 1→0)

### NAND게이트.jpg

![NAND게이트](./PIC/NAND게이트.jpg)

- **기능**: NOT AND 연산
- **입력**: A, B (2개)
- **출력**: Q = NOT(A AND B)
- **특징**: 피드백 루프로 구현됨, 범용 게이트

### XOR게이트.jpg

![XOR게이트](./PIC/XOR게이트.jpg)

- **기능**: 배타적 논리합 연산
- **입력**: A, B (2개)
- **출력**: Q = A XOR B
- **구성**: 4개의 NAND 게이트 (n1, n2, n3, n4)로 구현
- **특징**: 두 입력이 다를 때 출력이 1

---

## 2. 산술 연산 회로

### Half_Adder.jpg

![Half_Adder](./PIC/Half_Adder.jpg)

- **기능**: 1비트 반가산기
- **입력**: IN_A, IN_B
- **출력**:
  - Sum (합)
  - Carry (자리올림)
- **구성**: AND 게이트 + XOR 게이트
- **특징**: 이전 자리의 캐리를 고려하지 않음

### Full_Adder.jpg

![Full_Adder](./PIC/Full_Adder.jpg)

- **기능**: 1비트 전가산기
- **입력**: IN_A, IN_B, IN_C (캐리 입력)
- **출력**:
  - Sum (합)
  - Carry (자리올림)
- **구성**: 2개의 Half Adder로 구성
- **특징**: 3개의 입력을 모두 더할 수 있음

---

## 3. 멀티플렉서 (MUX)

### MUX.jpg

![MUX](./PIC/MUX.jpg)

- **기능**: 2:1 멀티플렉서
- **입력**: A, B, Selection
- **출력**: Q
- **특징**: Selection 신호에 따라 A 또는 B를 출력으로 선택

### MUX8.jpg

![MUX8](./PIC/MUX8.jpg)

- **기능**: 8비트 2:1 멀티플렉서
- **입력**: IN_A[7:0], IN_B[7:0], Selection
- **출력**: OUT[7:0]
- **특징**: 8개의 1비트 MUX를 병렬로 사용

### MUX8X4.jpg

![MUX8X4](./PIC/MUX8X4.jpg)

- **기능**: 4:1 8비트 멀티플렉서
- **입력**: IN_0, IN_1, IN_2, IN_3 (각 8비트), SELECTION[1:0]
- **출력**: Q (8비트)
- **특징**: 4개의 8비트 입력 중 하나 선택

### MUX8X8.jpg

![MUX8X8](./PIC/MUX8X8.jpg)

- **기능**: 8:1 8비트 멀티플렉서
- **입력**: IN_0 ~ IN_7 (각 8비트), SELECTION[2:0]
- **출력**: Q (8비트)
- **특징**: 8개의 8비트 입력 중 하나 선택

### MUX8X16.jpg

![MUX8X16](./PIC/MUX8X16.jpg)

- **기능**: 16:1 8비트 멀티플렉서
- **입력**: IN_0 ~ IN_15 (각 8비트), SELECTION[3:0]
- **출력**: Q (8비트)
- **특징**: 계층적 구조로 구현, 16개의 입력 중 하나 선택

---

## 4. 디코더

### Decoder3In.jpg

![Decoder3In](./PIC/Decoder3In.jpg)

- **기능**: 3-to-8 디코더
- **입력**: SELECTION[2:0], ENABLE
- **출력**: OUT0 ~ OUT7 (8개)
- **특징**: 3비트 입력을 8개 출력 중 하나로 변환

### Decoder4In.jpg

![Decoder4In](./PIC/Decoder4In.jpg)

- **기능**: 4-to-16 디코더
- **입력**: SELECTION[3:0], ENABLE
- **출력**: OUT0 ~ OUT15 (16개)
- **특징**: 4비트 입력을 16개 출력 중 하나로 변환, ENABLE 신호로 활성화 제어

---

## 5. 메모리/래치 회로

### SRLatch.jpg

![SRLatch](./PIC/SRLatch.jpg)

- **기능**: SR 래치 (Set-Reset Latch)
- **입력**: S (Set), R (Reset)
- **출력**: Q
- **구성**: 2개의 NOR 게이트로 교차 결합
- **특징**: 1비트 데이터 저장, 비동기 메모리 소자

### GatedSRLatch.jpg

![GatedSRLatch](./PIC/GatedSRLatch.jpg)

- **기능**: 게이트 제어 SR 래치
- **입력**: S (Set), E (Enable), R (Reset)
- **출력**: Q
- **구성**: SR 래치 + AND 게이트
- **특징**: Enable 신호가 활성화될 때만 동작

---

## 6. 버퍼

### ControlledBuffer.jpg

![ControlledBuffer](./PIC/ControlledBuffer.jpg)

- **기능**: 제어 가능한 버퍼
- **입력**: Data_In, Enable
- **출력**: Data_Out
- **특징**: Enable 신호로 데이터 통과 여부 제어, 트라이스테이트 버퍼

### ControlledBuffer8.jpg

![ControlledBuffer8](./PIC/ControlledBuffer8.jpg)

- **기능**: 8비트 제어 버퍼
- **입력**: Data_In[7:0], Enable
- **출력**: Data_Out[7:0]
- **특징**: 8개의 1비트 버퍼를 병렬로 구성, 버스 제어에 사용

---

## 7. ALU (산술논리연산장치)

### ALU.jpg

![ALU](./PIC/ALU.jpg)

- **기능**: 8비트 산술논리연산장치
- **구성 요소**:
  - 8개의 ALU 슬라이스 (각각 Full Adder 포함)
  - Zero Checker (제로 검출기)
  - 제어 신호 입력부
- **연산 종류**:
  - 산술 연산: 덧셈, 뺄셈
  - 논리 연산: AND, OR, XOR
- **출력**:
  - 연산 결과
  - Carry Flag
  - Zero Flag
- **특징**: CPU의 핵심 구성 요소, 다양한 연산을 하나의 회로로 처리

---

## 회로 설계 계층 구조

```
기본 게이트 (AND, OR, NOT, NAND, XOR)
    ↓
복합 회로 (Half Adder, MUX, Latch)
    ↓
고급 회로 (Full Adder, Decoder, Buffer)
    ↓
시스템 레벨 (ALU)
```

## 학습 순서 권장

1. **1단계**: 기본 논리 게이트 이해
   - AND, OR, NOT, NAND, XOR

2. **2단계**: 조합 논리 회로
   - Half Adder, Full Adder
   - MUX, Decoder

3. **3단계**: 순차 논리 회로
   - SR Latch, Gated SR Latch

4. **4단계**: 데이터 전송 제어
   - Controlled Buffer

5. **5단계**: 복합 시스템
   - ALU

---

## 참고 사항

- 모든 회로는 Logisim 또는 유사한 디지털 회로 시뮬레이터로 제작된 것으로 보입니다.
- 파란색 선: 논리 0
- 초록색 선: 논리 1
- 검은색 선: 미연결 또는 고임피던스 상태
- 빨간색 선: 피드백 또는 특수 신호

---

**작성일**: 2025-10-28
**파일 위치**: PIC 폴더
**총 회로 수**: 19개
