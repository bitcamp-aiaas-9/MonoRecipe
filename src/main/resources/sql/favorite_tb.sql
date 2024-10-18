-- MySQL
-- 즐겨찾기 테이블

CREATE TABLE `favorite_tb` (
  `fcode` int NOT NULL AUTO_INCREMENT,				-- 즐겨찾기 코드
  `fuserid` varchar(200) DEFAULT NULL,				-- 사용자 코드 (user_tb 외래키)
  `fdishcode` int DEFAULT NULL,						-- 음식 코드 (dish_tb 외래키)
  PRIMARY KEY (`fcode`),
  UNIQUE KEY `fuserid` (`fuserid`,`fdishcode`),		-- 사용자와 음식의 중복 방지
  KEY `favorite_tb_ibfk_2` (`fdishcode`),
  CONSTRAINT `favorite_tb_ibfk_1` FOREIGN KEY (`fuserid`) REFERENCES `user_tb` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `favorite_tb_ibfk_2` FOREIGN KEY (`fdishcode`) REFERENCES `dish_tb` (`dcode`) ON DELETE CASCADE
)