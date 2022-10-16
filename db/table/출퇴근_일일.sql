### 출퇴근_일일 ### : OFFICE_COMMUTE_DAY

 #.근태기준일 : BASE_DATE_STR (VARCHAR(8))
 #.직원ID : USER_ID (VARCHAR(50))
 #.최초출근시간 : START_WORK_DATE (TIMESTAMP) === NULLALBE ===
 #.최초퇴근시간 : OUT_WORK_DATE (TIMESTAMP) === NULLALBE ===
 #.최종출근시간 : FINAL_START_WORK_DATE (TIMESTAMP) === NULLALBE ===
 #.최종퇴근시간 : FINAL_OUT_WORK_DATE (TIMESTAMP) === NULLALBE ===
 #.출근IP : START_WORK_IP (VARCHAR(50)) === NULLALBE ===
 #.퇴근IP : OUT_WORK_IP (VARCHAR(50)) === NULLALBE ===
 #.외근여부 : OUTSIDE_WORK_YN (CHAR(1)) === NULLALBE ===
 #.근무상태 : WORK_STATUS_CODE (VARCHAR(50)) === NULLALBE ===
 #.근태결과 : WORK_RESULT_CODE (VARCHAR(50)) === NULLALBE ===
 #.휴가종류 : VACATION_KIND_CODE (VARCHAR(50)) === NULLALBE ===
 #.기타설명 : ETC_DESCRIPTION (VARCHAR(4000)) === NULLALBE ===
 #.수정여부 : MOD_YN (CHAR(1)) === NULLALBE ===
 #.지각여부 : TARDY_YN (CHAR(1)) === NULLALBE ===
 #.근무시간 : WORKED_TIME_VALUE (DOUBLE) === NULLALBE ===


### 인덱스 ###

 #.BASE_DATE_STR

 (U) #.BASE_DATE_STR, USER_ID


### 근무상태 ###

 #.업무중, 재택중, 업무종료, 연차, 오전반차, 오후반차, 공가, 대체휴가, 경조휴가, 포상휴가, 기타휴가, 출산휴가


### 근태결과 ###

 #.정상출근, 정상출근(오전반차), 정상출근(오후반차), 정상출근(생일), 지각(생일), 지각, 지각(오전반차), 지각(오후반차), 연차, 포상휴가, 경조휴가, 공가, 대체휴가, 출산휴가, 기타, 일반휴직, 육아휴직, 결근

 -연차, 포상휴가, 경조휴가, 공가, 대체휴가, 출산휴가, 일반휴직, 육아휴직
