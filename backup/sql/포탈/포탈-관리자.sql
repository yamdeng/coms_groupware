### 포탈-관리자 : 30 ~ 31 ###

 1.금일 관리자 상단 통계정보(전체현황) : selectPortalAdminAllStats
  -변수 : #{baseDateStr}
  -사용 속성 : 사용자수/부서수, 지각인원수, 휴가/휴직 수, 출/퇴근 미제출 수, 업무보고 이슈 수, 업무보고 미제출 수

-- 임직원 수
select 
	'user' as kind
	,count(*) as agg_count
from TO0_USER_MAIN
union all
-- 부서 수
select
	'dept' as kind
	,count(*) as agg_count
from TO0_DEPT_MAST
union all
-- 지각 임직원 수
select
	'tardy' as kind
	,count(*) as agg_count
from OFFICE_COMMUTE_DAY a
	inner join TO0_USER_MAIN u
		on u.user_key = a.user_id
where a.tardy_yn = 'Y' and a.base_date_str = '20221119'
union all
-- 출퇴근 미제출 부서
select 
	'dept_commute' as kind
	,count(*) as agg_count
from OFFICE_COMMUTE_DEPT_DAY
where base_date_str = '20221119' and submit_date is null
union all
-- 업무보고 등록
select 
	'report_submit' as kind
	,count(*) as agg_count
from OFFICE_WORK_REPORT
where base_date_str = '20221119' and report_date is not null
union all
-- 미결재 현황
select 
	'approve' as kind
	,10 as agg_count


 2.금일 관리자 상단 통계정보(출퇴근) : selectPortalAdminCommuteStats
  -변수 : #{baseDateStr}
  -사용 속성 : 제출전, 반려, 제출완료, 승인완료

-- 출근 제출전 팀 count
select 
	'before_submit' as kind
	,count(*) as agg_count
from OFFICE_COMMUTE_DEPT_DAY
where base_date_str = '20221119' and submit_date is null
union all
-- 출근 반려 팀 count
select 
	'reject' as kind
	,count(*) as agg_count
from OFFICE_COMMUTE_DEPT_DAY
where base_date_str = '20221119' and COMMUTE_SUBMIT_STATUS_CODE = '반려'
union all
-- 출근 제출 완료 팀 count
select 
	'after_submit' as kind
	,count(*) as agg_count
from OFFICE_COMMUTE_DEPT_DAY
where base_date_str = '20221119' and submit_date is not null
union all
-- 출근 승인완료 팀 count
select 
	'approve_complete' as kind
	,count(*) as agg_count
from OFFICE_COMMUTE_DEPT_DAY
where base_date_str = '20221119' and COMMUTE_SUBMIT_STATUS_CODE = '반려'


3.금일 관리자 상단 통계정보(업무보고) : selectPortalAdminReportStats
  -변수 : #{baseDateStr}
  -사용 속성 : 등록, 미제출, 이슈, 코멘트

-- 등록
select 
	'regist' as kind
	,count(*) as agg_count
from OFFICE_WORK_REPORT
where base_date_str = '20221119' and report_date is not null
union all
-- 미제출
select 
	'no_regist' as kind
	,count(*) as agg_count
from OFFICE_WORK_REPORT
where base_date_str = '20221119' and report_date is null
union all
-- 이슈
select 
	'issue' as kind
	,count(*) as agg_count
from OFFICE_WORK_REPORT
where base_date_str = '20221119' and issue_yn = 'Y'
union all
-- 코멘트
select 
	'comment' as kind
	,count(distinct a.report_id) as agg_count
from OFFICE_WORK_REPORT a
	inner join OFFICE_WORK_REPORT_COMMENT c
		ON a.report_id = c.report_id
where a.base_date_str = '20221119'

4.전체 출퇴근 현황 : selectPortalAdminCommuteDeptList
  -변수 : #{baseDateStr}
  -사용 속성 : 부서명(dept_name), 팀장명(user_name), 연락처(mobile_tel), 상태(commute_submit_status_code_name)

select 
	a.base_date_str AS base_date_str /* 제출기준일 */
	,a.dept_id AS dept_id /* 제출부서 */
	,a.user_id AS user_id /* 제출자(팀장) */
	,a.submit_date AS submit_date /* 제출일 */
	,a.mod_yn AS mod_yn /* 수정여부 */
	,a.tardy_yn AS tardy_yn /* 지각여부 */
	,a.commute_submit_status_code AS commute_submit_status_code /* 출/퇴근 제출상태 */
  ,fn_get_code_label('COMMUTE_DEPT_STATUS', a.commute_submit_status_code) AS commute_submit_status_code_name /* 출/퇴근 제출상태코드명 */
	,a.target_count AS target_count /* 제출대상수 */
	,a.start_work_complete_count AS start_work_complete_count /* 출근완료 합계 */
	,a.out_work_complete_count AS out_work_complete_count /* 퇴근완료 합계 */
	,a.reg_date AS reg_date /* 등록일 */
	,a.mod_date AS mod_date /* 수정일 */
	,a.reg_user_id AS reg_user_id /* 등록자ID */
	,a.mod_user_id AS mod_user_id /* 수정자ID */
	,d.dept_name
	,u.user_name
	,u.mobile_tel
from OFFICE_COMMUTE_DEPT_DAY a
	left outer join TO0_DEPT_MAST d
                on a.dept_id = d.dept_key
	left outer join TO0_USER_MAIN u
		on u.dept_key = a.dept_id
	left outer join TO0_DUTY_MAIN du
                on u.duty_key = du.duty_key
where a.base_date_str = '20221119'
and du.duty_key = '팀장';

5.전체 연차 현황 : selectPortalAdminVacationUserList
  -변수 : #{baseDateStr}
  -사용 속성 : 이름(user_name), 휴가종류(vacation_kind_code_name), vacation_kind_code

select 
	a.base_date_str AS base_date_str /* 근태기준일 */
	,a.user_id AS user_id /* 직원ID */
	,a.start_work_date AS start_work_date /* 최초출근시간 */
	,a.out_work_date AS out_work_date /* 최초퇴근시간 */
	,a.final_start_work_date AS final_start_work_date /* 최종출근시간 */
	,a.final_out_work_date AS final_out_work_date /* 최종퇴근시간 */
	,a.start_work_ip AS start_work_ip /* 출근IP */
	,a.out_work_ip AS out_work_ip /* 퇴근IP */
	,a.outside_work_yn AS outside_work_yn /* 외근여부 */
	,a.work_status_code AS work_status_code /* 근무상태 */
	,a.vacation_kind_code AS vacation_kind_code /* 휴가종류 */
	,fn_get_code_label('VACATION_KIND', a.vacation_kind_code) AS vacation_kind_code_name /* 휴가종류코드명 */
	,a.etc_description AS etc_description /* 기타설명 */
	,a.mod_yn AS mod_yn /* 수정여부 */
	,a.tardy_yn AS tardy_yn /* 지각여부 */
	,a.worked_time_value AS worked_time_value /* 근무시간 */
	,a.reg_date AS reg_date /* 등록일 */
	,a.mod_date AS mod_date /* 수정일 */
	,a.reg_user_id AS reg_user_id /* 등록자ID */
	,a.mod_user_id AS mod_user_id /* 수정자ID */
	,u.user_name
from OFFICE_COMMUTE_DAY a
	left outer join TO0_USER_MAIN u
		on u.user_key = a.user_id
where a.base_date_str = '20221119'
and vacation_kind_code is not null;