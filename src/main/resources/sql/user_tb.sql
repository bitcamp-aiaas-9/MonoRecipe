-- MySQL
-- 사용자 테이블

CREATE TABLE `user_tb` (
  `ucode` int NOT NULL AUTO_INCREMENT,		-- 사용자 코드
  `uname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,	-- 사용자 이름
  `uid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,		-- 사용자 아이디
  `upwd` varchar(100) NOT NULL,				-- 사용자 비밀번호
  `uemail` varchar(100) NOT NULL,			-- 사용자 이메일
  PRIMARY KEY (`ucode`),
  UNIQUE KEY `uid` (`uid`)
)