-- MySQL
CREATE TABLE review_tb (
    rcode INT AUTO_INCREMENT PRIMARY KEY,     -- 리뷰 코드
    rdishcode INT,                            -- 음식 코드 (외래키)
    ruserid VARCHAR(50),                      -- 리뷰 아이디 (외래키)
    rscore FLOAT,                             -- 리뷰 평점
    rdate DATETIME DEFAULT CURRENT_TIMESTAMP, -- 리뷰 작성일시
    rcontent TEXT,                            -- 리뷰 내용
    FOREIGN KEY (rdishcode) REFERENCES dish_tb(dcode) ON DELETE CASCADE,  
    FOREIGN KEY (ruserid) REFERENCES user_tb(uid) ON DELETE SET NULL      
);

-- 외래키
-- 음식 삭제 시 리뷰도 삭제
-- 사용자 삭제 시 리뷰 아이디를 NULL 로 설정