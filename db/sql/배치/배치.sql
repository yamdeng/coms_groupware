/*

    구분 : 출퇴근 대상 사용자 목록 
    id : selectCommuteTargetUserList : CommuteMapper.xml

*/
SELECT u.user_id          AS user_id
       ,u.user_key        AS user_key /* 사용자키 */
       ,u.user_name       AS user_name /* 사용자명 */
       ,u.dept_key        AS dept_key /* 부서키 */
       ,u.rank_key        AS rank_key /* 직급명 */
       ,u.duty_key        AS duty_key /* 직책키 */
       ,u.position_key    AS position_key /* 직위키 */
       ,d.dept_name       AS dept_name /* 부서명 */
       ,r.rank_title      AS rank_title /* 직급명 */
       ,du.duty_title     AS duty_title /* 직책명 */
       ,po.position_title AS position_title /* 직위명 */
FROM   to0_user_main u
       LEFT OUTER JOIN to0_dept_mast d
                    ON u.dept_key = d.dept_key
       LEFT OUTER JOIN to0_rank_main r
                    ON u.rank_key = r.rank_key
       LEFT OUTER JOIN to0_duty_main du
                    ON u.duty_key = du.duty_key
       LEFT OUTER JOIN to0_position_main po
                    ON u.position_key = po.position_key
WHERE  r.rank_title NOT IN( '대표이사', '실장' );

/*

       구분 : 출퇴근 일일 정보에 근무상태, 근무결과에 휴가 정보를 기입하기 위한 조회 
       id : selectVacationDetailDayHistoryInfo : VacationMapper.xml
       조건 파라미터
       -기준일자 : baseDateStr
       -로그인한 사용자의 ID : userId

*/
SELECT a.user_id             AS user_id /* 직원ID */
       ,a.reg_date           AS reg_date /* 신청일 */
       ,a.vacation_kind_code AS vacation_kind_code /* 휴가종류 */
       ,a.base_date_str      AS base_date_str /* 휴가일(일별) */
       ,a.approve_id         AS approve_id /* 전자결재 연동ID */
FROM   office_vacation_detail_day_history a
WHERE  base_date_str = '20221203'
       AND user_id = 'yamdeng'; 