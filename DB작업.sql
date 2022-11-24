-- select column 대문자 추출
select concat(',', upper(column_name), ' AS ', upper(column_name))
from information_schema.columns
where table_name = lower('OFFICE_COMMUTE_DAY')
order by ordinal_position;

-- select column 소문자 추출
select concat(',', lower(column_name), ' AS ', lower(column_name))
from information_schema.columns
where table_name = lower('OFFICE_COMMUTE_DAY')
order by ordinal_position;

-- 컬럼 낙타표기법 추출
SELECT concat(',', column_name, ' AS ', (lower(substring(pascal_case,1,1)) || substring(pascal_case,2))) AS camel_case
FROM (
SELECT column_name
	,replace(initcap(replace(column_name, '_', ' ')), ' ', '') As pascal_case
	,CASE WHEN data_type in('character', 'character varying') THEN 'String'
			WHEN data_type in('timestamp without time zone', 'timestamp') THEN 'LocalDateTime'
			WHEN data_type in('numeric') THEN 'Double'
			WHEN data_type in('integer') THEN 'Intger'
            ELSE
             	''
            END AS java_type
FROM information_schema.columns
WHERE table_name = lower('OFFICE_COMMUTE_DAY')
order by ordinal_position) As foo;

-- mybatis select 절 추출
select concat(',', upper(a.column_name), ' AS ', upper(a.column_name), ' /* ', b.COLUMN_COMMENT, ' */')
from information_schema.columns a
	inner join (
		SELECT
			PS.RELNAME AS TABLE_NAME,
			PA.ATTNAME AS COLUMN_NAME,
			PD.DESCRIPTION AS COLUMN_COMMENT
		FROM PG_STAT_ALL_TABLES PS, PG_DESCRIPTION PD, PG_ATTRIBUTE PA
		WHERE PD.OBJSUBID<>0
			AND PS.RELID=PD.OBJOID
			AND PD.OBJOID=PA.ATTRELID
			AND PD.OBJSUBID=PA.ATTNUM
			AND PS.RELNAME= lower('OFFICE_COMMUTE_DAY') ) b
			on a.column_name = b.column_name
where a.table_name = lower('OFFICE_COMMUTE_DAY')
order by a.ordinal_position;

-- java vo 멤버변수 추출
SELECT concat(
	'private ', java_type, ' ', (lower(substring(pascal_case,1,1)) || substring(pascal_case,2)), ';',
	' /* ', COLUMN_COMMENT, ' */'
	) as java_vo_string
FROM (
SELECT a.column_name
	,replace(initcap(replace(a.column_name, '_', ' ')), ' ', '') As pascal_case
	,CASE WHEN a.data_type in('character', 'character varying') THEN 'String'
			WHEN a.data_type in('timestamp without time zone', 'timestamp') THEN 'LocalDateTime'
			WHEN a.data_type in('numeric') THEN 'Double'
			WHEN a.data_type in('integer') THEN 'Intger'
            ELSE
             	''
            END AS java_type
	,b.COLUMN_COMMENT
FROM information_schema.columns a
	inner join (
		SELECT
			PS.RELNAME AS TABLE_NAME,
			PA.ATTNAME AS COLUMN_NAME,
			PD.DESCRIPTION AS COLUMN_COMMENT
		FROM PG_STAT_ALL_TABLES PS, PG_DESCRIPTION PD, PG_ATTRIBUTE PA
		WHERE PD.OBJSUBID<>0
			AND PS.RELID=PD.OBJOID
			AND PD.OBJOID=PA.ATTRELID
			AND PD.OBJSUBID=PA.ATTNUM
			AND PS.RELNAME= lower('OFFICE_COMMUTE_DAY') ) b
			on a.column_name = b.column_name
WHERE a.table_name = lower('OFFICE_COMMUTE_DAY')
order by a.ordinal_position) As data_type_comment;

-- java_type, column_name, camel_case 별도 추출
SELECT java_type, column_name, lower(substring(pascal_case,1,1)) || substring(pascal_case,2) As camel_case
FROM (
SELECT column_name
	,replace(initcap(replace(column_name, '_', ' ')), ' ', '') As pascal_case
	,CASE WHEN data_type in('character', 'character varying') THEN 'String'
			WHEN data_type in('timestamp without time zone', 'timestamp') THEN 'LocalDateTime'
			WHEN data_type in('numeric') THEN 'Double'
			WHEN data_type in('integer') THEN 'Intger'
            ELSE
             	''
            END AS java_type
FROM information_schema.columns
WHERE table_name = lower('OFFICE_COMMUTE_DAY')
order by ordinal_position) As foo;

-- java type 별도 추출
select CASE WHEN data_type in('character', 'character varying') THEN 'String'
			WHEN data_type in('timestamp without time zone', 'timestamp') THEN 'LocalDateTime'
			WHEN data_type in('numeric') THEN 'Double'
			WHEN data_type in('integer') THEN 'Intger'
            ELSE
             	''
            END AS worker_name
FROM information_schema.columns
WHERE table_name = lower('OFFICE_CODE_MASTER')

-- java 멤버 변수 추출(커멘트 제거)
SELECT concat('private ', java_type, ' ', (lower(substring(pascal_case,1,1)) || substring(pascal_case,2)), ';') as java_vo_string
FROM (
SELECT column_name
	,replace(initcap(replace(column_name, '_', ' ')), ' ', '') As pascal_case
	,CASE WHEN data_type in('character', 'character varying') THEN 'String'
			WHEN data_type in('timestamp without time zone', 'timestamp') THEN 'LocalDateTime'
			WHEN data_type in('numeric') THEN 'Double'
			WHEN data_type in('integer') THEN 'Intger'
            ELSE
             	''
            END AS java_type
FROM information_schema.columns
WHERE table_name = lower('OFFICE_COMMUTE_DAY')
order by ordinal_position) As foo;

