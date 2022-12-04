/*

    구분 : 읽지읂은 알림 count
    id : unreadCountByUserId : AlarmMapper.xml
    조건 파라미터
     -사용자ID : userId

*/

SELECT count(*)
FROM   office_push_alarm
WHERE  user_id = 'yamdeng'
       AND read_date IS NULL; 