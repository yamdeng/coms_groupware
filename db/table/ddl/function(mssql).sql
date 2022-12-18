-- code name(라벨) 가져오기 : fn_get_code_label
drop function fn_get_code_label;
CREATE FUNCTION [dbo].[fn_get_code_label](@p_group_code VARCHAR(255), @p_code_value VARCHAR(255))
RETURNS VARCHAR(255)
AS
BEGIN
	
    DECLARE @v_code_label VARCHAR(255);
   
   select @v_code_label = code_name
	from OFFICE_CODE_MASTER
	where group_code_id = @p_group_code and code_value = @p_code_value;

    RETURN @v_code_label;
END


-- substring custom: fn_app_substring
drop function fn_app_substring;
CREATE FUNCTION [dbo].[fn_app_substring](@p_str VARCHAR(255), @p_start_number INTEGER, @p_end_number INTEGER)
RETURNS VARCHAR
AS
BEGIN
	
    DECLARE @v_result VARCHAR(255);
   
   select @v_result = SUBSTRING(@p_str, @p_start_number, @p_end_number)

    RETURN @v_result;
END


-- to_char custom : fn_app_to_char
drop function fn_app_to_char;
CREATE FUNCTION [dbo].[fn_app_to_char](@p_datetime datetime, @p_dateformat varchar(255))
RETURNS VARCHAR(255)
AS
BEGIN
	
    DECLARE @v_result VARCHAR(255);

   select @v_result = FORMAT(@p_datetime, @p_dateformat);

    RETURN @v_result;
END


-- to_timestamp custom : fn_app_to_timestamp
drop function fn_app_to_timestamp;
CREATE FUNCTION [dbo].[fn_app_to_timestamp](@p_datestr varchar(255))
RETURNS DATETIME
AS
BEGIN
	
    DECLARE @v_result DATETIME;

   select @v_result = CONVERT(DATETIME, @p_datestr)

    RETURN @v_result;
END


-- to_date custom : fn_app_to_date
drop function fn_app_to_date;
CREATE FUNCTION [dbo].[fn_app_to_date](@p_datestr varchar(255))
RETURNS DATETIME
AS
BEGIN
	
    DECLARE @v_result DATETIME;

   select @v_result = CONVERT(DATETIME, @p_datestr)

    RETURN @v_result;
END


-- 다음평일 날짜 가져오기 : fn_get_after_workdate
drop function fn_get_after_workdate;
CREATE FUNCTION [dbo].[fn_get_after_workdate](@p_base_date_str VARCHAR(255))
RETURNS VARCHAR(255)
AS
BEGIN
   
    DECLARE @v_result_date_str varchar(255) = '';
	DECLARE @v_date_str varchar(255) = '';
	DECLARE @v_plusday INTEGER = 1;
	DECLARE @v_plusday_str varchar(255) = '';
	DECLARE @v_holi_date_str varchar(255) = '';
	DECLARE @v_weekday INTEGER = 0;

	SET @v_date_str = @p_base_date_str;

	WHILE (@v_result_date_str = '')
		BEGIN
		
			-- +1 date get
			select @v_date_str = FORMAT(DATEADD(DAY, @v_plusday, @v_date_str), 'yyyyMMdd');
		
			-- 요일 get
			select @v_weekday = DATEPART(WEEKDAY, CONVERT (DATE, @v_date_str));
		
			-- 토요일, 일요일 아니고 : 1 ~ 7 : 일 ~ 토
			IF (@v_weekday != 1) AND (@v_weekday != 7)
			BEGIN
				-- 공휴일 테이블 확인
				select @v_holi_date_str = holi_date_str
				from OFFICE_WORK_HOLIDAY
				where holi_date_str = @v_date_str;
				IF ((@v_holi_date_str) IS NULL) OR (@v_holi_date_str = '')
				BEGIN
					set @v_result_date_str = @v_date_str;
				END;
			END
			
			set @v_plusday = @v_plusday + 1;
		
	    END
   

    RETURN @v_result_date_str;
   
END


-- 업무보고 미제출 체크하기
drop function fn_check_work_report_not_submit;
CREATE FUNCTION [dbo].[fn_check_work_report_not_submit](@p_base_date_str VARCHAR(255), @p_report_date_str VARCHAR(255))
RETURNS integer
AS
BEGIN
   
    DECLARE @v_after_date_str varchar(255) = '';
	DECLARE @v_date_str varchar(255) = '';
	DECLARE @check_result INTEGER = 0;

	-- 1.base_date_str 기준으로 다음 평일의 날짜를 구해옴 : fn_get_after_workdate 함수 사용
	SET @v_after_date_str = dbo.fn_get_after_workdate(@p_base_date_str);

	-- 2.구해온 날짜의 +1 을 더함(24:00 이므로)
	select @v_date_str = FORMAT(DATEADD(DAY, 1, @v_after_date_str), 'yyyyMMdd');

	-- 3.report_date가 2번에서 구해온 날짜보다 크면 미제출 처리
	if ( (@p_report_date_str) IS NOT NULL) AND (@p_report_date_str != '')
	BEGIN
		SELECT @check_result = DATEDIFF(DAY, @p_report_date_str, @v_date_str);
	END
	
    RETURN @check_result;
   
END


-- 입사일 기준으로 근속년수 가져오기 : fn_get_continue_year
drop function fn_get_continue_year;
CREATE FUNCTION [dbo].[fn_get_continue_year](@p_base_year VARCHAR(255), @p_enter_date_str VARCHAR(255))
RETURNS integer
AS
BEGIN
   
    DECLARE @v_result integer = 0;
   	DECLARE @v_base_year_number integer = 0;
  	DECLARE @v_enter_year_number integer = 0;
	DECLARE @v_enter_monthday_str varchar(255) = '';

	-- 기준년 문자열을 숫자로 변환 : p_base_year ---> integer로 변환
	SELECT @v_base_year_number = CAST(@p_base_year AS integer);

	-- 입사일 문자열을 년도 숫자로 변환 : p_enter_date_str ---> integer로 변환
	SELECT @v_enter_year_number = CAST(substring(@p_enter_date_str, 1, 4) AS integer);

	-- 입사일 문자열을 MMDD 형식으로 변환 ---> p_enter_date_str
	select @v_enter_monthday_str = substring(@p_enter_date_str, 5, 4);

	-- 1월1일 경우는 입사일의 이전년도 기준으로 근속연수를 계산함
	IF (@v_enter_monthday_str = '0101')
	BEGIN
		SET @v_enter_year_number = @v_enter_year_number - 1;
	END
	
	-- 근속연수 계산
	SET @v_result = @v_base_year_number - @v_enter_year_number - 1;

	IF (@v_result < 0)
	BEGIN
		set @v_result = 0;
	END

    RETURN @v_result;
   
END