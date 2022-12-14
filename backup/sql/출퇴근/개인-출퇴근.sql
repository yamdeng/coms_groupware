-- 특정 월에 지각수
select 
 	'tardy' as kind
 	,count(*) as agg_count
from OFFICE_COMMUTE_DAY
where user_id = 'yamdeng' and substring(base_date_str::varchar,1,6) = '202211'
and tardy_yn = 'Y'
union all
 -- 특정 월에 출근 미체크 수
select 
	'start_work' as kind
	,count(*) as agg_count
from OFFICE_COMMUTE_DAY
where user_id = 'yamdeng' and substring(base_date_str::varchar,1,6) = '202211'
and start_work_date is null
union all
 -- 특정 월에 퇴근 미체크 수
select 
	'out_work' as kind
	,count(*) as agg_count
from OFFICE_COMMUTE_DAY
where user_id = 'yamdeng' and substring(base_date_str::varchar,1,6) = '202211'
and out_work_date is null;



-- 날짜(base_date_str), 부서명(dept_name), 출근IP(start_work_ip), 퇴근IP(out_work_ip),
-- start_work_date, final_start_work_date, out_work_date, final_out_work_date
-- 
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
	,a.work_result_code AS work_result_code /* 근무결과 */
	,fn_get_code_label('WORK_RESULT', a.work_result_code) AS work_result_code_name /* 근무결과코드명 */
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
WHERE a.USER_ID = 'yamdeng' and substring(a.base_date_str::varchar,1,6) = '202211';