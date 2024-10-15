-- MySQL
CREATE TABLE user_tb (
    ucode INT AUTO_INCREMENT PRIMARY KEY,	- 사용자 코드
    uname VARCHAR(50) NOT NULL,				-- 사용자 이름
    uid VARCHAR(50) NOT NULL UNIQUE,		-- 사용자 아이디
    upwd VARCHAR(100) NOT NULL,				-- 사용자 비밀번호
    uemail1 VARCHAR(50) NOT NULL,			-- 사용자 이메일 아이디
    uemail2 VARCHAR(50) NOT NULL				-- 사용자 이메일 도메인
);
