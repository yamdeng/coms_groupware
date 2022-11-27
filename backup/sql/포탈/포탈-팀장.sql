### 포탈-팀장 : 27 ###

 1.현재 로그인한 사용자의 출퇴근 정보 : selectLoginUserTodayCommuteInfo
  -변수 : #{baseDateStr}, #{userId}
  -사용 속성 : 출근 IP(start_work_ip), 근무상태(work_status_code_name), 최초출근시간(start_work_date), 최종출근시간(final_start_work_date), 최초퇴근시간(out_work_ip), 최종퇴근시간(final_out_work_date)
   ===> 출근시간, 퇴근시간은 마지막이 존재하면 해당 값으로 전달

 2.팀원 근무/출퇴근 현황 : selectDeptTodayCommuteList
  -변수 : #{baseDateStr}, #{deptId}
  -사용 속성 : 이름(user_name), 직급(rank_title), 근무상태(work_status_code_name), 최초출근시간(start_work_date), 최종출근시간(final_start_work_date), 최초퇴근시간(out_work_ip), 최종퇴근시간(final_out_work_date)


 3.업무보고 현황 : selectPortalDeptReportList
  -변수 : #{baseDateStr}, #{deptId}
  -사용 속성 : 보고일(base_date_str), 작성일(report_date), 업무보고 제출상태명(report_submit_status_code_name)

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
from OFFICE_WORK_REPORT a
where base_date_str between '20220101' and '20220103'
and dept_id = 'dept1';
