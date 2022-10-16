### 휴가_휴직_상세 ### : OFFICE_VACATION_DETAIL

 #.직원ID : USER_ID (VARCHAR(50))
 #.신청일 : REG_DATE (TIMESTAMP) === NULLALBE ===
 #.승인일 : APPROVE_DATE (TIMESTAMP) === NULLALBE ===
 #.휴가종류 : VACATION_KIND_CODE (VARCHAR(50)) === NULLALBE ===
 #.휴가시작기간 : VACATION_START_DATE_STR (VARCHAR(8))
 #.휴가종료기간 : VACATION_END_DATE_STR (VARCHAR(8))
 #.사용연차 수 : USE_COUNT (DOUBLE)
 #.휴가/휴직 사유 : VACATION_DESCRIPTION (VARCHAR(4000)) === NULLALBE ===


### 인덱스 ###

 #.USER_ID
 
 #.VACATION_START_DATE_STR


### 휴가/휴직구분 ###

 #.연차, 오전반차, 오후반차, 공가, 대체휴가/휴직, 경조휴가/휴직, 포상휴가/휴직, 기타휴가/휴직