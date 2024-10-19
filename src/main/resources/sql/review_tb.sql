-- MySQL
-- 리뷰 테이블

CREATE TABLE `review_tb` (
  `rcode` int NOT NULL AUTO_INCREMENT,     		-- 리뷰 코드
  `rdishcode` int DEFAULT NULL,             	-- 음식 코드 (외래키)
  `ruserid` varchar(200) DEFAULT NULL,			-- 리뷰 아이디
  `rscore` float DEFAULT NULL,					-- 리뷰 평점
  `rdate` datetime DEFAULT CURRENT_TIMESTAMP,	-- 리뷰 작성일시
  `rcontent` text,								-- 리뷰 내용
  PRIMARY KEY (`rcode`),
  KEY `rdishcode` (`rdishcode`),
  KEY `ruserid` (`ruserid`),
  CONSTRAINT `review_tb_ibfk_1` FOREIGN KEY (`rdishcode`) REFERENCES `dish_tb` (`dcode`) 
  	ON DELETE CASCADE,							-- 음식 삭제 시 리뷰도 삭제
  CONSTRAINT `review_tb_ibfk_2` FOREIGN KEY (`ruserid`) REFERENCES `user_tb` (`uid`) 
  ON DELETE SET NULL							-- 사용자 삭제 시 ruserid를 NULL로 설정
)