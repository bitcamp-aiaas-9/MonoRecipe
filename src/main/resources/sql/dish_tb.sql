-- MySQL
CREATE TABLE dish_tb (
    dcode INT AUTO_INCREMENT PRIMARY KEY,	-- 음식 코드
    dimage VARCHAR(255) NOT NULL,			-- 음식 사진 파일명
    dimageUUID VARCHAR(255) NOT NULL,		-- 음식 사진 UUID
    dname VARCHAR(100) NOT NULL,			-- 음식 이름
    dintro TEXT,							-- 음식 소개글
    drecipe TEXT NOT NULL,					-- 음식 레시피
    dscore DECIMAL(5, 2) DEFAULT 0.00		-- 음식 평균 평점
);

CREATE TABLE `dish_tb` (
  `dcode` int NOT NULL AUTO_INCREMENT,	-- 음식 코드
  `dimage` varchar(255) NOT NULL,		-- 음식 사진 파일명
  `dimageUUID` varchar(255) NOT NULL,	-- 음식 사진 UUID
  `dname` varchar(100) NOT NULL,		-- 음식 이름
  `dintro` text,
  `drecipe` text NOT NULL,
  `dscore` decimal(5,2) DEFAULT '0.00'
  PRIMARY KEY (`dcode`)
)



-- 트리거: 리뷰 추가 시 트리거 (AFTER INSERT)
CREATE TRIGGER update_dscore_after_insert
AFTER INSERT ON review_tb
FOR EACH ROW
BEGIN
   UPDATE dish_tb
   SET dscore = (
       SELECT IFNULL(AVG(rscore), 0) 
       FROM review_tb 
       WHERE rdishcode = NEW.rdishcode
   )
   WHERE dcode = NEW.rdishcode;
END;
  
   
   
-- 트리거: 리뷰 수정 시 트리거 (AFTER UPDATE)
CREATE TRIGGER update_dscore_after_update
AFTER UPDATE ON review_tb
FOR EACH ROW
BEGIN
   UPDATE dish_tb
   SET dscore = (
       SELECT IFNULL(AVG(rscore), 0) 
       FROM review_tb 
       WHERE rdishcode = NEW.rdishcode
   )
   WHERE dcode = NEW.rdishcode;
END;

   
-- 트리거: 리뷰 삭제 시 음식의 평균 평점 업데이트 
CREATE TRIGGER update_dscore_after_delete
AFTER DELETE ON review_tb
FOR EACH ROW
BEGIN
   UPDATE dish_tb
   SET dscore = (
       SELECT IFNULL(AVG(rscore), 0) 
       FROM review_tb 
       WHERE rdishcode = OLD.rdishcode
   )
   WHERE dcode = OLD.rdishcode;
END;

