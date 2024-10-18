-- MySQL
CREATE TABLE review_tb (
    rcode INT AUTO_INCREMENT PRIMARY KEY,     		-- 리뷰 코드
    rdishcode INT,                            		-- 음식 코드 (외래키)
    ruserid VARCHAR(200),	                      	-- 리뷰 아이디
    rscore FLOAT,                             		-- 리뷰 평점
    rdate DATETIME DEFAULT CURRENT_TIMESTAMP, 		-- 리뷰 작성일시
    rcontent TEXT,                           		-- 리뷰 내용
    FOREIGN KEY (rdishcode) REFERENCES dish_tb(dcode) 
    	ON DELETE CASCADE,							-- 음식 삭제 시 리뷰도 삭제
	FOREIGN KEY (ruserid) REFERENCES user_tb(uid) 
        ON DELETE SET NULL                     		-- 사용자 삭제 시 ruserid를 NULL로 설정    	
);



