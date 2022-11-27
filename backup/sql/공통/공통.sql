-- 하위 부서 전체 목록 가져오기
with recursive dept_child_list(dept_key, dept_name, upper_dept_key) as (
	select a.dept_key, a.upper_dept_key, a.dept_name
	from to0_dept_mast a
	where dept_key = 'dept1-1'
	union all 
	select a.dept_key, a.upper_dept_key, a.dept_name
	from to0_dept_mast a, dept_child_list b
	where a.upper_dept_key = b.dept_key
)
select dept_key, dept_name, upper_dept_key
from dept_child_list;

-- 프로필
-- 식별정보, 이름, 부서식별정보, 부서명, 직급식별정보, 직급명 

/* 등록일 */

select a.*
	,u.user_name as user_name
	,u.dept_key as dept_key
	,d.dept_name as dept_name
	,r.rank_title as rank_title
	,du.duty_title as duty_title
from 
	left outer join TO0_USER_MAIN u
		on u.user_key = a.user_id
    left outer join TO0_DEPT_MAST d
                on u.dept_key = d.dept_key
    left outer join TO0_RANK_MAIN r
                on u.rank_key = r.rank_key
	left outer join TO0_DUTY_MAIN du
                on du.duty_key = du.duty_key

-- 읽지 않은 알림 수

-- 읽지 않은 알림 목록

-- 알림 읽기(알림 삭제)

-- 출근 update

-- 퇴근 update

-- 금일 출/퇴근 정보

-- 금일 팀 근무 현황 목록

-- 휴가/휴직 현황