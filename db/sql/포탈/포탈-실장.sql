### 포탈-실장 : 28 ###

 1.금일 실장의 하위팀 상단 통계정보 : selectPortalHeadStats
  -변수 : #{baseDateStr}, #{deptKeyList}
  -사용 속성 : 사용자수/부서수, 지각인원수, 휴가/휴직 수, 출/퇴근 미제출 수, 업무보고 이슈 수, 업무보고 미제출 수

-- 실원 수
select 
	'user' as kind
	,count(*) as agg_count
from TO0_USER_MAIN
where dept_key in('dept1', 'dept2')
union all
-- 지각 수
select
	'tardy' as kind
	,count(*) as agg_count
from OFFICE_COMMUTE_DAY a
	inner join TO0_USER_MAIN u
		on u.user_key = a.user_id
where u.dept_key in('dept1', 'dept2')
and a.tardy_yn = 'Y'
and a.base_date_str = '20221119'
-- 휴가/휴직 수
union all
select
	'vacation' as kind
	,count(*) as agg_count
from OFFICE_COMMUTE_DAY a
	inner join TO0_USER_MAIN u
		on u.user_key = a.user_id
where u.dept_key in('dept1', 'dept2')
and a.work_status_code in('code1', 'code2')
and a.base_date_str = '20221119'
union all
-- 출퇴근 미제출 : 이전평일 기준
select 
	'dept_commute_submit' as kind
	,count(*) as agg_count
from OFFICE_COMMUTE_DEPT_DAY a
where a.base_date_str = '20221119'
and a.dept_id in('dept1', 'dept2')
and a.submit_date is not null
-- 업무보고 이슈: 이전평일 기준
union all
select 
	'report_issue' as kind
	,count(*) as agg_count
from OFFICE_WORK_REPORT a
where a.base_date_str = '20221119'
and a.dept_id in('dept1', 'dept2')
and a.issue_yn = 'Y'
union all
-- 업무보고 미제출: 이전평일 기준
select 
	'report_issue' as kind
	,count(*) as agg_count
from OFFICE_WORK_REPORT a
where a.base_date_str = '20221119'
and a.dept_id in('dept1', 'dept2')
and a.report_date is not null;

2.팀원 근무 현황 : selectHeadDeptTodayCommuteList
  -변수 : #{baseDateStr}, #{deptKeyList}
  -사용 속성 : 이름(user_name), 부서명(dept_name), 직급(rank_title), 근무상태(work_status_code_name), 최초출근시간(start_work_date), 최종출근시간(final_start_work_date), 최초퇴근시간(out_work_ip), 최종퇴근시간(final_out_work_date)

  SELECT
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
    ,fn_get_code_label('WORK_STATUS', a.work_status_code) AS work_status_code_name /* 근무상태코드명 */
    ,a.vacation_kind_code AS vacation_kind_code /* 휴가종류 */
    ,a.etc_description AS etc_description /* 기타설명 */
    ,a.mod_yn AS mod_yn /* 수정여부 */
    ,a.tardy_yn AS tardy_yn /* 지각여부 */
    ,a.worked_time_value AS worked_time_value /* 근무시간 */
    ,a.reg_date AS reg_date /* 등록일 */
    ,a.mod_date AS mod_date /* 수정일 */
    ,a.reg_user_id AS reg_user_id /* 등록자ID */
    ,a.mod_user_id AS mod_user_id /* 수정자ID */
	,u.user_name as user_name
	,u.dept_key as dept_key
	,d.dept_name as dept_name
	,r.rank_title as rank_title
	,du.duty_title as duty_title
FROM OFFICE_COMMUTE_DAY a
	left outer join TO0_USER_MAIN u
		on u.user_key = a.user_id
    left outer join TO0_DEPT_MAST d
                on u.dept_key = d.dept_key
    left outer join TO0_RANK_MAIN r
                on u.rank_key = r.rank_key
	left outer join TO0_DUTY_MAIN du
                on u.duty_key = du.duty_key
WHERE a.base_date_str = '20221004'
AND d.dept_key in('dept1', 'dept2');


3.팀 업무 보고 현황 : selectPortalHeadDeptReportList
  -변수 : #{baseDateStr}, #{deptKeyList}
  -사용 속성 : 이름(user_name), 부서명(dept_name), 작성상태(report_submit_status_code_name), 이슈(issue_yn), 코멘트(comment_count)

select
  	a.report_id AS report_id /* 업부보고_ID */
    ,a.base_date_str AS base_date_str /* 보고기준일 */
    ,a.report_date AS report_date /* 보고일(작성일) */
    ,a.user_id AS user_id /* 작성자 */
    ,a.dept_id AS dept_id /* 부서 */
    ,a.report_content AS report_content /* 보고내용 */
    ,a.report_submit_status_code AS report_submit_status_code /* 업무보고 제출상태 */
    ,fn_get_code_label('REPORT_STATUS', a.report_submit_status_code) AS report_submit_status_code_name /* 업무보고 제출상태 코드명 */
    ,a.issue_yn AS issue_yn /* 이슈 여부 */
    ,a.reg_date AS reg_date /* 등록일 */
    ,a.mod_date AS mod_date /* 수정일 */
    ,a.reg_user_id AS reg_user_id /* 등록자ID */
    ,a.mod_user_id AS mod_user_id /* 수정자ID */
    ,(select count(*) from OFFICE_WORK_REPORT_COMMENT where report_id = '') as comment_count /* 업무보고 댓글 count */
    ,d.dept_name /* 부서명 */
from OFFICE_WORK_REPORT a
left outer join TO0_DEPT_MAST d
                on a.dept_id = d.dept_key
where a.base_date_str = '20220101'
and a.dept_id in('dept1', 'dept2');