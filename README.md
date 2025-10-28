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
8. [클록](#8-클록)
9. [레지스터](#9-레지스터)
10. [메모리 시스템](#10-메모리-시스템)
11. [제어 유닛 및 카운터](#11-제어-유닛-및-카운터)
12. [컴퓨터 아키텍처](#12-컴퓨터-아키텍처)
13. [예제](#13-예제)

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

### DLatch.jpg

![DLatch](./PIC/DLatch.jpg)

- **기능**: D 래치 (Data Latch)
- **입력**: D (Data), E (Enable)
- **출력**: Q
- **구성**: Gated SR Latch + NOT 게이트
- **특징**: D 입력을 저장, Enable이 활성화될 때 D 값을 출력에 반영

### JKLatch.jpg

![JKLatch](./PIC/JKLatch.jpg)

- **기능**: JK 래치
- **입력**: J, K, E (Enable)
- **출력**: Q
- **구성**: SR 래치의 개선형
- **특징**: J=1, K=1일 때 토글 동작, SR 래치의 불확정 상태 문제 해결

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

## 8. 클록

### CLOCK0.jpg

![CLOCK0](./PIC/CLOCK0.jpg)

- **기능**: 클록 신호 생성기
- **출력**: CLK (주기적인 펄스 신호)
- **특징**: 순차 논리 회로의 동기화를 위한 타이밍 신호 제공, 시스템 전체의 타이밍 기준

---

## 9. 레지스터

### Register8HighLevel.jpg

![Register8HighLevel](./PIC/Register8HighLevel.jpg)

- **기능**: 8비트 레지스터
- **입력**: IN[7:0], SET (쓰기 제어), ENABLE (읽기 제어), CLK
- **출력**: OUT[7:0]
- **구성**: 8개의 D Latch (또는 D Flip-Flop)로 구성
- **특징**:
  - 8비트 데이터 저장
  - SET 신호로 데이터 쓰기
  - ENABLE 신호로 데이터 읽기 제어
  - 클록 동기화 동작

---

## 10. 메모리 시스템

### RAM8X16HighLevel.jpg

![RAM8X16HighLevel](./PIC/RAM8X16HighLevel.jpg)

- **기능**: 8비트 × 16워드 RAM
- **입력**:
  - IN[7:0] (데이터 입력)
  - ADDRESS[3:0] (주소 선택)
  - SET (쓰기 제어)
  - ENABLE (읽기 제어)
  - CLK
- **출력**: OUT[7:0]
- **구성**:
  - 16개의 8비트 레지스터
  - 4-to-16 디코더 (주소 디코딩)
  - 16:1 멀티플렉서 (데이터 선택)
- **특징**:
  - 총 128비트 (16바이트) 저장 용량
  - 랜덤 액세스 메모리
  - 주소로 특정 워드 선택 가능

---

## 11. 제어 유닛 및 카운터

### PC.jpg

![PC](./PIC/PC.jpg)

- **기능**: 프로그램 카운터 (Program Counter)
- **입력**:
  - IN[7:0] (점프 주소)
  - INC (증가 신호)
  - JMP (점프 신호)
  - CLK
- **출력**: OUT[7:0] (현재 명령어 주소)
- **특징**:
  - 다음 실행할 명령어의 주소 저장
  - INC 신호로 순차적 증가
  - JMP 신호로 특정 주소로 점프
  - CPU의 제어 흐름 관리

### SC.jpg

![SC](./PIC/SC.jpg)

- **기능**: 단계 카운터 (Step Counter)
- **입력**: CLK, RESET
- **출력**: 단계 신호들
- **특징**:
  - 명령어 실행 사이클을 단계별로 관리
  - 각 단계에서 필요한 제어 신호 생성
  - Fetch-Decode-Execute 사이클 제어

### CU.jpg

![CU](./PIC/CU.jpg)

- **기능**: 제어 유닛 (Control Unit)
- **입력**:
  - 명령어 코드
  - 단계 카운터 신호
  - 플래그 (Zero, Carry 등)
- **출력**: 제어 신호들
- **특징**:
  - CPU의 두뇌 역할
  - 명령어를 해독하고 실행을 위한 제어 신호 생성
  - ALU, 메모리, 레지스터 등 모든 구성 요소 제어
  - 단계 카운터와 협력하여 명령어 실행 사이클 관리

---

## 12. 컴퓨터 아키텍처

### ComputerWithoutCU.jpg

![ComputerWithoutCU](./PIC/ComputerWithoutCU.jpg)

- **기능**: 제어 유닛 없는 컴퓨터 구조
- **구성 요소**:
  - ALU (산술논리연산장치)
  - 레지스터들
  - 메모리 (RAM)
  - 버스 시스템
- **특징**:
  - 기본적인 컴퓨터 데이터패스 구조
  - 제어 유닛을 제외한 모든 하드웨어 구성 요소 포함
  - 수동 제어 신호 입력으로 동작 가능

### ComputerWithoutCUupdate.jpg

![ComputerWithoutCUupdate](./PIC/ComputerWithoutCUupdate.jpg)

- **기능**: 제어 유닛 없는 컴퓨터 구조 (업데이트 버전)
- **개선 사항**:
  - 향상된 버스 구조
  - 추가 레지스터 또는 구성 요소
  - 최적화된 연결 구조
- **특징**: ComputerWithoutCU.jpg의 개선 버전

---

## 13. 예제

### Example.jpg

![Example](./PIC/Example.jpg)

- **기능**: 회로 설계 예제
- **특징**:
  - 실제 회로 구성 예시
  - 다양한 구성 요소들의 결합 방법 시연
  - 학습 및 참고용 샘플

---

## 회로 설계 계층 구조

```
기본 게이트 (AND, OR, NOT, NAND, XOR)
    ↓
복합 회로 (Half Adder, MUX, Latch, Buffer)
    ↓
고급 회로 (Full Adder, Decoder, D/JK Latch)
    ↓
기능 유닛 (ALU, Register, RAM)
    ↓
제어 시스템 (PC, SC, CU, Clock)
    ↓
완전한 컴퓨터 (Computer Architecture)
```

## 학습 순서 권장

1. **1단계**: 기본 논리 게이트 이해
   - AND, OR, NOT, NAND, XOR

2. **2단계**: 조합 논리 회로
   - Half Adder, Full Adder
   - MUX, Decoder
   - Controlled Buffer

3. **3단계**: 순차 논리 회로
   - SR Latch, Gated SR Latch
   - D Latch, JK Latch
   - Clock

4. **4단계**: 메모리 및 저장 장치
   - Register (8-bit)
   - RAM (8×16)

5. **5단계**: 산술 논리 장치
   - ALU

6. **6단계**: 제어 시스템
   - Program Counter (PC)
   - Step Counter (SC)
   - Control Unit (CU)

7. **7단계**: 통합 시스템
   - Computer Without CU
   - Complete Computer Architecture

---

## 참고 사항

- 모든 회로는 Logisim 또는 유사한 디지털 회로 시뮬레이터로 제작된 것으로 보입니다.
- 파란색 선: 논리 0
- 초록색 선: 논리 1
- 검은색 선: 미연결 또는 고임피던스 상태
- 빨간색 선: 피드백 또는 특수 신호

---

**작성일**: 2025-10-29 (최종 업데이트)
**파일 위치**: PIC 폴더
**총 회로 수**: 30개

## 추가된 회로 (2025-10-29)
- D Latch (DLatch.jpg)
- JK Latch (JKLatch.jpg)
- Clock (CLOCK0.jpg)
- 8-bit Register (Register8HighLevel.jpg)
- RAM 8×16 (RAM8X16HighLevel.jpg)
- Program Counter (PC.jpg)
- Step Counter (SC.jpg)
- Control Unit (CU.jpg)
- Computer Without CU (ComputerWithoutCU.jpg)
- Computer Without CU Update (ComputerWithoutCUupdate.jpg)
- Example (Example.jpg)
