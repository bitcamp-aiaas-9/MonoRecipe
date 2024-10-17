-- MySQL
CREATE TABLE favorite_tb (
    fcode INT AUTO_INCREMENT PRIMARY KEY,	-- 즐겨찾기 코드
    fuserid VARCHAR(50),					-- 사용자 코드 (user_tb 외래키)
    fdishcode INT,							-- 음식 코드 (dish_tb 외래키)
    UNIQUE (fuserid, fdishcode),			-- 사용자와 음식의 중복 방지
    FOREIGN KEY (fuserid) REFERENCES user_tb(uid) ON DELETE CASCADE,
    FOREIGN KEY (fdishcode) REFERENCES dish_tb(dcode) ON DELETE CASCADE
);

-- 외래키
-- 사용자 테이블과의 외래키 관계
-- 음식 테이블과의 외래키 관계