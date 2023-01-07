with dept_child_list(dept_key, upper_dept_key, dept_name)
		AS
		(
				SELECT a.dept_key,
						a.upper_dept_key,
						a.dept_name
				FROM   to0_dept_mast a
				WHERE  dept_key = 'dept2-1-1'
				UNION ALL
				SELECT a.dept_key,
						a.upper_dept_key,
						a.dept_name
				FROM   to0_dept_mast a,
						dept_child_list b
				WHERE  a.dept_key = b.upper_dept_key )
		select *
		FROM   dept_child_list a;
		SELECT a.dept_key as dept_key,
				a.dept_name as dept_name,
				a.upper_dept_key as upper_dept_key,
			    b.dept_name as upper_dept_name
		FROM   dept_child_list a
			   left outer join to0_dept_mast b
							   on a.dept_key = b.upper_dept_key
		WHERE  a.dept_key != 'dept2-1-1'