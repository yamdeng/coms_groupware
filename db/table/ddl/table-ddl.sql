-- drop table all
drop table OFFICE_CODE_MASTER; /* 코드마스터 */
drop table OFFICE_WORK_HOLIDAY; /* 공휴일 */
drop table OFFICE_PUSH_ALARM; /* 알람 */
drop table OFFICE_BATCH_HISTORY; /* 배치 히스토리 */
drop table OFFICE_DEPT_WORK_TIME_SETTING; /* 부서별_근무_시간_관리 */
drop table OFFICE_COMMUTE_DAY; /* 출퇴근_일일 */
drop table OFFICE_COMMUTE_DEPT_DAY; /* 부서별_출퇴근제출 */
drop table OFFICE_COMMUTE_WEEK_STATS; /* 통계_출퇴근_주간 */
drop table OFFICE_COMMUTE_MONTH_D_STATS; /* 통계_출퇴근_월간_주별 */
drop table OFFICE_COMMUTE_MONTH_H_STATS; /* 통계_출퇴근_월간_휴일 */
drop table OFFICE_WORK_REPORT; /* 업무보고 */
drop table OFFICE_WORK_REPORT_COMMENT; /* 업무보고_댓글 */

drop table OFFICE_VACATION_YEAR; /* 휴가_휴직_현황(연별) */
drop table OFFICE_VACATION_DETAIL; /* 휴가_휴직_상세 */
drop table OFFICE_VACATION_DETAIL_DAY_HISTORY; /* 휴가_휴직_상세(일별히스토리) */
drop table OFFICE_VACATION_PLUS; /* 휴가_휴직_현황(포상휴가) */
drop table OFFICE_VACATION_MONTH_STATS; /* 통계_휴가_월별_사용현황 */
drop table OFFICE_VACATION_YEAR_PREVIEW; /* 휴가_휴직_현황(연별)_미리보기 */
drop table OFFICE_VACATION_PLUS_PREVIEW; /* 휴가_휴직_현황(포상휴가)_미리보기 */
drop table OFFICE_LOGIN_TOKEN; /* 로그인토큰 */


-- "코드마스터" 테이블 DDL
CREATE TABLE OFFICE_CODE_MASTER
(
  GROUP_CODE_ID VARCHAR(50) NOT NULL,
  CODE_VALUE VARCHAR(100) NOT NULL,
  CODE_NAME VARCHAR(100) NOT NULL,
  SORT_INDEX INTEGER,
  REG_DATE TIMESTAMP DEFAULT NOW(),
  MOD_DATE TIMESTAMP DEFAULT NOW(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

COMMENT ON TABLE OFFICE_CODE_MASTER IS '코드마스터';

comment on column OFFICE_CODE_MASTER.GROUP_CODE_ID is '근태기준일';
comment on column OFFICE_CODE_MASTER.CODE_VALUE is '직원ID';
comment on column OFFICE_CODE_MASTER.CODE_NAME is '최초출근시간';
comment on column OFFICE_CODE_MASTER.SORT_INDEX is '최초퇴근시간';
comment on column OFFICE_CODE_MASTER.REG_DATE is '등록일';
comment on column OFFICE_CODE_MASTER.MOD_DATE is '수정일';
comment on column OFFICE_CODE_MASTER.REG_USER_ID is '등록자ID';
comment on column OFFICE_CODE_MASTER.MOD_USER_ID is '수정자ID';

CREATE INDEX CODE_MASTER_IDX1 ON OFFICE_CODE_MASTER (GROUP_CODE_ID);
CREATE UNIQUE INDEX CODE_MASTER_IDX2 ON OFFICE_CODE_MASTER (GROUP_CODE_ID, CODE_VALUE);


-- "공휴일" 테이블 DDL
CREATE TABLE OFFICE_WORK_HOLIDAY
(
  BASE_YEAR VARCHAR(4) NOT NULL,
  HOLI_DATE_STR VARCHAR(8) NOT NULL,
  NAME VARCHAR(100),
  WEEKDAY_CODE VARCHAR(50) NOT NULL,
  WEEKEND_CODE VARCHAR(50) NOT NULL,
  REG_DATE TIMESTAMP DEFAULT NOW(),
  MOD_DATE TIMESTAMP DEFAULT NOW()
);

COMMENT ON TABLE OFFICE_WORK_HOLIDAY IS '공휴일';

comment on column OFFICE_WORK_HOLIDAY.BASE_YEAR is '기준년';
comment on column OFFICE_WORK_HOLIDAY.HOLI_DATE_STR is '날짜';
comment on column OFFICE_WORK_HOLIDAY.NAME is '명칭';
comment on column OFFICE_WORK_HOLIDAY.WEEKDAY_CODE is '요일구분';
comment on column OFFICE_WORK_HOLIDAY.WEEKEND_CODE is '주중/주말 구분';
comment on column OFFICE_WORK_HOLIDAY.REG_DATE is '등록일';
comment on column OFFICE_WORK_HOLIDAY.MOD_DATE is '수정일';

CREATE INDEX WORK_HOLIDAYI_IDX2 ON OFFICE_WORK_HOLIDAY (BASE_YEAR);
CREATE UNIQUE INDEX WORK_HOLIDAYI_IDX1 ON OFFICE_WORK_HOLIDAY (BASE_YEAR, HOLI_DATE_STR);


-- "알림" 테이블 DDL
CREATE TABLE OFFICE_PUSH_ALARM
(
  ALARM_ID SERIAL PRIMARY KEY,
  BASE_DATE_STR VARCHAR(8) NOT NULL,
  USER_ID VARCHAR(50) NOT NULL,
  ALARM_TITLE VARCHAR(2000) NOT NULL,
  ALARM_CONTENT VARCHAR(4000),
  ALARM_KIND_CODE VARCHAR(50),
  REG_DATE TIMESTAMP DEFAULT NOW(),
  READ_DATE TIMESTAMP,
  LINK_YN CHAR(1) NOT NULL DEFAULT 'N',
  LINK_URL VARCHAR(2000),
  TARGET_ID VARCHAR(50),
  MOD_DATE TIMESTAMP DEFAULT NOW()
);

COMMENT ON TABLE OFFICE_PUSH_ALARM IS '알람';

comment on column OFFICE_PUSH_ALARM.ALARM_ID is '알림_ID';
comment on column OFFICE_PUSH_ALARM.USER_ID is '대상_사용자_ID';
comment on column OFFICE_PUSH_ALARM.ALARM_TITLE is '제목';
comment on column OFFICE_PUSH_ALARM.ALARM_CONTENT is '내용';
comment on column OFFICE_PUSH_ALARM.ALARM_KIND_CODE is '알림구분(공지, 출퇴근)';
comment on column OFFICE_PUSH_ALARM.REG_DATE is '등록일';
comment on column OFFICE_PUSH_ALARM.READ_DATE is '읽은날짜';
comment on column OFFICE_PUSH_ALARM.LINK_YN is '링크여부';
comment on column OFFICE_PUSH_ALARM.LINK_URL is '링크URL';
comment on column OFFICE_PUSH_ALARM.TARGET_ID is '대상ID';
comment on column OFFICE_PUSH_ALARM.MOD_DATE is '수정일';
comment on column OFFICE_PUSH_ALARM.BASE_DATE_STR is '기준일';

CREATE INDEX PUSH_ALARM_IDX1 ON OFFICE_PUSH_ALARM (USER_ID);


-- "배치 히스토리" 테이블 DDL
CREATE TABLE OFFICE_BATCH_HISTORY
(
  BATCH_ID SERIAL PRIMARY KEY,
  BASE_DATE_STR VARCHAR(8) NOT NULL,
  BATCH_KIND_CODE VARCHAR(50) NOT NULL,
  START_DATE TIMESTAMP,
  END_DATE TIMESTAMP,
  USER_ID VARCHAR(50)
);

COMMENT ON TABLE OFFICE_BATCH_HISTORY IS '배치 히스토리';

comment on column OFFICE_BATCH_HISTORY.USER_ID is '배치ID';
comment on column OFFICE_BATCH_HISTORY.BASE_DATE_STR is '배치기준일';
comment on column OFFICE_BATCH_HISTORY.BATCH_KIND_CODE is '배치종류';
comment on column OFFICE_BATCH_HISTORY.START_DATE is '시작일';
comment on column OFFICE_BATCH_HISTORY.END_DATE is '종료일';
comment on column OFFICE_BATCH_HISTORY.USER_ID is '등록자ID';


-- "부서별_근무_시간_관리" 테이블 DDL
CREATE TABLE OFFICE_DEPT_WORK_TIME_SETTING
(
  DEPT_ID VARCHAR(50) PRIMARY KEY,
  TIME_NAME VARCHAR(100) NOT NULL,
  TIME_DESCRIPTION VARCHAR(4000),
  WORK_LOCATION VARCHAR(100),
  WORK_START_TIME VARCHAR(5) NOT NULL,
  WORK_END_TIME VARCHAR(5) NOT NULL,
  LUNCH_START_TIME VARCHAR(5) NOT NULL,
  LUNCH_END_TIME VARCHAR(5) NOT NULL,
  APPLY_START_DATE_STR VARCHAR(8) NOT NULL,
  APPLY_END_DATE_STR VARCHAR(8),
  REG_DATE TIMESTAMP DEFAULT NOW(),
  MOD_DATE TIMESTAMP DEFAULT NOW(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

COMMENT ON TABLE OFFICE_DEPT_WORK_TIME_SETTING IS '부서별_근무_시간_관리';

comment on column OFFICE_DEPT_WORK_TIME_SETTING.DEPT_ID is '적용부서ID';
comment on column OFFICE_DEPT_WORK_TIME_SETTING.TIME_NAME is '근무시간명';
comment on column OFFICE_DEPT_WORK_TIME_SETTING.TIME_DESCRIPTION is '근무시간 설명';
comment on column OFFICE_DEPT_WORK_TIME_SETTING.WORK_LOCATION is '근무지';
comment on column OFFICE_DEPT_WORK_TIME_SETTING.WORK_START_TIME is '근무시작시간';
comment on column OFFICE_DEPT_WORK_TIME_SETTING.WORK_END_TIME is '근무종료시간';
comment on column OFFICE_DEPT_WORK_TIME_SETTING.LUNCH_START_TIME is '점심시작시간';
comment on column OFFICE_DEPT_WORK_TIME_SETTING.LUNCH_END_TIME is '점심종료시간';
comment on column OFFICE_DEPT_WORK_TIME_SETTING.APPLY_START_DATE_STR is '적용시작일';
comment on column OFFICE_DEPT_WORK_TIME_SETTING.APPLY_END_DATE_STR is '적용종료일';
comment on column OFFICE_DEPT_WORK_TIME_SETTING.REG_DATE is '등록일';
comment on column OFFICE_DEPT_WORK_TIME_SETTING.MOD_DATE is '수정일';
comment on column OFFICE_DEPT_WORK_TIME_SETTING.REG_USER_ID is '등록자ID';
comment on column OFFICE_DEPT_WORK_TIME_SETTING.MOD_USER_ID is '수정자ID';


 -- "출퇴근_일일" 테이블 DDL
CREATE TABLE OFFICE_COMMUTE_DAY
(
  BASE_DATE_STR VARCHAR(8) NOT NULL,
  USER_ID VARCHAR(50) NOT NULL,
  START_WORK_DATE TIMESTAMP,
  OUT_WORK_DATE TIMESTAMP,
  FINAL_START_WORK_DATE TIMESTAMP,
  FINAL_OUT_WORK_DATE TIMESTAMP,
  START_WORK_IP VARCHAR(50),
  OUT_WORK_IP VARCHAR(50),
  OUTSIDE_WORK_YN CHAR(1) DEFAULT 'N',
  WORK_STATUS_CODE VARCHAR(50),
  WORK_RESULT_CODE VARCHAR(50),
  VACATION_KIND_CODE VARCHAR(50),
  ETC_DESCRIPTION VARCHAR(4000),
  MOD_YN CHAR(1) 'N',
  TARDY_YN CHAR(1) 'N',
  DEPT_SUBMIT_YN CHAR(1) DEFAULT 'N',
  WORKED_TIME_VALUE NUMERIC(5, 1),
  REG_DATE TIMESTAMP DEFAULT NOW(),
  MOD_DATE TIMESTAMP DEFAULT NOW(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

COMMENT ON TABLE OFFICE_COMMUTE_DAY IS '출퇴근_일일';

comment on column OFFICE_COMMUTE_DAY.BASE_DATE_STR is '근태기준일';
comment on column OFFICE_COMMUTE_DAY.USER_ID is '직원ID';
comment on column OFFICE_COMMUTE_DAY.START_WORK_DATE is '최초출근시간';
comment on column OFFICE_COMMUTE_DAY.OUT_WORK_DATE is '최초퇴근시간';
comment on column OFFICE_COMMUTE_DAY.FINAL_START_WORK_DATE is '최종출근시간';
comment on column OFFICE_COMMUTE_DAY.FINAL_OUT_WORK_DATE is '최종퇴근시간';
comment on column OFFICE_COMMUTE_DAY.START_WORK_IP is '출근IP';
comment on column OFFICE_COMMUTE_DAY.OUT_WORK_IP is '퇴근IP';
comment on column OFFICE_COMMUTE_DAY.OUTSIDE_WORK_YN is '외근여부';
comment on column OFFICE_COMMUTE_DAY.WORK_STATUS_CODE is '근무상태';
comment on column OFFICE_COMMUTE_DAY.WORK_RESULT_CODE is '근무결과';
comment on column OFFICE_COMMUTE_DAY.VACATION_KIND_CODE is '휴가종류';
comment on column OFFICE_COMMUTE_DAY.ETC_DESCRIPTION is '기타설명';
comment on column OFFICE_COMMUTE_DAY.MOD_YN is '수정여부';
comment on column OFFICE_COMMUTE_DAY.TARDY_YN is '지각여부';
comment on column OFFICE_COMMUTE_DAY.DEPT_SUBMIT_YN is '부서출퇴근제출여부';
comment on column OFFICE_COMMUTE_DAY.WORKED_TIME_VALUE is '근무시간';
comment on column OFFICE_COMMUTE_DAY.REG_DATE is '등록일';
comment on column OFFICE_COMMUTE_DAY.MOD_DATE is '수정일';
comment on column OFFICE_COMMUTE_DAY.REG_USER_ID is '등록자ID';
comment on column OFFICE_COMMUTE_DAY.MOD_USER_ID is '수정자ID';

CREATE INDEX COMMUTE_DAY_IDX1 ON OFFICE_COMMUTE_DAY (BASE_DATE_STR);
CREATE UNIQUE INDEX COMMUTE_DAY_IDX2 ON OFFICE_COMMUTE_DAY (BASE_DATE_STR, USER_ID);


-- "부서별_출퇴근제출" 테이블 DDL
CREATE TABLE OFFICE_COMMUTE_DEPT_DAY
(
  BASE_DATE_STR VARCHAR(8) NOT NULL,
  DEPT_ID VARCHAR(50) NOT NULL,
  USER_ID VARCHAR(50) NOT NULL,
  SUBMIT_DATE TIMESTAMP NOT NULL,
  MOD_YN CHAR(1) NOT NULL 'N',
  TARDY_YN CHAR(1) NOT NULL 'N',
  COMMUTE_SUBMIT_STATUS_CODE VARCHAR(50) NOT NULL,
  TARGET_COUNT INTEGER NOT NULL,
  START_WORK_COMPLETE_COUNT INTEGER NOT NULL,
  OUT_WORK_COMPLETE_COUNT INTEGER NOT NULL,
  TARDY_COUNT INTEGER DEFAULT 0,
  VACATION_COUNT INTEGER DEFAULT 0,
  SUCCESS_YN CHAR(1) DEFAULT 'N',
  REG_DATE TIMESTAMP DEFAULT NOW(),
  MOD_DATE TIMESTAMP DEFAULT NOW(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

COMMENT ON TABLE OFFICE_COMMUTE_DEPT_DAY IS '부서별_출퇴근제출';

comment on column OFFICE_COMMUTE_DEPT_DAY.BASE_DATE_STR is '제출기준일';
comment on column OFFICE_COMMUTE_DEPT_DAY.DEPT_ID is '제출부서';
comment on column OFFICE_COMMUTE_DEPT_DAY.USER_ID is '제출자(팀장)';
comment on column OFFICE_COMMUTE_DEPT_DAY.SUBMIT_DATE is '제출일';
comment on column OFFICE_COMMUTE_DEPT_DAY.MOD_YN is '수정여부';
comment on column OFFICE_COMMUTE_DEPT_DAY.TARDY_YN is '지각여부';
comment on column OFFICE_COMMUTE_DEPT_DAY.COMMUTE_SUBMIT_STATUS_CODE is '출/퇴근 제출상태';
comment on column OFFICE_COMMUTE_DEPT_DAY.TARGET_COUNT is '제출대상수';
comment on column OFFICE_COMMUTE_DEPT_DAY.START_WORK_COMPLETE_COUNT is '출근완료 합계';
comment on column OFFICE_COMMUTE_DEPT_DAY.OUT_WORK_COMPLETE_COUNT is '퇴근완료 합계';
comment on column OFFICE_COMMUTE_DEPT_DAY.TARDY_COUNT is '지각수';
comment on column OFFICE_COMMUTE_DEPT_DAY.VACATION_COUNT is '휴가/휴직 수';
comment on column OFFICE_COMMUTE_DEPT_DAY.SUCCESS_YN is '정상출근 여부';
comment on column OFFICE_COMMUTE_DEPT_DAY.REG_DATE is '등록일';
comment on column OFFICE_COMMUTE_DEPT_DAY.MOD_DATE is '수정일';
comment on column OFFICE_COMMUTE_DEPT_DAY.REG_USER_ID is '등록자ID';
comment on column OFFICE_COMMUTE_DEPT_DAY.MOD_USER_ID is '수정자ID';

CREATE INDEX COMMUTE_DEPT_DAY_IDX1 ON OFFICE_COMMUTE_DEPT_DAY (BASE_DATE_STR);
CREATE UNIQUE INDEX COMMUTE_DEPT_DAY_IDX2 ON OFFICE_COMMUTE_DEPT_DAY (BASE_DATE_STR, DEPT_ID);


-- "통계_출퇴근_주간" 테이블 DDL
CREATE TABLE OFFICE_COMMUTE_WEEK_STATS
(
  USER_ID VARCHAR(50) NOT NULL,
  MONDAY_START_DATE_STR VARCHAR(8) NOT NULL,
  SUM_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  MON_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  TUE_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  WED_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  THU_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  FRI_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  SAT_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  SUN_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  REG_DATE TIMESTAMP DEFAULT NOW(),
  MOD_DATE TIMESTAMP DEFAULT NOW()
);

COMMENT ON TABLE OFFICE_COMMUTE_WEEK_STATS IS '통계_출퇴근_주간';

comment on column OFFICE_COMMUTE_WEEK_STATS.USER_ID is '직원ID';
comment on column OFFICE_COMMUTE_WEEK_STATS.MONDAY_START_DATE_STR is '월요일 시작 일';
comment on column OFFICE_COMMUTE_WEEK_STATS.SUM_WORK_TIME_VALUE is '누적근무시간';
comment on column OFFICE_COMMUTE_WEEK_STATS.MON_WORK_TIME_VALUE is '월 근무시간';
comment on column OFFICE_COMMUTE_WEEK_STATS.TUE_WORK_TIME_VALUE is '화 근무시간';
comment on column OFFICE_COMMUTE_WEEK_STATS.WED_WORK_TIME_VALUE is '수 근무시간';
comment on column OFFICE_COMMUTE_WEEK_STATS.THU_WORK_TIME_VALUE is '목 근무시간';
comment on column OFFICE_COMMUTE_WEEK_STATS.FRI_WORK_TIME_VALUE is '금 근무시간';
comment on column OFFICE_COMMUTE_WEEK_STATS.SAT_WORK_TIME_VALUE is '토 근무시간';
comment on column OFFICE_COMMUTE_WEEK_STATS.SUN_WORK_TIME_VALUE is '일 근무시간';
comment on column OFFICE_COMMUTE_WEEK_STATS.REG_DATE is '등록일';
comment on column OFFICE_COMMUTE_WEEK_STATS.MOD_DATE is '수정일';

CREATE INDEX COMMUTE_WEEK_STATS_IDX1 ON OFFICE_COMMUTE_WEEK_STATS (MONDAY_START_DATE_STR);
CREATE UNIQUE INDEX COMMUTE_WEEK_STATS_IDX2 ON OFFICE_COMMUTE_WEEK_STATS (MONDAY_START_DATE_STR, USER_ID);


-- "통계_출퇴근_월간_주별" 테이블 DDL
CREATE TABLE OFFICE_COMMUTE_MONTH_D_STATS
(
  USER_ID VARCHAR(50) NOT NULL,
  BASE_MONTH_STR VARCHAR(6) NOT NULL,
  SUM_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  FIRST_WEEK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  SECOND_WEEK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  THREE_WEEK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  FOUR_WEEK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  FIVE_WEEK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  SIX_WEEK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  REG_DATE TIMESTAMP DEFAULT NOW(),
  MOD_DATE TIMESTAMP DEFAULT NOW()
);

COMMENT ON TABLE OFFICE_COMMUTE_MONTH_D_STATS IS '통계_출퇴근_월간_주별';

comment on column OFFICE_COMMUTE_MONTH_D_STATS.USER_ID is '직원ID';
comment on column OFFICE_COMMUTE_MONTH_D_STATS.BASE_MONTH_STR is '기준년월';
comment on column OFFICE_COMMUTE_MONTH_D_STATS.SUM_WORK_TIME_VALUE is '누적근무시간';
comment on column OFFICE_COMMUTE_MONTH_D_STATS.FIRST_WEEK_TIME_VALUE is '1주 근무시간';
comment on column OFFICE_COMMUTE_MONTH_D_STATS.SECOND_WEEK_TIME_VALUE is '2주 근무시간';
comment on column OFFICE_COMMUTE_MONTH_D_STATS.THREE_WEEK_TIME_VALUE is '3주 근무시간';
comment on column OFFICE_COMMUTE_MONTH_D_STATS.FOUR_WEEK_TIME_VALUE is '4주 근무시간';
comment on column OFFICE_COMMUTE_MONTH_D_STATS.FIVE_WEEK_TIME_VALUE is '5주 근무시간';
comment on column OFFICE_COMMUTE_MONTH_D_STATS.SIX_WEEK_TIME_VALUE is '6주 근무시간';
comment on column OFFICE_COMMUTE_MONTH_D_STATS.REG_DATE is '등록일';
comment on column OFFICE_COMMUTE_MONTH_D_STATS.MOD_DATE is '수정일';

CREATE INDEX COMMUTE_MONTH_D_STATS_IDX1 ON OFFICE_COMMUTE_MONTH_D_STATS (BASE_MONTH_STR);
CREATE UNIQUE INDEX COMMUTE_MONTH_D_STATS_IDX2 ON OFFICE_COMMUTE_MONTH_D_STATS (BASE_MONTH_STR, USER_ID);


-- "통계_출퇴근_월간_휴일" 테이블 DDL
CREATE TABLE OFFICE_COMMUTE_MONTH_H_STATS
(
  USER_ID VARCHAR(50) NOT NULL,
  BASE_MONTH_STR VARCHAR(6) NOT NULL,
  SUM_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD1_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD2_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD3_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD4_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD5_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD6_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD7_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD8_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD9_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD10_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD11_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD12_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD13_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD14_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD15_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD16_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD17_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD18_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD19_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  HD20_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL,
  REG_DATE TIMESTAMP DEFAULT NOW(),
  MOD_DATE TIMESTAMP DEFAULT NOW()
);

COMMENT ON TABLE OFFICE_COMMUTE_MONTH_H_STATS IS '통계_출퇴근_월간_휴일';

comment on column OFFICE_COMMUTE_MONTH_H_STATS.USER_ID is '직원ID';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.BASE_MONTH_STR is '기준년월';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.SUM_WORK_TIME_VALUE is '누적근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD1_WORK_TIME_VALUE is '휴일 1일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD2_WORK_TIME_VALUE is '휴일 2일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD3_WORK_TIME_VALUE is '휴일 3일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD4_WORK_TIME_VALUE is '휴일 4일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD5_WORK_TIME_VALUE is '휴일 5일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD6_WORK_TIME_VALUE is '휴일 6일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD7_WORK_TIME_VALUE is '휴일 7일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD8_WORK_TIME_VALUE is '휴일 8일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD9_WORK_TIME_VALUE is '휴일 9일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD10_WORK_TIME_VALUE is '휴일 10일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD11_WORK_TIME_VALUE is '휴일 11일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD12_WORK_TIME_VALUE is '휴일 12일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD13_WORK_TIME_VALUE is '휴일 13일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD14_WORK_TIME_VALUE is '휴일 14일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD15_WORK_TIME_VALUE is '휴일 15일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD16_WORK_TIME_VALUE is '휴일 16일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD17_WORK_TIME_VALUE is '휴일 17일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD18_WORK_TIME_VALUE is '휴일 18일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD19_WORK_TIME_VALUE is '휴일 19일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.HD20_WORK_TIME_VALUE is '휴일 20일째 근무시간';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.REG_DATE is '등록일';
comment on column OFFICE_COMMUTE_MONTH_H_STATS.MOD_DATE is '수정일';

CREATE INDEX COMMUTE_MONTH_H_STATS_IDX1 ON OFFICE_COMMUTE_MONTH_H_STATS (BASE_MONTH_STR);
CREATE UNIQUE INDEX COMMUTE_MONTH_H_STATS_IDX2 ON OFFICE_COMMUTE_MONTH_H_STATS (BASE_MONTH_STR, USER_ID);


 -- "업무보고" 테이블 DDL
CREATE TABLE OFFICE_WORK_REPORT
(
  REPORT_ID VARCHAR(50) PRIMARY KEY,
  BASE_DATE_STR VARCHAR(8) NOT NULL,
  REPORT_DATE TIMESTAMP,
  USER_ID VARCHAR(50),
  DEPT_ID VARCHAR(50) NOT NULL,
  REPORT_CONTENT TEXT,
  REPORT_SUBMIT_STATUS_CODE VARCHAR(50),
  ISSUE_YN CHAR(1) NOT NULL DEFAULT 'N',
  REG_DATE TIMESTAMP DEFAULT NOW(),
  MOD_DATE TIMESTAMP DEFAULT NOW(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

COMMENT ON TABLE OFFICE_WORK_REPORT IS '업무보고';

comment on column OFFICE_WORK_REPORT.REPORT_ID is '업부보고_ID';
comment on column OFFICE_WORK_REPORT.BASE_DATE_STR is '보고기준일';
comment on column OFFICE_WORK_REPORT.REPORT_DATE is '보고일(작성일)';
comment on column OFFICE_WORK_REPORT.USER_ID is '작성자';
comment on column OFFICE_WORK_REPORT.DEPT_ID is '부서';
comment on column OFFICE_WORK_REPORT.REPORT_CONTENT is '보고내용';
comment on column OFFICE_WORK_REPORT.REPORT_SUBMIT_STATUS_CODE is '업무보고 제출상태';
comment on column OFFICE_WORK_REPORT.ISSUE_YN is '이슈 여부';
comment on column OFFICE_WORK_REPORT.REG_DATE is '등록일';
comment on column OFFICE_WORK_REPORT.MOD_DATE is '수정일';
comment on column OFFICE_WORK_REPORT.REG_USER_ID is '등록자ID';
comment on column OFFICE_WORK_REPORT.MOD_USER_ID is '수정자ID';

CREATE INDEX WORK_REPORT_IDX1 ON OFFICE_WORK_REPORT (BASE_DATE_STR);
CREATE UNIQUE INDEX WORK_REPORT_IDX2 ON OFFICE_WORK_REPORT (BASE_DATE_STR, DEPT_ID);


-- "업무보고_댓글" 테이블 DDL
CREATE TABLE OFFICE_WORK_REPORT_COMMENT
(
  COMMENT_ID VARCHAR(50) PRIMARY KEY,
  REPORT_ID VARCHAR(50) NOT NULL,
  USER_ID VARCHAR(50) NOT NULL,
  COMMENT_CONTENT VARCHAR(4000) NOT NULL,
  REG_DATE TIMESTAMP DEFAULT NOW(),
  MOD_DATE TIMESTAMP DEFAULT NOW(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

COMMENT ON TABLE OFFICE_WORK_REPORT_COMMENT IS '업무보고_댓글';

comment on column OFFICE_WORK_REPORT_COMMENT.COMMENT_ID is '댓글_ID';
comment on column OFFICE_WORK_REPORT_COMMENT.REPORT_ID is '업부보고_ID';
comment on column OFFICE_WORK_REPORT_COMMENT.USER_ID is '작성자';
comment on column OFFICE_WORK_REPORT_COMMENT.COMMENT_CONTENT is '댓글내용';
comment on column OFFICE_WORK_REPORT_COMMENT.REG_DATE is '등록일';
comment on column OFFICE_WORK_REPORT_COMMENT.MOD_DATE is '수정일';
comment on column OFFICE_WORK_REPORT_COMMENT.REG_USER_ID is '등록자ID';
comment on column OFFICE_WORK_REPORT_COMMENT.MOD_USER_ID is '수정자ID';

CREATE INDEX WORK_REPORT_COMMENT_IDX1 ON OFFICE_WORK_REPORT_COMMENT (REPORT_ID);


-- "휴가_휴직_현황(연별)" 테이블 DDL
CREATE TABLE OFFICE_VACATION_YEAR
(
  USER_ID VARCHAR(50) NOT NULL,
  BASE_YEAR VARCHAR(4) NOT NULL,
  ANNUAL_COUNT NUMERIC(5, 1) NOT NULL,
  MONTH_COUNT NUMERIC(5, 1) NOT NULL,
  USEABLE_COUNT NUMERIC(5, 1) NOT NULL,
  PLUS_VACATION_COUNT NUMERIC(5, 1) NOT NULL,
  USED_COUNT NUMERIC(5, 1) NOT NULL,
  REG_DATE TIMESTAMP DEFAULT NOW(),
  MOD_DATE TIMESTAMP DEFAULT NOW(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

COMMENT ON TABLE OFFICE_VACATION_YEAR IS '휴가_휴직_현황(연별)';

comment on column OFFICE_VACATION_YEAR.USER_ID is '직원ID';
comment on column OFFICE_VACATION_YEAR.BASE_YEAR is '기준년';
comment on column OFFICE_VACATION_YEAR.ANNUAL_COUNT is '발생연차';
comment on column OFFICE_VACATION_YEAR.MONTH_COUNT is '금년월차';
comment on column OFFICE_VACATION_YEAR.USEABLE_COUNT is '사용가능일수';
comment on column OFFICE_VACATION_YEAR.PLUS_VACATION_COUNT is '포상휴가 수';
comment on column OFFICE_VACATION_YEAR.USED_COUNT is '사용일수';
comment on column OFFICE_VACATION_YEAR.REG_DATE is '등록일';
comment on column OFFICE_VACATION_YEAR.MOD_DATE is '수정일';
comment on column OFFICE_VACATION_YEAR.REG_USER_ID is '등록자ID';
comment on column OFFICE_VACATION_YEAR.MOD_USER_ID is '수정자ID';

CREATE INDEX VACATION_YEAR_IDX1 ON OFFICE_VACATION_YEAR (BASE_YEAR);
CREATE UNIQUE INDEX VACATION_YEAR_IDX2 ON OFFICE_VACATION_YEAR (BASE_YEAR, USER_ID);


-- "휴가_휴직_상세" 테이블 DDL
CREATE TABLE OFFICE_VACATION_DETAIL
(
  USER_ID VARCHAR(50) NOT NULL,
  BASE_YEAR VARCHAR(4) NOT NULL,
  SUBMIT_DATE TIMESTAMP,
  APPROVE_DATE TIMESTAMP,
  VACATION_KIND_CODE VARCHAR(50) NOT NULL,
  VACATION_START_DATE_STR VARCHAR(50) NOT NULL,
  VACATION_END_DATE_STR VARCHAR(50) NOT NULL,
  USE_COUNT NUMERIC(5, 1) NOT NULL,
  VACATION_DESCRIPTION VARCHAR(4000),
  APPROVE_ID VARCHAR(50),
  REG_DATE TIMESTAMP DEFAULT NOW(),
  MOD_DATE TIMESTAMP DEFAULT NOW()
);

COMMENT ON TABLE OFFICE_VACATION_DETAIL IS '휴가_휴직_상세';

comment on column OFFICE_VACATION_DETAIL.USER_ID is '직원ID';
comment on column OFFICE_VACATION_DETAIL.BASE_YEAR is '기준년';
comment on column OFFICE_VACATION_DETAIL.SUBMIT_DATE is '신청일';
comment on column OFFICE_VACATION_DETAIL.APPROVE_DATE is '승인일';
comment on column OFFICE_VACATION_DETAIL.VACATION_KIND_CODE is '휴가종류';
comment on column OFFICE_VACATION_DETAIL.VACATION_START_DATE_STR is '휴가시작기간';
comment on column OFFICE_VACATION_DETAIL.VACATION_END_DATE_STR is '휴가종료기간';
comment on column OFFICE_VACATION_DETAIL.USE_COUNT is '사용연차 수';
comment on column OFFICE_VACATION_DETAIL.VACATION_DESCRIPTION is '휴가/휴직 사유';
comment on column OFFICE_VACATION_DETAIL.APPROVE_ID is '전자결재 연동ID';
comment on column OFFICE_VACATION_DETAIL.REG_DATE is '등록일';
comment on column OFFICE_VACATION_DETAIL.MOD_DATE is '수정일';

CREATE INDEX VACATION_DETAIL_IDX1 ON OFFICE_VACATION_DETAIL (USER_ID);
CREATE INDEX VACATION_DETAIL_IDX2 ON OFFICE_VACATION_DETAIL (VACATION_START_DATE_STR);


-- "휴가_휴직_상세(일별히스토리)" 테이블 DDL
CREATE TABLE OFFICE_VACATION_DETAIL_DAY_HISTORY
(
  USER_ID VARCHAR(50) NOT NULL,
  VACATION_KIND_CODE VARCHAR(50) NOT NULL,
  BASE_DATE_STR VARCHAR(50) NOT NULL,
  APPROVE_ID VARCHAR(50),
  REG_DATE TIMESTAMP DEFAULT NOW(),
  MOD_DATE TIMESTAMP DEFAULT NOW()
);

COMMENT ON TABLE OFFICE_VACATION_DETAIL_DAY_HISTORY IS '휴가_휴직_상세(일별히스토리)';

comment on column OFFICE_VACATION_DETAIL_DAY_HISTORY.USER_ID is '직원ID';
comment on column OFFICE_VACATION_DETAIL_DAY_HISTORY.VACATION_KIND_CODE is '휴가종류';
comment on column OFFICE_VACATION_DETAIL_DAY_HISTORY.BASE_DATE_STR is '휴가일(일별)';
comment on column OFFICE_VACATION_DETAIL_DAY_HISTORY.APPROVE_ID is '전자결재 연동ID';
comment on column OFFICE_VACATION_DETAIL_DAY_HISTORY.REG_DATE is '등록일';
comment on column OFFICE_VACATION_DETAIL_DAY_HISTORY.MOD_DATE is '수정일';
CREATE UNIQUE INDEX VACATION_DETAIL_DAY_HISTORY_IDX1 ON OFFICE_VACATION_DETAIL_DAY_HISTORY (USER_ID, BASE_DATE_STR);


-- "휴가_휴직_현황(포상휴가)" 테이블 DDL
CREATE TABLE OFFICE_VACATION_PLUS
(
  USER_ID VARCHAR(50) NOT NULL,
  BASE_YEAR VARCHAR(4) NOT NULL,
  VACATION_NAME VARCHAR(2000),
  VACATION_COUNT NUMERIC(5, 1) NOT NULL,
  REG_DATE TIMESTAMP DEFAULT NOW(),
  MOD_DATE TIMESTAMP DEFAULT NOW(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

COMMENT ON TABLE OFFICE_VACATION_PLUS IS '휴가_휴직_현황(포상휴가)_미리보기';

comment on column OFFICE_VACATION_PLUS.USER_ID is '직원ID';
comment on column OFFICE_VACATION_PLUS.BASE_YEAR is '기준년';
comment on column OFFICE_VACATION_PLUS.VACATION_NAME is '휴가이름';
comment on column OFFICE_VACATION_PLUS.VACATION_COUNT is '휴가일 수';
comment on column OFFICE_VACATION_PLUS.REG_DATE is '등록일';
comment on column OFFICE_VACATION_PLUS.MOD_DATE is '수정일';
comment on column OFFICE_VACATION_PLUS.REG_USER_ID is '등록자ID';
comment on column OFFICE_VACATION_PLUS.MOD_USER_ID is '수정자ID';

CREATE INDEX VACATION_PLUS_IDX1 ON OFFICE_VACATION_PLUS (BASE_YEAR);
CREATE INDEX VACATION_PLUS_IDX2 ON OFFICE_VACATION_PLUS (BASE_YEAR, USER_ID);


-- "통계_휴가_월별_사용현황" 테이블 DDL
CREATE TABLE OFFICE_VACATION_MONTH_STATS
(
  USER_ID VARCHAR(50) NOT NULL,
  BASE_YEAR VARCHAR(4) NOT NULL,
  USE_1MONTH_COUNT NUMERIC(5, 1) NOT NULL,
  USE_2MONTH_COUNT NUMERIC(5, 1) NOT NULL,
  USE_3MONTH_COUNT NUMERIC(5, 1) NOT NULL,
  USE_4MONTH_COUNT NUMERIC(5, 1) NOT NULL,
  USE_5MONTH_COUNT NUMERIC(5, 1) NOT NULL,
  USE_6MONTH_COUNT NUMERIC(5, 1) NOT NULL,
  USE_7MONTH_COUNT NUMERIC(5, 1) NOT NULL,
  USE_8MONTH_COUNT NUMERIC(5, 1) NOT NULL,
  USE_9MONTH_COUNT NUMERIC(5, 1) NOT NULL,
  USE_10MONTH_COUNT NUMERIC(5, 1) NOT NULL,
  USE_11MONTH_COUNT NUMERIC(5, 1) NOT NULL,
  USE_12MONTH_COUNT NUMERIC(5, 1) NOT NULL,
  REG_DATE TIMESTAMP DEFAULT NOW(),
  MOD_DATE TIMESTAMP DEFAULT NOW()
);

COMMENT ON TABLE OFFICE_VACATION_MONTH_STATS IS '통계_휴가_월별_사용현황';

comment on column OFFICE_VACATION_MONTH_STATS.USER_ID is '직원ID';
comment on column OFFICE_VACATION_MONTH_STATS.BASE_YEAR is '기준년';
comment on column OFFICE_VACATION_MONTH_STATS.USE_1MONTH_COUNT is '1월 사용일수';
comment on column OFFICE_VACATION_MONTH_STATS.USE_2MONTH_COUNT is '2월 사용일수';
comment on column OFFICE_VACATION_MONTH_STATS.USE_3MONTH_COUNT is '3월 사용일수';
comment on column OFFICE_VACATION_MONTH_STATS.USE_4MONTH_COUNT is '4월 사용일수';
comment on column OFFICE_VACATION_MONTH_STATS.USE_5MONTH_COUNT is '5월 사용일수';
comment on column OFFICE_VACATION_MONTH_STATS.USE_6MONTH_COUNT is '6월 사용일수';
comment on column OFFICE_VACATION_MONTH_STATS.USE_7MONTH_COUNT is '7월 사용일수';
comment on column OFFICE_VACATION_MONTH_STATS.USE_8MONTH_COUNT is '8월 사용일수';
comment on column OFFICE_VACATION_MONTH_STATS.USE_9MONTH_COUNT is '9월 사용일수';
comment on column OFFICE_VACATION_MONTH_STATS.USE_10MONTH_COUNT is '10월 사용일수';
comment on column OFFICE_VACATION_MONTH_STATS.USE_11MONTH_COUNT is '11월 사용일수';
comment on column OFFICE_VACATION_MONTH_STATS.USE_12MONTH_COUNT is '12월 사용일수';
comment on column OFFICE_VACATION_MONTH_STATS.REG_DATE is '등록일';
comment on column OFFICE_VACATION_MONTH_STATS.MOD_DATE is '수정일';

CREATE INDEX VACATION_MONTH_STATS_IDX1 ON OFFICE_VACATION_MONTH_STATS (BASE_YEAR);
CREATE UNIQUE INDEX VACATION_MONTH_STATS_IDX2 ON OFFICE_VACATION_MONTH_STATS (BASE_YEAR, USER_ID);


-- "휴가_휴직_현황(연별)_미리보기" 테이블 DDL
CREATE TABLE OFFICE_VACATION_YEAR_PREVIEW
(
  USER_ID VARCHAR(50) NOT NULL,
  BASE_YEAR VARCHAR(4) NOT NULL,
  ANNUAL_COUNT NUMERIC(5, 1) NOT NULL,
  MONTH_COUNT NUMERIC(5, 1) NOT NULL,
  USEABLE_COUNT NUMERIC(5, 1) NOT NULL,
  PLUS_VACATION_COUNT NUMERIC(5, 1) NOT NULL,
  USED_COUNT NUMERIC(5, 1) NOT NULL,
  REG_DATE TIMESTAMP DEFAULT NOW(),
  MOD_DATE TIMESTAMP DEFAULT NOW(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

COMMENT ON TABLE OFFICE_VACATION_YEAR_PREVIEW IS '휴가_휴직_현황(연별)_미리보기';

comment on column OFFICE_VACATION_YEAR_PREVIEW.USER_ID is '직원ID';
comment on column OFFICE_VACATION_YEAR_PREVIEW.BASE_YEAR is '기준년';
comment on column OFFICE_VACATION_YEAR_PREVIEW.ANNUAL_COUNT is '발생연차';
comment on column OFFICE_VACATION_YEAR_PREVIEW.MONTH_COUNT is '금년월차';
comment on column OFFICE_VACATION_YEAR_PREVIEW.USEABLE_COUNT is '사용가능일수';
comment on column OFFICE_VACATION_YEAR_PREVIEW.PLUS_VACATION_COUNT is '포상휴가 수';
comment on column OFFICE_VACATION_YEAR_PREVIEW.USED_COUNT is '사용일수';
comment on column OFFICE_VACATION_YEAR_PREVIEW.REG_DATE is '등록일';
comment on column OFFICE_VACATION_YEAR_PREVIEW.MOD_DATE is '수정일';
comment on column OFFICE_VACATION_YEAR_PREVIEW.REG_USER_ID is '등록자ID';
comment on column OFFICE_VACATION_YEAR_PREVIEW.MOD_USER_ID is '수정자ID';

CREATE INDEX VACATION_YEAR_PREVIEW_IDX1 ON OFFICE_VACATION_YEAR_PREVIEW (BASE_YEAR);
CREATE UNIQUE INDEX VACATION_YEAR_PREVIEW_IDX2 ON OFFICE_VACATION_YEAR_PREVIEW (BASE_YEAR, USER_ID);


-- "휴가_휴직_현황(포상휴가)_미리보기" 테이블 DDL
CREATE TABLE OFFICE_VACATION_PLUS_PREVIEW
(
  USER_ID VARCHAR(50) NOT NULL,
  BASE_YEAR VARCHAR(4) NOT NULL,
  VACATION_NAME VARCHAR(2000),
  VACATION_COUNT NUMERIC(5, 1) NOT NULL,
  REG_DATE TIMESTAMP DEFAULT NOW(),
  MOD_DATE TIMESTAMP DEFAULT NOW(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

COMMENT ON TABLE OFFICE_VACATION_PLUS_PREVIEW IS '휴가_휴직_현황(포상휴가)_미리보기';

comment on column OFFICE_VACATION_PLUS_PREVIEW.USER_ID is '직원ID';
comment on column OFFICE_VACATION_PLUS_PREVIEW.BASE_YEAR is '기준년';
comment on column OFFICE_VACATION_PLUS_PREVIEW.VACATION_NAME is '휴가이름';
comment on column OFFICE_VACATION_PLUS_PREVIEW.VACATION_COUNT is '휴가일 수';
comment on column OFFICE_VACATION_PLUS_PREVIEW.REG_DATE is '등록일';
comment on column OFFICE_VACATION_PLUS_PREVIEW.MOD_DATE is '수정일';
comment on column OFFICE_VACATION_PLUS_PREVIEW.REG_USER_ID is '등록자ID';
comment on column OFFICE_VACATION_PLUS_PREVIEW.MOD_USER_ID is '수정자ID';

CREATE INDEX VACATION_PLUS_PREVIEW_IDX1 ON OFFICE_VACATION_PLUS_PREVIEW (BASE_YEAR);
CREATE INDEX VACATION_PLUS_PREVIEW_IDX2 ON OFFICE_VACATION_PLUS_PREVIEW (BASE_YEAR, USER_ID);


-- "로그인토큰" 테이블 DDL
CREATE TABLE OFFICE_LOGIN_TOKEN
(
  USER_ID VARCHAR(50) NOT NULL,
  LOGIN_TOKEN VARCHAR(200) NOT NULL
);

COMMENT ON TABLE OFFICE_LOGIN_TOKEN IS '로그인토큰';

comment on column OFFICE_LOGIN_TOKEN.USER_ID is '사용자_ID';
comment on column OFFICE_LOGIN_TOKEN.LOGIN_TOKEN is '로그인토큰';

CREATE INDEX LOGIN_TOKEN_IDX1 ON OFFICE_LOGIN_TOKEN (LOGIN_TOKEN);