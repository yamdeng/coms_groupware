-- 코드 : 출퇴근상태
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_STATUS', 'ING', '업무중', 1);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_STATUS', 'HOME_ING', '재택중', 2);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_STATUS', 'END', '업무종료', 3);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_STATUS', 'VACATION_YEAR', '연차', 4);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_STATUS', 'VACATION_MORNING', '오전반차', 5);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_STATUS', 'VACATION_AFTERNOON', '오후반차', 6);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_STATUS', 'VACATION_NATION', '공가', 7);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_STATUS', 'VACATION_REPLACE', '대체휴가', 8);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_STATUS', 'VACATION_CON', '경조휴가', 9);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_STATUS', 'VACATION_PRIZE', '포상휴가', 10);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_STATUS', 'VACATION_BABY', '출산휴가', 11);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_STATUS', 'VACATION_CARE', '육아휴직', 12);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_STATUS', 'VACATION_NORMAL', '일반휴직', 13);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_STATUS', 'VACATION_ETC', '기타휴가', 99);

-- 코드 : 출퇴근결과
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_RESULT', 'SUCCESS_NORMAL', '정상출근', 1);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_RESULT', 'SUCCESS_MORNING', '정상출근(오전반차)', 2);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_RESULT', 'SUCCESS_AFTERNOON', '정상출근(오후반차)', 3);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_RESULT', 'SUCCESS_BIRTHDAY', '정상출근(생일)', 4);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_RESULT', 'TARDY', '지각', 5);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_RESULT', 'TARDY_BIRTHDAY', '지각(생일)', 6);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_RESULT', 'TARDY_MORNING', '지각(오전반차)', 7);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_RESULT', 'TARDY_AFTERNOON', '지각(오후반차)', 8);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_RESULT', 'VACATION_YEAR', '연차', 9);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_RESULT', 'VACATION_NATION', '공가', 10);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_RESULT', 'VACATION_REPLACE', '대체휴가', 11);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_RESULT', 'VACATION_CON', '경조휴가', 12);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_RESULT', 'VACATION_PRIZE', '포상휴가', 13);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_RESULT', 'VACATION_BABY', '출산휴가', 14);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_RESULT', 'VACATION_CARE', '육아휴직', 15);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_RESULT', 'VACATION_NORMAL', '일반휴직', 16);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_RESULT', 'VACATION_ETC', '기타휴가', 17);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_RESULT', 'ABSENT', '결근', 18);	
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WORK_RESULT', 'ETC', '기타', 99);

-- 코드 : 휴가종류
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('VACATION_KIND', 'VACATION_YEAR', '연차', 1);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('VACATION_KIND', 'VACATION_MORNING', '오전반차', 2);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('VACATION_KIND', 'VACATION_AFTERNOON', '오후반차', 3);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('VACATION_KIND', 'VACATION_NATION', '공가', 4);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('VACATION_KIND', 'VACATION_REPLACE', '대체휴가', 5);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('VACATION_KIND', 'VACATION_CON', '경조휴가', 6);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('VACATION_KIND', 'VACATION_PRIZE', '포상휴가', 7);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('VACATION_KIND', 'VACATION_BABY', '출산휴가', 8);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('VACATION_KIND', 'VACATION_CARE', '육아휴직', 9);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('VACATION_KIND', 'VACATION_NORMAL', '일반휴직', 10);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('VACATION_KIND', 'VACATION_BIRTHDAY', '생일', 11);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('VACATION_KIND', 'VACATION_ETC', '기타휴가', 99);

-- 코드 : 부서 출퇴근 제출 상태
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('COMMUTE_DEPT_STATUS', 'SUBMIT', '제출', 1);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('COMMUTE_DEPT_STATUS', 'NOT_SUBMIT', '미제출', 2);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('COMMUTE_DEPT_STATUS', 'APPROVE', '승인', 3);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('COMMUTE_DEPT_STATUS', 'REJECT', '반려', 4);
	
-- 코드 : 업무보고 제출 상태
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('REPORT_STATUS', 'SUBMIT', '제출', 1);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('REPORT_STATUS', 'NOT_SUBMIT', '미제출', 2);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('REPORT_STATUS', 'APPROVE', '승인', 3);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('REPORT_STATUS', 'REJECT', '반려', 4);


-- 코드 : 요일구분 코드
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WEEKDAY', 'MON', '월요일', 1);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WEEKDAY', 'TUE', '화요일', 2);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WEEKDAY', 'WED', '수요일', 3);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WEEKDAY', 'THU', '목요일', 4);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WEEKDAY', 'FRI', '금요일', 5);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WEEKDAY', 'SAT', '토요일', 6);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WEEKDAY', 'SUN', '일요일', 7);

-- 코드 : 주중/주말구분 코드
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WEEKEND', 'WEEKDAY', '주중', 1);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WEEKEND', 'WEEKEND', '주말', 2);

-- 코드 : 푸쉬 알림 코드
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('ALARM', 'NOTICE', '공지사항', 1);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('ALARM', 'COMMUTE_PRIVATE', '개인출퇴근', 2);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('ALARM', 'COMMUTE_MANAGER', '팀장의팀원출퇴근', 3);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('ALARM', 'COMMUTE_DEPT_SUBMIT', '부서출퇴근제출', 4);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('ALARM', 'COMMUTE_DEPT_REJECT', '부서출퇴근반려', 5);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('ALARM', 'REPORT_SUBMIT', '부서업무보고제출', 6);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('ALARM', 'REPORT_COMMENT', '부서업무보고댓글', 7);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('ALARM', 'REPORT_ISSUE', '부서업무보고이슈', 8);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('ALARM', 'COMMUTE_DEPT_SUBMIT_COMPLETE', '부서출퇴근제출완료', 9);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('ALARM', 'REPORT_SUBMIT_COMPLETE', '부서업무보고제출완료', 10);

-- 코드 : 출퇴근 통계 종류
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('COMMUTE_SUMMARY_STATS_KIND', 'WEEK', '주간', 1);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('COMMUTE_SUMMARY_STATS_KIND', 'MONTH_WEEK', '월간(주별)', 2);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('COMMUTE_SUMMARY_STATS_KIND', 'MONTH_HOLIDAY', '월간(휴일)', 3);

-- 코드 : 하루 근무시간 기준(8)
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('DAY_NORMAL_WORK_TIME_BASE', 'LESS', '근무시간 8시간 미만', 1);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('DAY_NORMAL_WORK_TIME_BASE', 'GREATER', '근무시간 8시간 초과', 2);

-- 코드 : 일주일 근무시간 기준(52)
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WEEK_NORMAL_WORK_TIME_BASE', 'LESS', '근무시간 주 52시간 미만', 1);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('WEEK_NORMAL_WORK_TIME_BASE', 'GREATER', '근무시간 주 52시간 초과', 2);

-- 코드 : 포상휴가 부여 기준
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('PRIZE_VACATION_YEAR', '1', '입사일 기준 1년 이상인 직원', 1);
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('PRIZE_VACATION_YEAR', '10', '입사일 기준 10년 이상인 직원', 2);

-- 코드 : 배치종류
INSERT INTO office_code_master(group_code_id, code_value, code_name, sort_index)
	VALUES ('BATCH_KIND', 'COMMUTE_DAY', '일일 출퇴근 적재', 1);


	