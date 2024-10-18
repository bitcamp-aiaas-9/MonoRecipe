-- MySQL
-- 관리자 테이블

CREATE TABLE `admin_tb` (
  `acode` int NOT NULL AUTO_INCREMENT,	-- 관리자 코드
  `aname` varchar(70) NOT NULL,			-- 관리자 이름
  `aid` varchar(50) NOT NULL,			-- 관리자 아이디
  `apwd` varchar(100) NOT NULL,			-- 관리자 비밀번호
  PRIMARY KEY (`acode`),
  UNIQUE KEY `aid` (`aid`)
)