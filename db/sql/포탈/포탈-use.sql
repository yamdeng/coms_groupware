-- 프로필
-- 식별정보, 이름, 부서식별정보, 부서명, 직급식별정보, 직급명 

select *
from TO0_USER_MAIN u
    left outer join TO0_DEPT_MAST d
                on u.dept_key = dept_key
    left outer join TO0_RANK_MAIN r
                on u.rank_key = r.rank_key;
    
TO0_USER_MAIN : 사용자
TO0_DEPT_MAST : 부서
TO0_RANK_MAIN : 직책

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

-- 읽지 않은 알림 수

-- 읽지 않은 알림 목록

-- 알림 읽기(알림 삭제)

-- 출근 update

-- 퇴근 update

-- 금일 출/퇴근 정보

-- 금일 팀 근무 현황 목록

-- 휴가/휴직 현황



