===> DDW
SELECT
    D.DEPT_ID,
    NVL(DW.SETTING_TIME, 기본정책시간)
FROM DEPT D
     LEFT OUTER JOIN DEPT_WORK DW
            ON D.DEPT_ID = DW.DEPT_ID

==> 팀장 조회
SELECT *
FROM USER U
WHERE U.직급 = '팀장'

===> 출퇴근 보고 : 자기자신 체크
SELECT *
FROM USER U
     INNER JOIN DDW
            ON DDW.DEPT_ID AND U.DEPT_ID
     INNER JOIN 출퇴근_일일 COM
            ON COM.USER_ID = U.USER_ID
            AND COM.기준년월일 = '#{기준년월일}'
WHERE COM.근무상태 = '아무것도 않한 상태'
-- 자바에서 필터할려면 여기까지
AND DDW.SETTING_TIME > '전달받은 시간' AND DDW.SETTING_TIME <= '전달받은 시간' + 10분

===> 출퇴근 보고 : 팀장인 경우 팀원 체크
@.사전에 팀장을 조회옴

SELECT *
FROM USER U
     INNER JOIN DDW
            ON DDW.DEPT_ID AND U.DEPT_ID
     INNER JOIN 출퇴근_일일 COM
            ON COM.USER_ID = U.USER_ID
            AND COM.기준년월일 = '#{기준년월일}'
WHERE COM.근무상태 = '아무것도 않한 상태'
AND DDW.DEPT_CD = '팀장의 부서ID'
AND DDW.SETTING_TIME > '전달받은 시간' AND DDW.SETTING_TIME <= '전달받은 시간' + 10분