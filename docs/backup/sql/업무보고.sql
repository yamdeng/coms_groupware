### 업무보고 ### : OFFICE_WORK_REPORT

 #.보고기준일 : BASE_DATE_STR (VARCHAR(8))
 #.보고일 : REPORT_DATE (TIMESTAMP)
 #.작성자 : USER_ID (VARCHAR(50))
 #.부서 : DEPT_ID (VARCHAR(50))
 #.보고내용 : REPORT_CONTENT (TEXT)
 #.업무보고 제출상태 : REPORT_SUBMIT_STATUS_CODE (VARCHAR(50))
 #.이슈 여부 : ISSUE_YN (CHAR(1))


### 인덱스 ###

 #.BASE_DATE_STR

 (U) #.BASE_DATE_STR, DEPT_ID