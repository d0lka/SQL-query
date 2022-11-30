CREATE FUNCTION get_statistics(give_date DATE, number INT)
RETURNS VARCHAR(300)
BEGIN
    DECLARE unic_reader, count_book, return_book INT;
    DECLARE popular_book VARCHAR(100);
    DECLARE date_year, date_month, date_week, date_day DATE;
    SET date_year = DATE_SUB(give_date, INTERVAL 1 YEAR);
    SET date_month = DATE_SUB(give_date, INTERVAL 1 MONTH);
    SET date_week = DATE_SUB(give_date, INTERVAL 7 DAY);
    SET date_day = DATE_SUB(give_date, INTERVAL 1 DAY);
    IF number = 1 THEN
    SET unic_reader = (SELECT count(DISTINCT reader_id)
                       FROM book_reader
                       WHERE return_date BETWEEN date_year AND date_day OR borrow_date BETWEEN date_year AND date_day);
    SET count_book = (SELECT count(book_id)
                       FROM book_reader
                       WHERE borrow_date BETWEEN date_year AND date_day);
    SET return_book = (SELECT count(book_id)
                       FROM book_reader
                       WHERE return_date BETWEEN date_year AND date_day);
    SET popular_book = (WITH get_book(title, count_book)
                        AS (SELECT title, count(book_id)
                        FROM book JOIN book_reader USING(book_id)
                        WHERE borrow_date BETWEEN date_year AND date_day
                        GROUP BY 1)
                        SELECT GROUP_CONCAT(title ORDER BY title)
                        FROM get_book
                        GROUP BY count_book
                        ORDER BY count_book DESC
                        LIMIT 1);
    ELSEIF number = 2 THEN
    SET unic_reader = (SELECT count(DISTINCT reader_id)
                       FROM book_reader
                       WHERE return_date BETWEEN date_month AND date_day OR borrow_date BETWEEN date_month AND date_day);
    SET count_book = (SELECT count(book_id)
                       FROM book_reader
                       WHERE borrow_date BETWEEN date_month AND date_day);
    SET return_book = (SELECT count(book_id)
                       FROM book_reader
                       WHERE return_date BETWEEN date_month AND date_day);
    SET popular_book = (WITH get_book(book_id, title, book_count)
                        AS (SELECT book_id, title, count(book_id)
                        FROM book JOIN book_reader USING(book_id)
                        WHERE borrow_date BETWEEN date_month AND date_day
                        GROUP BY 1)
                        SELECT GROUP_CONCAT(title ORDER BY title)
                        FROM get_book
                        GROUP BY book_count
                        ORDER BY book_count DESC
                        LIMIT 1);
    ELSEIF number = 3 THEN
    SET unic_reader = (SELECT count(DISTINCT reader_id)
                       FROM book_reader
                       WHERE return_date BETWEEN date_week AND date_day OR borrow_date BETWEEN date_week AND date_day);
    SET count_book = (SELECT count(book_id)
                       FROM book_reader
                       WHERE borrow_date BETWEEN date_week AND date_day);
    SET return_book = (SELECT count(book_id)
                       FROM book_reader
                       WHERE return_date BETWEEN date_week AND date_day);
    SET popular_book = (WITH get_book(title, count_book)
                        AS (SELECT title, count(book_id)
                        FROM book JOIN book_reader USING(book_id)
                        WHERE borrow_date BETWEEN date_week AND date_day
                        GROUP BY 1)
                        SELECT GROUP_CONCAT(title ORDER BY title)
                        FROM get_book
                        GROUP BY count_book
                        ORDER BY count_book DESC
                        LIMIT 1);
     END IF;
     IF unic_reader = 0 THEN
         RETURN 'читателей не было';
     ELSE
        RETURN CONCAT('количество уникальных читателей: ', unic_reader,
'\nколичество взятых экземпляров книг: ', IF(count_book = 0, '-', count_book),
'\nколичество сданных экземпляров книг: ', IF(return_book = 0, '-', return_book),
'\nсамая популярная(ые) книга(и): ', IF(popular_book IS NULL, '-', popular_book));
     END IF;
END;

SELECT  get_statistics("2020-09-15", 1);
SELECT  get_statistics("2020-12-10", 2);
SELECT  get_statistics("2020-09-10", 3);
SELECT  get_statistics("2020-12-27", 3);
