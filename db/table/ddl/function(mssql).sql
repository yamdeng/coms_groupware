-- code name(라벨) 가져오기 : fn_get_code_label
drop function fn_get_code_label;
CREATE FUNCTION [dbo].[fn_get_code_label](@p_group_code VARCHAR(255), @p_code_value VARCHAR(255))
RETURNS VARCHAR
AS
BEGIN
	
    DECLARE @v_code_label VARCHAR;
   
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
	
    DECLARE @v_result VARCHAR;
   
   select @v_result = SUBSTRING(@p_str, @p_start_number, @p_end_number)

    RETURN @v_result;
END


