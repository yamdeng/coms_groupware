-- 사용자
CREATE TABLE TO0_USER_MAIN
(
  USER_KEY             VARCHAR(15)        NOT NULL,
  SITE_KEY             VARCHAR(15)        NOT NULL,
  DEPT_KEY             VARCHAR(15),
  RANK_KEY             VARCHAR(15),
  POSITION_KEY         VARCHAR(15),
  DUTY_KEY             VARCHAR(15),
  USER_ID              VARCHAR(50)        NOT NULL,
  FIRST_USER_NAME      VARCHAR(50),
  LAST_USER_NAME       VARCHAR(50),
  USER_NAME            VARCHAR(50)        NOT NULL,
  USER_NAME_EN         VARCHAR(50),
  USER_PASS            VARCHAR(200)       NOT NULL,
  EMAIL                VARCHAR(50),
  MOBILE_TEL           VARCHAR(20),
  HOME_TEL             VARCHAR(20),
  COMPANY_TEL          VARCHAR(20),
  FAX_TEL              VARCHAR(20),
  JOIN_TIMESTAMP            TIMESTAMP,
  BIRTHDAY             TIMESTAMP,
  ZIPCODE              VARCHAR(10),
  ADDRESS1             VARCHAR(200),
  ADDRESS2             VARCHAR(200),
  SVC_MAIL_USE_YNL     CHAR(1)             NOT NULL,
  SVC_UC_USE_YNL       CHAR(1)             NOT NULL,
  AUTH_NUM             INTEGER                NOT NULL,
  USE_YNLZ             CHAR(1),
  USER_PASS_ENC_SAVED  VARCHAR(100),
  LOGINTIMESTAMP            TIMESTAMP,
  LOGINIP              VARCHAR(30),
  ABS_KEY              VARCHAR(15),
  ABS_USER_KEY         VARCHAR(15),
  ABS_TITLE            VARCHAR(100),
  ABS_START_TIMESTAMP       TIMESTAMP,
  ABS_END_TIMESTAMP         TIMESTAMP,
  ABS_MENT             VARCHAR(300),
  REG_TIMESTAMP             TIMESTAMP,
  MOD_TIMESTAMP             TIMESTAMP,
  BIRTH_LUNAR          CHAR(1),
  USER_PASS_MOD_TIMESTAMP   TIMESTAMP                     DEFAULT NOW()               NOT NULL,
  SABUN                VARCHAR(50),
  GUSER_IP             VARCHAR(50),
  GENDER               CHAR(1),
  ENTER_ID             VARCHAR(50)
);

-- 부서
CREATE TABLE TO0_DEPT_MAST
(
  DEPT_KEY             VARCHAR(15)        NOT NULL,
  SITE_KEY             VARCHAR(15)        NOT NULL,
  COR_KEY              VARCHAR(15)        NOT NULL,
  UPPER_DEPT_KEY       VARCHAR(15),
  DEPT_NAME            VARCHAR(50)        NOT NULL,
  TREE_PATH            VARCHAR(100)       NOT NULL,
  TREE_DEPTH           INTEGER                NOT NULL,
  DEPT_TYPE            CHAR(1)             NOT NULL,
  SORT_INDEX           INTEGER                  NOT NULL,
  REG_TIMESTAMP             TIMESTAMP,
  MOD_TIMESTAMP             TIMESTAMP,
  SHORT_DEPT_NAME      VARCHAR(50),
  ORI_DEPT_CODE        VARCHAR(30),
  ORI_UPPER_DEPT_CODE  VARCHAR(30)
);

-- 직급
CREATE TABLE TO0_RANK_MAIN
(
  RANK_KEY    VARCHAR(15)                 NOT NULL,
  SITE_KEY    VARCHAR(15)                 NOT NULL,
  RANK_TITLE  VARCHAR(30)                 NOT NULL,
  SORT_INDEX  INTEGER                           NOT NULL,
  REG_TIMESTAMP    TIMESTAMP,
  MOD_TIMESTAMP    TIMESTAMP
);

-- 직위
CREATE TABLE TO0_POSITION_MAIN
(
  POSITION_KEY    VARCHAR(15)             NOT NULL,
  SITE_KEY        VARCHAR(15)             NOT NULL,
  POSITION_TITLE  VARCHAR(30)             NOT NULL,
  SORT_INDEX      INTEGER                        NOT NULL,
  REG_DATE        TIMESTAMP,
  MOD_DATE        TIMESTAMP
);

-- 직책
CREATE TABLE TO0_DUTY_MAIN
(
  DUTY_KEY    VARCHAR(15)                 NOT NULL,
  SITE_KEY    VARCHAR(15)                 NOT NULL,
  DUTY_TITLE  VARCHAR(30)                 NOT NULL,
  SORT_INDEX  INTEGER                           NOT NULL,
  REG_DATE    TIMESTAMP,
  MOD_DATE    TIMESTAMP
);