-- MySQL
CREATE TABLE user_tb (
    ucode INT AUTO_INCREMENT PRIMARY KEY,	- 사용자 코드
    uname VARCHAR(200) NOT NULL,				-- 사용자 이름
    uid VARCHAR(200) NOT NULL UNIQUE,		-- 사용자 아이디
    upwd VARCHAR(100) NOT NULL,				-- 사용자 비밀번호
    uemail VARCHAR(100) NOT NULL            -- 사용자 이메일
);
