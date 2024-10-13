-- MySQL
CREATE TABLE dish_tb (
    dcode INT AUTO_INCREMENT PRIMARY KEY,     -- 음식 코드
    dimage VARCHAR(255) NOT NULL,             -- 음식 사진
    dname VARCHAR(100) NOT NULL,              -- 음식 이름
    dintro TEXT,                              -- 음식 소개글
    drecipe TEXT NOT NULL,                    -- 음식 레시피
    dscore FLOAT DEFAULT 0                    -- 음식 평균 평점
);


CREATE TRIGGER update_dscore
AFTER INSERT ON review_tb
FOR EACH ROW
BEGIN
   UPDATE dish_tb
   SET dscore = (SELECT AVG(rscore) FROM review_tb WHERE rdishcode = NEW.rdishcode)
   WHERE dcode = NEW.rdishcode;
END;