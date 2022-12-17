-- code name(라벨) 가져오기 : fn_get_code_label
create or replace function public.fn_get_code_label(p_group_code varchar, p_code_value varchar)
returns varchar AS
$$
    declare v_code_label varchar := '';
BEGIN

	select code_name into v_code_label
	from public.OFFICE_CODE_MASTER
	where group_code_id = p_group_code and code_value = p_code_value;

    return v_code_label;

END;
$$
LANGUAGE plpgsql;


-- substring custom : fn_app_substring
create or replace function public.fn_app_substring(p_str varchar, p_start_number integer, p_end_number integer)
returns varchar AS
$$
    declare v_result varchar := '';
BEGIN

	select substring(p_str :: VARCHAR, p_start_number, p_end_number) into v_result;

    return v_result;

END;
$$
LANGUAGE plpgsql;


-- to_char custom : fn_app_to_char
drop function fn_app_to_char;
create or replace function public.fn_app_to_char(p_datetime timestamp, p_dateformat varchar)
returns varchar AS
$$
    declare v_result varchar := '';
BEGIN

	select to_char(p_datetime, p_dateformat) into v_result;

    return v_result;

END;
$$
LANGUAGE plpgsql;


-- 다음평일 날짜 가져오기 : fn_get_after_workdate
create or replace function public.fn_get_after_workdate(p_base_date_str varchar)
returns varchar AS
$$
    declare
	v_result_date_str varchar := '';
	v_date_str varchar := '';
	v_plusday INTEGER := 1;
	v_plusday_str varchar := '';
	v_holi_date_str varchar := '';
	v_weekday INTEGER := 0;
BEGIN

	v_plusday_str := v_plusday || ' day';
	v_date_str := p_base_date_str;
	v_result_date_str := '';
	v_plusday := 1;
	
	WHILE v_result_date_str = '' LOOP
	
		-- +1 date get
		SELECT to_char(v_date_str:: date + v_plusday_str:: INTERVAL, 'yyyyMMdd') INTO v_date_str;
		
		-- 요일 get
		select extract(dow from v_date_str:: date) INTO v_weekday;
	
		-- 토요일, 일요일 아니고 : 0 ~ 6 : 일 ~ 토
		IF v_weekday != 0 AND v_weekday != 6 THEN
			-- 공휴일 테이블 확인
			select holi_date_str into v_holi_date_str
			from public.OFFICE_WORK_HOLIDAY
			where holi_date_str = v_date_str;
			IF v_holi_date_str IS NULL OR v_holi_date_str = '' THEN
				v_result_date_str := v_date_str;
				EXIT;
			END IF;
		END IF;
		
		v_plusday := v_plusday + 1;
    END LOOP;

    return v_result_date_str;
END;
$$
LANGUAGE plpgsql;


-- 업무보고 미제출 체크하기
create or replace function public.fn_check_work_report_not_submit(p_base_date_str varchar, p_report_date_str varchar)
returns integer AS
$$
    declare
	v_after_date_str varchar := '';
	v_date_str varchar := '';
	check_result INTEGER := 0;
BEGIN
	
	-- 1.base_date_str 기준으로 다음 평일의 날짜를 구해옴 : fn_get_after_workdate 함수 사용
	v_after_date_str := fn_get_after_workdate(p_base_date_str);
	
	-- 2.구해온 날짜의 +1 을 더함(24:00 이므로)
	SELECT to_char(v_after_date_str:: date + INTERVAL '1 day', 'yyyyMMdd') INTO v_date_str;
	
	-- 3.report_date가 2번에서 구해온 날짜보다 크면 미제출 처리
	if(p_report_date_str IS NOT NULL AND p_report_date_str != '') then
		SELECT date_part('day', p_report_date_str::timestamp - v_date_str::timestamp) INTO check_result;
	end if;

    return check_result;

END;
$$
LANGUAGE plpgsql;


-- 입사일 기준으로 근속년수 가져오기 : fn_get_continue_year
create or replace function public.fn_get_continue_year(p_base_year varchar, p_enter_date_str varchar)
returns integer AS
$$
    declare v_result integer := 0;
	declare v_base_year_number integer := 0;
	declare v_enter_year_number integer := 0;
	declare v_enter_monthday_str varchar := '';
BEGIN
	
	-- 기준년 문자열을 숫자로 변환 : p_base_year ---> integer로 변환
	SELECT CAST(p_base_year AS integer) INTO v_base_year_number;
	
	-- 입사일 문자열을 년도 숫자로 변환 : p_enter_date_str ---> integer로 변환
	SELECT CAST(substring(p_enter_date_str :: VARCHAR, 1, 4) AS integer) INTO v_enter_year_number;
	
	-- 입사일 문자열을 MMDD 형식으로 변환 ---> p_enter_date_str
	select substring(p_enter_date_str :: VARCHAR, 5, 4) INTO v_enter_monthday_str;
	
	-- 1월1일 경우는 입사일의 이전년도 기준으로 근속연수를 계산함
	IF v_enter_monthday_str = '0101' THEN
		v_enter_year_number :=  v_enter_year_number - 1;
	END IF;
	
	-- 근속연수 계산
	v_result := v_base_year_number - v_enter_year_number - 1;
	
	IF v_result < 0 THEN
		v_result := 0;
	END IF;

    return v_result;

END;
$$
LANGUAGE plpgsql;