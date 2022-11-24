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
LANGUAGE plpgsql