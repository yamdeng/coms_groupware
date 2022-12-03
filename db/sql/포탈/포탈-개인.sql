/* 

    구분 : 로그인한 사용자의 출퇴근 상세정보 : 출퇴근 상세정보의 기준이됨 
    id : selectCommuteInfoByUserId 
    조건 파라미터
     -기준일자 : baseDateStr
     -로그인한 사용자의 ID : userId


*/

SELECT a.base_date_str          AS base_date_str /* 근태기준일 */
       ,a.user_id               AS user_id /* 직원ID */
       ,a.start_work_date       AS start_work_date /* 최초출근시간 */
       ,a.out_work_date         AS out_work_date /* 최초퇴근시간 */
       ,a.final_start_work_date AS final_start_work_date /* 최종출근시간 */
       ,a.final_out_work_date   AS final_out_work_date /* 최종퇴근시간 */
       ,a.start_work_ip         AS start_work_ip /* 출근IP */
       ,a.out_work_ip           AS out_work_ip /* 퇴근IP */
       ,a.outside_work_yn       AS outside_work_yn /* 외근여부 */
       ,a.work_status_code      AS work_status_code /* 근무상태 */
       ,a.work_result_code      AS work_result_code /* 근무결과 */
       ,a.vacation_kind_code    AS vacation_kind_code /* 휴가종류 */
       ,fn_get_code_label('WORK_STATUS', a.work_status_code) AS work_status_code_name /* 근무상태코드명 */
       ,fn_get_code_label('WORK_RESULT', a.work_result_code) AS work_result_code_name /* 근무결과코드명 */
       ,fn_get_code_label('VACATION_KIND', a.vacation_kind_code) AS vacation_kind_code_name /* 휴가종류코드명 */
       ,a.etc_description       AS etc_description /* 기타설명 */
       ,a.mod_yn                AS mod_yn /* 수정여부 */
       ,a.tardy_yn              AS tardy_yn /* 지각여부 */
       ,a.worked_time_value     AS worked_time_value /* 근무시간 */
       ,a.reg_date              AS reg_date /* 등록일 */
       ,a.mod_date              AS mod_date /* 수정일 */
       ,a.reg_user_id           AS reg_user_id /* 등록자ID */
       ,a.mod_user_id           AS mod_user_id /* 수정자ID */
       ,u.user_key              AS user_key /* 사용자키 */
       ,u.user_name             AS user_name /* 사용자명 */
       ,u.dept_key              AS dept_key /* 부서키 */
       ,u.rank_key              AS rank_key /* 직급명 */
       ,u.duty_key              AS duty_key /* 직책키 */
       ,u.position_key          AS position_key /* 직위키 */
       ,d.dept_name             AS dept_name /* 부서명 */
       ,r.rank_title            AS rank_title /* 직급명 */
       ,du.duty_title           AS duty_title /* 직책명 */
       ,po.position_title       AS position_title /* 직위명 */
FROM   office_commute_day a
       LEFT OUTER JOIN to0_user_main u
                    ON u.user_key = a.user_id
       LEFT OUTER JOIN to0_dept_mast d
                    ON u.dept_key = d.dept_key
       LEFT OUTER JOIN to0_rank_main r
                    ON u.rank_key = r.rank_key
       LEFT OUTER JOIN to0_duty_main du
                    ON u.duty_key = du.duty_key
       LEFT OUTER JOIN to0_position_main po
                    ON u.position_key = po.position_key
WHERE  a.base_date_str = '20221126'
       AND a.user_id = 'yamdeng' 