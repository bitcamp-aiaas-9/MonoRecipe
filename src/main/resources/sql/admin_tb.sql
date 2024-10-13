-- MySQL
CREATE TABLE admin_tb (
    acode INT PRIMARY KEY AUTO_INCREMENT,   -- 관리자 코드
	aname VARCHAR(70) NOT NULL,             -- 관리자 이름
    aid VARCHAR(50) NOT NULL UNIQUE,        -- 관리자 아이디
    apwd VARCHAR(100) NOT NULL              -- 관리자 비밀번호
);