### 통계_출퇴근_월간_주별 ### : OFFICE_COMMUTE_MONTH_H_STATS
 
 #.직원ID : USER_ID (VARCHAR(50))
 #.기준년월 : BASE_MONTH_STR (VARCHAR(6))
 #.누적근무시간 : SUM_WORK_TIME (DOUBLE)
 #.HD1_WORK_TIME : 휴일 1일째 근무시간 (DOUBLE)
 ...
 #.HD20_WORK_TIME : 휴일 20일째 근무시간 (DOUBLE)


 ### 인덱스 ###

 #.BASE_MONTH_STR

 (U) #.BASE_MONTH_STR, USER_ID