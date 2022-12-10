SELECT 'all'     AS kind /* 업무보고 */
       ,count(*) AS agg_count
FROM   office_work_report
WHERE  base_date_str = '20221203'
UNION ALL
SELECT 'submit'  AS kind /* 제출 */
       ,count(*) AS agg_count
FROM   office_work_report
WHERE  base_date_str = '20221203'
       AND report_date IS NOT NULL
UNION ALL
SELECT 'report_not_submit'    AS kind /* 미제출 */
       ,coalesce(sum(CASE
                       WHEN report_date IS NULL
                            AND base_date_str <= 'twoBeforeWorkDateStr' THEN 1
                       WHEN fn_check_work_report_not_submit(base_date_str, to_char(report_date, 'yyyyMMdd')) >= 0 THEN 1
                       ELSE 0
                     end), 0) AS agg_count
FROM   office_work_report a
WHERE  base_date_str = '20221203'
UNION ALL
SELECT 'report_issue' AS kind /* 업무보고 이슈 수 */
       ,count(*)      AS agg_count
FROM   office_work_report a
WHERE  base_date_str = '20221203'
       AND issue_yn = 'Y'
UNION ALL
SELECT 'comment'                    AS kind /* 코멘트 */
       ,count(DISTINCT a.report_id) AS agg_count
FROM   office_work_report a
       INNER JOIN office_work_report_comment c
               ON a.report_id = c.report_id
WHERE  a.base_date_str = '20221203'; 