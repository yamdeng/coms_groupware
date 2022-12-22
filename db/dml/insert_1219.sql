-- 부서
INSERT INTO
    to0_dept_mast(
        dept_key,
        site_key,
        cor_key,
        upper_dept_key,
        dept_name,
        SHORT_DEPT_NAME,
        tree_path,
        TREE_DEPTH,
        dept_type,
        sort_index
    )
VALUES
    (
        'DepT000000',
        'SITE_COMES',
        'COMES_COR',
        '-1',
        '대표이사',
        '대표이사',
        'tree_path',
        0,
        '0',
        1
    );

INSERT INTO
    to0_dept_mast(
        dept_key,
        site_key,
        cor_key,
        upper_dept_key,
        dept_name,
        SHORT_DEPT_NAME,
        tree_path,
        TREE_DEPTH,
        dept_type,
        sort_index
    )
VALUES
    (
        'Dept000051',
        'SITE_COMES',
        'COMES_COR',
        'DepT000000',
        '연구소',
        '연구소2',
        'tree_path',
        0,
        '0',
        1
    );

INSERT INTO
    to0_dept_mast(
        dept_key,
        site_key,
        cor_key,
        upper_dept_key,
        dept_name,
        SHORT_DEPT_NAME,
        tree_path,
        TREE_DEPTH,
        dept_type,
        sort_index
    )
VALUES
    (
        'Dept000004',
        'SITE_COMES',
        'COMES_COR',
        'DepT000000',
        'QA사업본부',
        'QA사업본부',
        'tree_path',
        0,
        '0',
        1
    );

INSERT INTO
    to0_dept_mast(
        dept_key,
        site_key,
        cor_key,
        upper_dept_key,
        dept_name,
        SHORT_DEPT_NAME,
        tree_path,
        TREE_DEPTH,
        dept_type,
        sort_index
    )
VALUES
    (
        'Dept000050',
        'SITE_COMES',
        'COMES_COR',
        'Dept000004',
        'QA부',
        'QA부',
        'tree_path',
        0,
        '0',
        1
    );

INSERT INTO
    office_commute_day(
        base_date_str,
        user_id,
        start_work_date,
        out_work_date,
        final_start_work_date,
        final_out_work_date,
        start_work_ip,
        out_work_ip,
        outside_work_yn,
        work_status_code,
        work_result_code,
        vacation_kind_code,
        etc_description,
        mod_yn,
        tardy_yn,
        worked_time_value,
        reg_date,
        mod_date,
        reg_user_id,
        mod_user_id
    )
VALUES
    (
        '20221210',
        '202212194',
        CONVERT(DATETIME, '20221211 09:05'),
        CONVERT(DATETIME, '20221211 18:05'),
        null,
        null,
        '10.1.0.0',
        '10.1.0.0',
        'Y',
        'HOME_ING',
        'SUCCESS_NORMAL',
        '',
        'DESC',
        'Y',
        'N',
        8.2,
        getDate(),
        getDate(),
        'system',
        'system'
    );

INSERT INTO
    office_commute_day(
        base_date_str,
        user_id,
        start_work_date,
        out_work_date,
        final_start_work_date,
        final_out_work_date,
        start_work_ip,
        out_work_ip,
        outside_work_yn,
        work_status_code,
        work_result_code,
        vacation_kind_code,
        etc_description,
        mod_yn,
        tardy_yn,
        worked_time_value,
        reg_date,
        mod_date,
        reg_user_id,
        mod_user_id
    )
VALUES
    (
        '20221212',
        '202212194',
        CONVERT(DATETIME, '20221212 09:05'),
        CONVERT(DATETIME, '20221212 18:05'),
        null,
        null,
        '10.1.0.0',
        '10.1.0.0',
        'Y',
        'HOME_ING',
        'SUCCESS_NORMAL',
        '',
        'DESC',
        'Y',
        'N',
        8.2,
        getDate(),
        getDate(),
        'system',
        'system'
    );


insert into TO0_duty_main(duty_key, site_key, duty_title, sort_index, HEADYN)
	values('DT009', 'SITE_COMES', 'PM', 7, 'N');

insert into TO0_duty_main(duty_key, site_key, duty_title, sort_index, HEADYN)
	values('DT010', 'SITE_COMES', 'PL', 8, 'N');