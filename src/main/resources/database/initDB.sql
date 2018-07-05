USE bookmanager;
DROP TABLE IF EXISTS books;

CREATE TABLE `BOOKS` (
  ID INT NOT NULL AUTO_INCREMENT,
  BOOK_TITLE VARCHAR(255) NOT NULL,
  BOOK_DESCRIPTION TEXT NOT NULL,
  BOOK_AUTHOR VARCHAR(100) NOT NULL,
  BOOK_ISBN VARCHAR(20) NOT NULL,
  BOOK_PRINTYEAR INT NOT NULL,
  BOOK_READ TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (ID))
  ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

