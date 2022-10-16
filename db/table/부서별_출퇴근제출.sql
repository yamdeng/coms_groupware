### 부서별_출퇴근제출 ### : OFFICE_COMMUTE_DEPT_DAY

 #.제출기준일 : BASE_DATE_STR (VARCHAR(8))
 #.제출부서 : DEPT_ID (VARCHAR(50))
 #.제출자(팀장) : USER_ID (VARCHAR(50))
 #.제출일 : SUBMIT_DATE (TIMESTAMP)
 #.수정여부 : MOD_YN (CHAR(1))
 #.지각여부 : TARDY_YN (CHAR(1))
 #.출/퇴근 제출상태 : COMMUTE_SUBMIT_STATUS_CODE (VARCHAR(50))
 #.제출대상수 : TARGET_COUNT (INT)
 #.출근완료 합계 : START_WORK_COMPLETE_COUNT (INT)
 #.퇴근완료 합계 : OUT_WORK_COMPLETE_COUNT (INT)


### 인덱스 ###

  #.BASE_DATE_STR

  (U) #.BASE_DATE_STR, DEPT_ID


### 제출상태 ###
 -제출전(?), 제출(승인전), 반려, 승인