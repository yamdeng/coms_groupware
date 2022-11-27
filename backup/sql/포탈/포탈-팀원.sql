### 포탈-팀원 : 17 ###

 1.현재 로그인한 사용자의 출퇴근 정보 : selectLoginUserTodayCommuteInfo
  -변수 : #{baseDateStr}, #{userId}
  -사용 속성 : 출근 IP(start_work_ip), 근무상태(work_status_code_name), 최초출근시간(start_work_date), 최종출근시간(final_start_work_date), 최초퇴근시간(out_work_ip), 최종퇴근시간(final_out_work_date)
   ===> 출근시간, 퇴근시간은 마지막이 존재하면 해당 값으로 전달

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
WHERE A.BASE_DATE_STR = '20221004'
AND A.USER_ID = 'yamdeng';


 2.오늘의 휴가 휴직 현황 : selectLoginUserTodayVacationInfo
  -변수 : #{baseYear}, #{userId}
  -사용 속성 : 총연차(annual_count + plus_vacation_count), 사용연차(used_count), 잔여연차(useable_count)

 SELECT
	a.user_id AS user_id /* 직원ID */
	,a.base_year AS base_year /* 기준년 */
	,a.annual_count AS annual_count /* 발생연차 */
	,a.month_count AS month_count /* 금년월차 */
	,a.useable_count AS useable_count /* 사용가능일수 */
	,a.plus_vacation_count AS plus_vacation_count /* 포상휴가 수 */
	,a.used_count AS used_count /* 사용일수 */
	,a.reg_date AS reg_date /* 등록일 */
	,a.mod_date AS mod_date /* 수정일 */
	,a.reg_user_id AS reg_user_id /* 등록자ID */
	,a.mod_user_id AS mod_user_id /* 수정자ID */
	,u.user_name as user_name
	,u.dept_key as dept_key
	,d.dept_name as dept_name
	,r.rank_title as rank_title
	,du.duty_title as duty_title
FROM OFFICE_VACATION_YEAR a
	left outer join TO0_USER_MAIN u
		on u.user_key = a.user_id
    left outer join TO0_DEPT_MAST d
                on u.dept_key = d.dept_key
    left outer join TO0_RANK_MAIN r
                on u.rank_key = r.rank_key
	left outer join TO0_DUTY_MAIN du
                on du.duty_key = du.duty_key
WHERE A.BASE_YEAR = '2022'
AND A.USER_ID = 'yamdeng';

3.팀원 근무 현황 : selectDeptTodayCommuteList
  -변수 : #{baseDateStr}, #{deptId}
  -사용 속성 : 이름(user_name), 직급(rank_title), 직책(duty_title), 근무상태(work_status_code_name)

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
                on du.duty_key = du.duty_key
WHERE a.base_date_str = '20221004'
AND d.dept_key = 'dept1';

4.출근 / 퇴근 여부 확인 : selectLoginUserTodayCommuteInfo
 -변수 : #{baseDateStr}, #{userId}
 -최초출근시간(start_work_date), 최초퇴근시간(out_work_ip)

5.출근
 -변수 : #{baseDateStr}, #{userId}
UPDATE OFFICE_COMMUTE_DAY
SET start_work_date = NOW(), start_work_ip = '10.1.1.1', work_status_code = '재택/업무중'
WHERE base_date_str = '20221003' AND user_id = 'yamdeng';

6.퇴근
 -변수 : #{baseDateStr}, #{userId}
UPDATE OFFICE_COMMUTE_DAY
SET out_work_date = NOW(), out_work_ip = '10.1.1.1', work_status_code = '재택/업무중'
WHERE base_date_str = '20221003' AND user_id = 'yamdeng';

