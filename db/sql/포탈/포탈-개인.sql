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
       AND a.user_id = 'yamdeng';

/* 

    구분 : 출근 
    id : startWork 
    조건 파라미터
     -기준일자 : baseDateStr
     -사용자IP : startWorkIp
     -출근상태코드 : workStatusCode
     -출근결과코드 : workResultCode
     -로그인한 사용자의 ID : userId
     -수정 사용자 ID : loginUserId

*/
UPDATE OFFICE_COMMUTE_DAY
SET
    start_work_date = NOW()
    ,start_work_ip = '172.0.0.1'
    ,work_status_code = 'VACATION_MORNING'
    ,work_result_code = 'SUCCESS_NORMAL'
    ,mod_date = NOW()
    ,mod_user_id = 'yamdeng'
WHERE base_date_str = '20221203' and user_id = 'yamdeng';

/* 

    구분 : 퇴근 
    id : outWork 
    조건 파라미터
     -기준일자 : baseDateStr
     -사용자IP : outWorkIp
     -출근상태코드 : workStatusCode
     -출근결과코드 : workResultCode
     -로그인한 사용자의 ID : userId
     -수정 사용자 ID : loginUserId

*/
UPDATE OFFICE_COMMUTE_DAY
SET
    out_work_date = NOW()
    ,out_work_ip = '172.0.0.1'
    ,work_status_code = 'VACATION_MORNING'
    ,work_result_code = 'SUCCESS_NORMAL'
    ,worked_time_value = 0.1
    ,mod_date = NOW()
    ,mod_user_id = 'yamdeng'
WHERE base_date_str = '20221203' and user_id = 'yamdeng';

/* 

    구분 : 로그인한 사용자의 소속 팀원의 출퇴근 상세정보
    id : selectCommuteListByDeptKey
    조건 파라미터
     -기준일자 : baseDateStr
     -부서키 : deptKey

*/
SELECT a.base_date_str                                           AS base_date_str /* 근태기준일 */
       ,a.user_id                                                AS user_id /* 직원ID */
       ,a.start_work_date                                        AS start_work_date /* 최초출근시간 */
       ,a.out_work_date                                          AS out_work_date /* 최초퇴근시간 */
       ,a.final_start_work_date                                  AS final_start_work_date /* 최종출근시간 */
       ,a.final_out_work_date                                    AS final_out_work_date /* 최종퇴근시간 */
       ,a.start_work_ip                                          AS start_work_ip /* 출근IP */
       ,a.out_work_ip                                            AS out_work_ip /* 퇴근IP */
       ,a.outside_work_yn                                        AS outside_work_yn /* 외근여부 */
       ,a.work_status_code                                       AS work_status_code /* 근무상태 */
       ,a.work_result_code                                       AS work_result_code /* 근무결과 */
       ,a.vacation_kind_code                                     AS vacation_kind_code /* 휴가종류 */
       ,fn_get_code_label('WORK_STATUS', a.work_status_code)     AS work_status_code_name /* 근무상태코드명 */
       ,fn_get_code_label('WORK_RESULT', a.work_result_code)     AS work_result_code_name /* 근무결과코드명 */
       ,fn_get_code_label('VACATION_KIND', a.vacation_kind_code) AS vacation_kind_code_name /* 휴가종류코드명 */
       ,a.etc_description                                        AS etc_description /* 기타설명 */
       ,a.mod_yn                                                 AS mod_yn /* 수정여부 */
       ,a.tardy_yn                                               AS tardy_yn /* 지각여부 */
       ,a.worked_time_value                                      AS worked_time_value /* 근무시간 */
       ,a.reg_date                                               AS reg_date /* 등록일 */
       ,a.mod_date                                               AS mod_date /* 수정일 */
       ,a.reg_user_id                                            AS reg_user_id /* 등록자ID */
       ,a.mod_user_id                                            AS mod_user_id /* 수정자ID */
       ,u.user_key                                               AS user_key /* 사용자키 */
       ,u.user_name                                              AS user_name /* 사용자명 */
       ,u.dept_key                                               AS dept_key /* 부서키 */
       ,u.rank_key                                               AS rank_key /* 직급명 */
       ,u.duty_key                                               AS duty_key /* 직책키 */
       ,u.position_key                                           AS position_key /* 직위키 */
       ,d.dept_name                                              AS dept_name /* 부서명 */
       ,r.rank_title                                             AS rank_title /* 직급명 */
       ,du.duty_title                                            AS duty_title /* 직책명 */
       ,po.position_title                                        AS position_title /* 직위명 */
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
WHERE  a.base_date_str = '20221203'
       AND d.dept_key = 'dept1'
LIMIT  2;

/* 

    구분 : 로그인한 사용자의 휴가/휴직(연별) 상세정보
    id : selectVacationInfoByUserId
    조건 파라미터
     -기준일자 : baseYear
     -로그인한 사용자의 ID : userId

*/
SELECT a.user_id              AS user_id /* 직원ID */
       ,a.base_year           AS base_year /* 기준년 */
       ,a.annual_count        AS annual_count /* 발생연차 */
       ,a.month_count         AS month_count /* 금년월차 */
       ,a.useable_count       AS useable_count /* 사용가능일수 */
       ,a.plus_vacation_count AS plus_vacation_count /* 포상휴가 수 */
       ,a.used_count          AS used_count /* 사용일수 */
       ,a.reg_date            AS reg_date /* 등록일 */
       ,a.mod_date            AS mod_date /* 수정일 */
       ,a.reg_user_id         AS reg_user_id /* 등록자ID */
       ,a.mod_user_id         AS mod_user_id /* 수정자ID */
       ,u.user_key            AS user_key /* 사용자키 */
       ,u.user_name           AS user_name /* 사용자명 */
       ,u.dept_key            AS dept_key /* 부서키 */
       ,u.rank_key            AS rank_key /* 직급명 */
       ,u.duty_key            AS duty_key /* 직책키 */
       ,u.position_key        AS position_key /* 직위키 */
       ,d.dept_name           AS dept_name /* 부서명 */
       ,r.rank_title          AS rank_title /* 직급명 */
       ,du.duty_title         AS duty_title /* 직책명 */
       ,po.position_title     AS position_title /* 직위명 */
FROM   office_vacation_year a
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
WHERE  a.base_year = '2022'
       AND a.user_id = 'yamdeng';