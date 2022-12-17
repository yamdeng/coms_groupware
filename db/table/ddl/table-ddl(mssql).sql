-- GETDATE() ---> GETDATE()
-- DATETIME ---> DATETIME
-- int IDENTITY ---> int IDENTITY

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
  REG_DATE DATETIME DEFAULT GETDATE(),
  MOD_DATE DATETIME DEFAULT GETDATE(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

CREATE INDEX CODE_MASTER_IDX1 ON OFFICE_CODE_MASTER (GROUP_CODE_ID);
CREATE UNIQUE INDEX CODE_MASTER_IDX2 ON OFFICE_CODE_MASTER (GROUP_CODE_ID, CODE_VALUE);


-- "공휴일" 테이블 DDL
CREATE TABLE OFFICE_WORK_HOLIDAY
(
  BASE_YEAR VARCHAR(4) NOT NULL,
  HOLI_DATE_STR VARCHAR(8) NOT NULL,
  NAME VARCHAR(100),
  WEEKDAY_CODE VARCHAR(50),
  WEEKEND_CODE VARCHAR(50),
  REG_DATE DATETIME DEFAULT GETDATE(),
  MOD_DATE DATETIME DEFAULT GETDATE(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

CREATE INDEX WORK_HOLIDAYI_IDX2 ON OFFICE_WORK_HOLIDAY (BASE_YEAR);
CREATE UNIQUE INDEX WORK_HOLIDAYI_IDX1 ON OFFICE_WORK_HOLIDAY (BASE_YEAR, HOLI_DATE_STR);


-- "알림" 테이블 DDL
CREATE TABLE OFFICE_PUSH_ALARM
(
  ALARM_ID int IDENTITY PRIMARY KEY,
  BASE_DATE_STR VARCHAR(8),
  USER_ID VARCHAR(50) NOT NULL,
  ALARM_TITLE VARCHAR(2000) NOT NULL,
  ALARM_CONTENT VARCHAR(4000),
  ALARM_KIND_CODE VARCHAR(50),
  READ_DATE DATETIME,
  LINK_YN CHAR(1) DEFAULT 'N',
  LINK_URL VARCHAR(2000),
  TARGET_ID VARCHAR(50),
  REG_DATE DATETIME DEFAULT GETDATE(),
  MOD_DATE DATETIME DEFAULT GETDATE()
);

CREATE INDEX PUSH_ALARM_IDX1 ON OFFICE_PUSH_ALARM (USER_ID);


-- "배치 히스토리" 테이블 DDL
CREATE TABLE OFFICE_BATCH_HISTORY
(
  BATCH_ID int IDENTITY PRIMARY KEY,
  BASE_DATE_STR VARCHAR(8) NOT NULL,
  BATCH_KIND_CODE VARCHAR(50) NOT NULL,
  START_DATE DATETIME,
  END_DATE DATETIME,
  USER_ID VARCHAR(50)
);


-- "부서별_근무_시간_관리" 테이블 DDL
CREATE TABLE OFFICE_DEPT_WORK_TIME_SETTING
(
  DEPT_ID VARCHAR(50) PRIMARY KEY,
  TIME_NAME VARCHAR(100),
  TIME_DESCRIPTION VARCHAR(4000),
  WORK_LOCATION VARCHAR(100),
  WORK_START_TIME VARCHAR(5) NOT NULL,
  WORK_END_TIME VARCHAR(5) NOT NULL,
  LUNCH_START_TIME VARCHAR(5) NOT NULL,
  LUNCH_END_TIME VARCHAR(5) NOT NULL,
  APPLY_START_DATE_STR VARCHAR(8) NOT NULL,
  APPLY_END_DATE_STR VARCHAR(8),
  REG_DATE DATETIME DEFAULT GETDATE(),
  MOD_DATE DATETIME DEFAULT GETDATE(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);


 -- "출퇴근_일일" 테이블 DDL
CREATE TABLE OFFICE_COMMUTE_DAY
(
  BASE_DATE_STR VARCHAR(8) NOT NULL,
  USER_ID VARCHAR(50) NOT NULL,
  START_WORK_DATE DATETIME,
  OUT_WORK_DATE DATETIME,
  FINAL_START_WORK_DATE DATETIME,
  FINAL_OUT_WORK_DATE DATETIME,
  START_WORK_IP VARCHAR(50),
  OUT_WORK_IP VARCHAR(50),
  OUTSIDE_WORK_YN CHAR(1) DEFAULT 'N',
  WORK_STATUS_CODE VARCHAR(50),
  WORK_RESULT_CODE VARCHAR(50),
  VACATION_KIND_CODE VARCHAR(50),
  ETC_DESCRIPTION VARCHAR(4000),
  MOD_YN CHAR(1) DEFAULT 'N',
  TARDY_YN CHAR(1) DEFAULT 'N',
  DEPT_SUBMIT_YN CHAR(1) DEFAULT 'N',
  WORKED_TIME_VALUE NUMERIC(5, 1) DEFAULT 0,
  REG_DATE DATETIME DEFAULT GETDATE(),
  MOD_DATE DATETIME DEFAULT GETDATE(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

CREATE INDEX COMMUTE_DAY_IDX1 ON OFFICE_COMMUTE_DAY (BASE_DATE_STR);
CREATE UNIQUE INDEX COMMUTE_DAY_IDX2 ON OFFICE_COMMUTE_DAY (BASE_DATE_STR, USER_ID);


-- "부서별_출퇴근제출" 테이블 DDL
CREATE TABLE OFFICE_COMMUTE_DEPT_DAY
(
  BASE_DATE_STR VARCHAR(8) NOT NULL,
  DEPT_ID VARCHAR(50) NOT NULL,
  USER_ID VARCHAR(50) NOT NULL,
  SUBMIT_DATE DATETIME NOT NULL,
  MOD_YN CHAR(1) DEFAULT 'N',
  TARDY_YN CHAR(1) DEFAULT 'N',
  COMMUTE_SUBMIT_STATUS_CODE VARCHAR(50) NOT NULL,
  TARGET_COUNT INTEGER NOT NULL,
  START_WORK_COMPLETE_COUNT INTEGER NOT NULL,
  OUT_WORK_COMPLETE_COUNT INTEGER NOT NULL,
  TARDY_COUNT INTEGER DEFAULT 0,
  VACATION_COUNT INTEGER DEFAULT 0,
  SUCCESS_YN CHAR(1) DEFAULT 'N',
  REG_DATE DATETIME DEFAULT GETDATE(),
  MOD_DATE DATETIME DEFAULT GETDATE(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

CREATE INDEX COMMUTE_DEPT_DAY_IDX1 ON OFFICE_COMMUTE_DEPT_DAY (BASE_DATE_STR);
CREATE UNIQUE INDEX COMMUTE_DEPT_DAY_IDX2 ON OFFICE_COMMUTE_DEPT_DAY (BASE_DATE_STR, DEPT_ID);


-- "통계_출퇴근_주간" 테이블 DDL
CREATE TABLE OFFICE_COMMUTE_WEEK_STATS
(
  USER_ID VARCHAR(50) NOT NULL,
  MONDAY_START_DATE_STR VARCHAR(8) NOT NULL,
  SUM_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  MON_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  TUE_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  WED_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  THU_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  FRI_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  SAT_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  SUN_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  REG_DATE DATETIME DEFAULT GETDATE(),
  MOD_DATE DATETIME DEFAULT GETDATE()
);

CREATE INDEX COMMUTE_WEEK_STATS_IDX1 ON OFFICE_COMMUTE_WEEK_STATS (MONDAY_START_DATE_STR);
CREATE UNIQUE INDEX COMMUTE_WEEK_STATS_IDX2 ON OFFICE_COMMUTE_WEEK_STATS (MONDAY_START_DATE_STR, USER_ID);


-- "통계_출퇴근_월간_주별" 테이블 DDL
CREATE TABLE OFFICE_COMMUTE_MONTH_D_STATS
(
  USER_ID VARCHAR(50) NOT NULL,
  BASE_MONTH_STR VARCHAR(6) NOT NULL,
  SUM_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  FIRST_WEEK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  SECOND_WEEK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  THREE_WEEK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  FOUR_WEEK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  FIVE_WEEK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  SIX_WEEK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  REG_DATE DATETIME DEFAULT GETDATE(),
  MOD_DATE DATETIME DEFAULT GETDATE()
);

CREATE INDEX COMMUTE_MONTH_D_STATS_IDX1 ON OFFICE_COMMUTE_MONTH_D_STATS (BASE_MONTH_STR);
CREATE UNIQUE INDEX COMMUTE_MONTH_D_STATS_IDX2 ON OFFICE_COMMUTE_MONTH_D_STATS (BASE_MONTH_STR, USER_ID);


-- "통계_출퇴근_월간_휴일" 테이블 DDL
CREATE TABLE OFFICE_COMMUTE_MONTH_H_STATS
(
  USER_ID VARCHAR(50) NOT NULL,
  BASE_MONTH_STR VARCHAR(6) NOT NULL,
  SUM_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD1_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD2_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD3_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD4_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD5_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD6_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD7_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD8_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD9_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD10_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD11_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD12_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD13_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD14_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD15_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD16_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD17_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD18_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD19_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  HD20_WORK_TIME_VALUE NUMERIC(5, 1) NOT NULL DEFAULT 0,
  REG_DATE DATETIME DEFAULT GETDATE(),
  MOD_DATE DATETIME DEFAULT GETDATE()
);

CREATE INDEX COMMUTE_MONTH_H_STATS_IDX1 ON OFFICE_COMMUTE_MONTH_H_STATS (BASE_MONTH_STR);
CREATE UNIQUE INDEX COMMUTE_MONTH_H_STATS_IDX2 ON OFFICE_COMMUTE_MONTH_H_STATS (BASE_MONTH_STR, USER_ID);


 -- "업무보고" 테이블 DDL
CREATE TABLE OFFICE_WORK_REPORT
(
  REPORT_ID VARCHAR(50) PRIMARY KEY,
  BASE_DATE_STR VARCHAR(8) NOT NULL,
  REPORT_DATE DATETIME,
  USER_ID VARCHAR(50),
  DEPT_ID VARCHAR(50) NOT NULL,
  REPORT_CONTENT TEXT,
  REPORT_SUBMIT_STATUS_CODE VARCHAR(50),
  ISSUE_YN CHAR(1) DEFAULT 'N',
  REG_DATE DATETIME DEFAULT GETDATE(),
  MOD_DATE DATETIME DEFAULT GETDATE(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

CREATE INDEX WORK_REPORT_IDX1 ON OFFICE_WORK_REPORT (BASE_DATE_STR);
CREATE UNIQUE INDEX WORK_REPORT_IDX2 ON OFFICE_WORK_REPORT (BASE_DATE_STR, DEPT_ID);


-- "업무보고_댓글" 테이블 DDL
CREATE TABLE OFFICE_WORK_REPORT_COMMENT
(
  COMMENT_ID VARCHAR(50) PRIMARY KEY,
  REPORT_ID VARCHAR(50) NOT NULL,
  USER_ID VARCHAR(50) NOT NULL,
  COMMENT_CONTENT VARCHAR(4000) NOT NULL,
  REG_DATE DATETIME DEFAULT GETDATE(),
  MOD_DATE DATETIME DEFAULT GETDATE(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

CREATE INDEX WORK_REPORT_COMMENT_IDX1 ON OFFICE_WORK_REPORT_COMMENT (REPORT_ID);


-- "휴가_휴직_현황(연별)" 테이블 DDL
CREATE TABLE OFFICE_VACATION_YEAR
(
  USER_ID VARCHAR(50) NOT NULL,
  BASE_YEAR VARCHAR(4) NOT NULL,
  ANNUAL_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  MONTH_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  USEABLE_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  PLUS_VACATION_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  USED_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  REG_DATE DATETIME DEFAULT GETDATE(),
  MOD_DATE DATETIME DEFAULT GETDATE(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

CREATE INDEX VACATION_YEAR_IDX1 ON OFFICE_VACATION_YEAR (BASE_YEAR);
CREATE UNIQUE INDEX VACATION_YEAR_IDX2 ON OFFICE_VACATION_YEAR (BASE_YEAR, USER_ID);


-- "휴가_휴직_상세" 테이블 DDL
CREATE TABLE OFFICE_VACATION_DETAIL
(
  USER_ID VARCHAR(50) NOT NULL,
  BASE_YEAR VARCHAR(4) NOT NULL,
  SUBMIT_DATE DATETIME,
  APPROVE_DATE DATETIME,
  VACATION_KIND_CODE VARCHAR(50) NOT NULL,
  VACATION_START_DATE_STR VARCHAR(50) NOT NULL,
  VACATION_END_DATE_STR VARCHAR(50) NOT NULL,
  USE_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  VACATION_DESCRIPTION VARCHAR(4000),
  APPROVE_ID VARCHAR(50),
  REG_DATE DATETIME DEFAULT GETDATE(),
  MOD_DATE DATETIME DEFAULT GETDATE()
);

CREATE INDEX VACATION_DETAIL_IDX1 ON OFFICE_VACATION_DETAIL (USER_ID);
CREATE INDEX VACATION_DETAIL_IDX2 ON OFFICE_VACATION_DETAIL (VACATION_START_DATE_STR);


-- "휴가_휴직_상세(일별히스토리)" 테이블 DDL
CREATE TABLE OFFICE_VACATION_DETAIL_DAY_HISTORY
(
  USER_ID VARCHAR(50) NOT NULL,
  VACATION_KIND_CODE VARCHAR(50) NOT NULL,
  BASE_DATE_STR VARCHAR(50) NOT NULL,
  APPROVE_ID VARCHAR(50),
  REG_DATE DATETIME DEFAULT GETDATE(),
  MOD_DATE DATETIME DEFAULT GETDATE()
);

CREATE UNIQUE INDEX VACATION_DETAIL_DAY_HISTORY_IDX1 ON OFFICE_VACATION_DETAIL_DAY_HISTORY (USER_ID, BASE_DATE_STR);


-- "휴가_휴직_현황(포상휴가)" 테이블 DDL
CREATE TABLE OFFICE_VACATION_PLUS
(
  USER_ID VARCHAR(50) NOT NULL,
  BASE_YEAR VARCHAR(4) NOT NULL,
  VACATION_NAME VARCHAR(2000),
  VACATION_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  REG_DATE DATETIME DEFAULT GETDATE(),
  MOD_DATE DATETIME DEFAULT GETDATE(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

CREATE INDEX VACATION_PLUS_IDX1 ON OFFICE_VACATION_PLUS (BASE_YEAR);
CREATE INDEX VACATION_PLUS_IDX2 ON OFFICE_VACATION_PLUS (BASE_YEAR, USER_ID);


-- "통계_휴가_월별_사용현황" 테이블 DDL
CREATE TABLE OFFICE_VACATION_MONTH_STATS
(
  USER_ID VARCHAR(50) NOT NULL,
  BASE_YEAR VARCHAR(4) NOT NULL,
  USE_1MONTH_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  USE_2MONTH_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  USE_3MONTH_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  USE_4MONTH_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  USE_5MONTH_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  USE_6MONTH_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  USE_7MONTH_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  USE_8MONTH_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  USE_9MONTH_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  USE_10MONTH_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  USE_11MONTH_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  USE_12MONTH_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  REG_DATE DATETIME DEFAULT GETDATE(),
  MOD_DATE DATETIME DEFAULT GETDATE()
);

CREATE INDEX VACATION_MONTH_STATS_IDX1 ON OFFICE_VACATION_MONTH_STATS (BASE_YEAR);
CREATE UNIQUE INDEX VACATION_MONTH_STATS_IDX2 ON OFFICE_VACATION_MONTH_STATS (BASE_YEAR, USER_ID);


-- "휴가_휴직_현황(연별)_미리보기" 테이블 DDL
CREATE TABLE OFFICE_VACATION_YEAR_PREVIEW
(
  USER_ID VARCHAR(50) NOT NULL,
  BASE_YEAR VARCHAR(4) NOT NULL,
  ANNUAL_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  MONTH_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  USEABLE_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  PLUS_VACATION_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  USED_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  REG_DATE DATETIME DEFAULT GETDATE(),
  MOD_DATE DATETIME DEFAULT GETDATE(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

CREATE INDEX VACATION_YEAR_PREVIEW_IDX1 ON OFFICE_VACATION_YEAR_PREVIEW (BASE_YEAR);
CREATE UNIQUE INDEX VACATION_YEAR_PREVIEW_IDX2 ON OFFICE_VACATION_YEAR_PREVIEW (BASE_YEAR, USER_ID);


-- "휴가_휴직_현황(포상휴가)_미리보기" 테이블 DDL
CREATE TABLE OFFICE_VACATION_PLUS_PREVIEW
(
  USER_ID VARCHAR(50) NOT NULL,
  BASE_YEAR VARCHAR(4) NOT NULL,
  VACATION_NAME VARCHAR(2000),
  VACATION_COUNT NUMERIC(5, 1) NOT NULL DEFAULT 0,
  REG_DATE DATETIME DEFAULT GETDATE(),
  MOD_DATE DATETIME DEFAULT GETDATE(),
  REG_USER_ID VARCHAR(50),
  MOD_USER_ID VARCHAR(50)
);

CREATE INDEX VACATION_PLUS_PREVIEW_IDX1 ON OFFICE_VACATION_PLUS_PREVIEW (BASE_YEAR);
CREATE INDEX VACATION_PLUS_PREVIEW_IDX2 ON OFFICE_VACATION_PLUS_PREVIEW (BASE_YEAR, USER_ID);


-- "로그인토큰" 테이블 DDL
CREATE TABLE OFFICE_LOGIN_TOKEN
(
  USER_ID VARCHAR(50) NOT NULL,
  LOGIN_TOKEN VARCHAR(200) NOT NULL
);

CREATE INDEX LOGIN_TOKEN_IDX1 ON OFFICE_LOGIN_TOKEN (LOGIN_TOKEN);