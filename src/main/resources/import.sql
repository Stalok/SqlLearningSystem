INSERT INTO sql_learning_system_db.user (username, password, email, progress, create_time, last_login_time, is_active)
VALUES
    ('john_doe', 'password123', 'john.doe@example.com', 1, '2022-01-01 12:00:00', '2022-01-01 12:00:00', 1),
    ('jane_smith', 'securepass', 'jane.smith@example.com', 2, '2022-01-02 10:00:00', '2022-01-02 10:00:00', 1),
    ('alice_wonderland', 'wonderpass', 'alice.wonderland@example.com', 3, '2022-01-03 08:00:00', '2022-01-03 08:00:00', 0);



insert into sql_learning_system_db.chapter (course_id, name, description, is_active)
values
    (1, 'SQL 簡介', 'Introduction to SQL and databases', 1),
    (2, '基本 SQL 語法', 'Understand SQL syntax and commands', 1),
    (3, '資料表的創建和修改', 'Create and modify tables in SQL', 1),
    (4, '資料的插入、更新和刪除', 'Insert, update, and delete data in SQL', 1),
    (5, '資料庫設計和正規化', 'Design databases and normalize data', 1),
    (6, '多表操作', 'Perform operations on multiple tables in SQL', 1),
    (7, '進階 SQL 主題', 'Advanced SQL topics and techniques', 1),
    (8, '實戰案例和最佳實踐', 'Real-world case studies and best practices', 1);
# select * from sql_learning_system_db.chapter;


insert into sql_learning_system_db.lesson (name, description, type, chapter, is_active)
VALUES
    # Chapter 1: SQL 簡介
    ('什麼是 SQL？', 'Introduction to SQL and databases', 'text', 1, 1),
#     ('SQL 的歷史和用途', 'History and uses of SQL', 'text', 1, 1),
#     ('常見的 SQL 資料庫系統', 'Popular SQL database systems', 'text', 1, 1),
    # chapter 2: 基本 SQL 語法
    ('SELECT 語句, WHERE 子句', 'Retrieve data from SQL tables using the SELECT statement', 'playground', 2, 1),
#     ('WHERE 子句', 'Filter data using the WHERE clause in SQL', 'playground', 2, 1),
    ('ORDER BY 子句', 'Sort data using the ORDER BY clause in SQL', 'playground', 2, 1),
    ('GROUP BY 子句, HAVING 子句', 'Group data using the GROUP BY clause in SQL', 'playground', 2, 1),
#     ('HAVING 子句', 'Filter grouped data using the HAVING clause in SQL', 'playground', 2, 1),
    # chapter 3: 資料表的創建和修改
    ('CREATE TABLE 語句, DROP TABLE 語句, ALTER TABLE 語句', 'Create, delete, and modify tables in SQL', 'playground', 3, 1),
    ('INSERT INTO 語句, DELETE FROM 語句, UPDATE 語句', 'Insert, delete, and update data in SQL tables', 'playground', 3, 1),
    # chapter 4: 資料庫設計和正規化
    ('資料庫設計原則, 正規化的基本概念', 'Principles of database design', 'text', 5, 1),
    # chapter 5: 多表操作
    ('JOIN 操作', 'Combine data from multiple tables using JOIN operations in SQL', 'playground', 6, 1),
    ('UNION 操作, INTERSECT 操作', 'Combine results from multiple queries using UNION and INTERSECT operations in SQL', 'playground', 6, 1),
    ('子查詢', 'Use subqueries to perform complex queries in SQL', 'playground', 6, 1),
    # chapter 6: 進階 SQL 主題
    ('視圖', 'Create and use views in SQL to simplify complex queries', 'playground', 7, 1),
    ('索引 (Indexes), 觸發器 (Triggers)和事務 (Transactions)', 'Use indexes, triggers, and transactions in SQL for performance and data integrity', 'playground', 7, 1),
    # chapter 7: 實戰案例和最佳實踐
    ('常見的 SQL 問題和解決方案', 'Common SQL problems and solutions', 'text', 8, 1),
    ('SQL 最佳實踐', 'Optimize SQL queries for better performance', 'text', 8, 1)
;
# select * from sql_learning_system_db.lesson;

# Chapter 1: SQL 簡介
INSERT INTO sql_learning_system_db.quizzes (lesson_id, lesson_quiz_id, prerequisite_sql, question, type, choice1, choice2, choice3, choice4, answer)
VALUES
    (1, 1, NULL,
     'SQL（結構化查詢語言）是一種用於存儲、操作和檢索存儲在關聯式資料庫管理系統（RDBMS）中的數據的計算機語言。它是關係數據庫系統的標準語言，被廣泛用於各種資料庫管理系統，包括MySQL、MS Access、Oracle、Sybase、Informix、Postgres和SQL Server.

SQL的範圍包括以下方面：

資料插入、查詢、更新和刪除：SQL允許您從資料庫中檢索數據，插入新數據，更新現有數據，以及刪除不再需要的數據。
資料庫模式建立和修改：您可以使用SQL定義和修改資料庫的結構，包括表、索引、視圖和其他對象。
資料訪問控制：SQL還允許您設置對數據的訪問權限，以確保只有授權的用戶可以查看或修改數據。
儘管SQL通常被描述為一種聲明式編程語言，但它也包含一些程序式編程的元素。無論您是新手還是有經驗的開發人員，掌握SQL都是管理和操作數據庫的重要技能。'
        , 'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (1, 2, NULL, '
    SQL（Structured Query Language）是一種用於管理和操作關聯式資料庫的語言。讓我們深入了解 SQL 的歷史和用途。

歷史
1970 年代初期：SQL 誕生於 IBM 的研究實驗室，最早被稱為 SEQUEL（Structured English Query Language）。
1979 年：SEQUEL 更名為 SQL，並成為 ANSI（American National Standards Institute）標準。
1986 年：SQL 成為 ISO（International Organization for Standardization）標準。
用途
SQL 在資料庫管理中扮演著重要角色：

資料查詢：使用 SELECT 語句從資料表中擷取特定欄位的資料。
資料操作：INSERT、UPDATE 和 DELETE 語句用於新增、修改和刪除資料。
資料定義：CREATE、ALTER 和 DROP 語句用於建立、修改和刪除資料表、索引和其他資料庫物件。
資料控制：GRANT 和 REVOKE 語句用於授予或撤銷使用者對資料庫物件的權限。
SQL 是一個強大且靈活的語言，適用於各種資料庫系統，包括 MySQL、PostgreSQL、Microsoft SQL Server 和 Oracle 等123.
', 'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (1, 3, NULL,
     '以下是一些常見的 SQL 資料庫系統：

MySQL：MySQL 是一個開源的關聯式數據庫管理系統（RDBMS）。它被廣泛用於 Web 應用程序和企業級應用程序。MySQL 支持多種編程語言和平台。
SQL Server：SQL Server 是由 Microsoft 開發的關聯式數據庫管理系統。它適用於 Windows 環境，並提供高性能、可靠性和安全性。
MS Access：Microsoft Access 是一個桌面級的數據庫管理系統，適用於小型項目和個人用戶。它易於使用並具有良好的用戶界面。
Oracle：Oracle 是一個功能強大的商業級數據庫系統，用於大型企業和關鍵業務應用程序。它支持高度並發性、數據安全性和可擴展性。
Sybase：Sybase 是一個企業級數據庫系統，特別適用於金融和交易處理應用程序。它具有高性能和可靠性。
Informix：Informix 是一個可擴展的關聯式數據庫管理系統，用於大型企業和 Web 應用程序。
PostgreSQL：PostgreSQL 是一個強大的開源關聯式數據庫系統，具有高度可定制性和擴展性。
這些 SQL 資料庫系統各自具有不同的特點和用途，您可以根據您的項目需求選擇適合的系統。',
     'ARTICLE', NULL, NULL, NULL, NULL, 'Next')
;

# Chapter 2: 基本 SQL 語法
# Lesson 1: SELECT 語句, WHERE 子句
INSERT INTO sql_learning_system_db.quizzes (lesson_id, lesson_quiz_id, prerequisite_sql, question, type, choice1, choice2, choice3, choice4, answer)
VALUES
    (2, 1, 'create table if not exists Car(
    id int primary key,
    name varchar(255),
    price int,
    year int,
    color varchar(255)
);
INSERT INTO Car(id, name, price, year, color)
VALUES
    (1, ''BMW'', 100000, 2019, ''black''),
    (2, ''Audi'', 90000, 2018, ''white''),
    (3, ''Mercedes'', 110000, 2017, ''red''),
    (4, ''Toyota'', 50000, 2016, ''blue''),
    (5, ''Honda'', 40000, 2015, ''green'');
INSERT INTO Car(id, name, price, year, color)
VALUES
    (6, ''Ford'', 30000, 2014, ''yellow''),
    (7, ''Chevrolet'', 20000, 2013, ''red''),
    (8, ''Nissan'', 10000, 2012, ''white''),
    (9, ''Hyundai'', 5000, 2011, ''pink''),
    (10, ''Kia'', 1000, 2010, ''white'')',
     'SELECT 語句用於從資料表中檢索數據。以下是一個簡單的 SELECT 語句示例：
    SELECT * FROM Car;
    試試運行這個 SELECT 語句，看看它返回了什麼結果。',
     'SELECT', NULL, NULL, NULL, NULL, 'SELECT * FROM Car'),
    (2, 2, NULL,
     '你也可以只檢索一部分的列, 例如
SELECT name, price FROM Car;
試試運行這個 SELECT 語句，看看它返回了什麼結果。',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT name, price FROM Car'),
        (2, 3, NULL,
        'SELECT 語句還可以加入DISTINCT關鍵字來去除重複的行，例如
SELECT DISTINCT color FROM Car;
試試運行這個 SELECT 語句，看看它返回了什麼結果。',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT DISTINCT color FROM Car'),
        (2, 4, NULL,
        'SELECT 語句還可以使用WHERE子句來過濾檢索的數據，例如
SELECT * FROM Car WHERE price > 50000;
試試運行這個 SELECT 語句，看看它返回了什麼結果。',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT * FROM Car WHERE price > 50000'),
        (2, 5, NULL,
        'WHERE關鍵字後面跟著一個條件表達式，例如
SELECT * FROM Car WHERE color = ''red'';
        可以使用>、<、=、!=等符號來比較數值或字符串。',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT * FROM Car WHERE color = ''red'''),
        (2, 6, NULL,
         '可以用BETWEEN和AND來指定範圍，例如
SELECT * FROM Car WHERE price BETWEEN 5000 AND 30000;
可以使用Like來模糊查詢，例如
SELECT * FROM Car WHERE name LIKE ''%o%'';
在這個語句中%表示任意字符，所以這個語句會返回所有名字中包含字母o的車輛。如改為SELECT * FROM Car WHERE name LIKE ''o%'';則只會返回名字以o開頭的車輛。',
         'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
         (2, 7, NULL,
         '可以使用AND和OR來組合多個條件，例如
SELECT * FROM Car WHERE price > 50000 AND year < 2018;
SELECT * FROM Car WHERE price < 10000 OR color = ''red'';
AND表示兩個條件都要滿足，OR表示其中一個條件滿足即可。
試試寫出滿足以下描述的SQL語句：
選擇所有價格大於50000且顏色不是白色的車輛。',
         'SELECT', NULL, NULL, NULL, NULL, 'SELECT * FROM Car WHERE price > 50000 AND color != ''white''');

# Chapter 2: 基本 SQL 語法
# Lesson 2: ORDER BY 子句
INSERT INTO sql_learning_system_db.quizzes (lesson_id, lesson_quiz_id, prerequisite_sql, question, type, choice1, choice2, choice3, choice4, answer)
VALUES
    (3, 1, 'create table if not exists Car(
    id int primary key,
    name varchar(255),
    price int,
    year int,
    color varchar(255)
);

INSERT INTO Car(id, name, price, year, color)
VALUES
    (1, ''BMW'', 100000, 2019, ''black''),
    (2, ''Audi'', 90000, 2018, ''white''),
    (3, ''Mercedes'', 110000, 2017, ''red''),
    (4, ''Toyota'', 50000, 2016, ''blue''),
    (5, ''Honda'', 40000, 2015, ''green'');
INSERT INTO Car(id, name, price, year, color)
VALUES
    (6, ''Ford'', 30000, 2014, ''yellow''),
    (7, ''Chevrolet'', 20000, 2013, ''red''),
    (8, ''Nissan'', 10000, 2012, ''white''),
    (9, ''Hyundai'', 5000, 2011, ''pink''),
    (10, ''Kia'', 1000, 2010, ''white'')',
     'ORDER BY 子句用於對檢索的數據進行排序。以下是一個簡單的 ORDER BY 子句示例：
    SELECT * FROM Car ORDER BY price;
    試試運行這個 SELECT 語句，看看它返回了什麼結果。',
     'SELECT', NULL, NULL, NULL, NULL, 'SELECT * FROM Car ORDER BY price'),
    (3, 2, NULL,
     '你也可以指定排序的方向，例如
SELECT * FROM Car ORDER BY price DESC;
DESC 表示降序排序，ASC 表示升序排序。
試試寫出按年份升序排序的 SQL 語句。',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT * FROM Car ORDER BY year ASC'),
        (3, 3, NULL,
        'ORDER BY 子句還可以按多個列進行排序，例如
SELECT * FROM Car ORDER BY year ASC, price DESC;
這個語句首先按年份升序排序，然後在同一年份的車輛中按價格降序排序。',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT * FROM Car ORDER BY color ASC'),
        (3, 4, NULL,
        'ORDER BY 子句還可以使用列的別名進行排序，例如
SELECT name AS car_name, price AS car_price FROM Car ORDER BY car_price DESC;
這個語句將 price 列的別名設置為 car_price，然後按 car_price 降序排序。',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT name AS car_name, price AS car_price FROM Car ORDER BY car_price DESC'),
        (3, 5, NULL,
        'ORDER BY 子句還可以使用數字表示列的位置進行排序，例如
SELECT * FROM Car ORDER BY 3 DESC;
這個語句將按第三列（price）降序排序。',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT * FROM Car ORDER BY 3 DESC'),
        (3, 6, NULL,
         'SELECT 子句還可以使用LIMIT子句來限制返回的行數，例如
SELECT * FROM Car ORDER BY price DESC LIMIT 3;
         在不同的資料庫系統中，LIMIT子句的語法可能有所不同，請查看相應的文檔以獲取更多信息。
試試寫出價格最高的三輛車的 SQL 語句。',
            'SELECT', NULL, NULL, NULL, NULL, 'SELECT * FROM Car ORDER BY price DESC LIMIT 3');


# Chapter 2: 基本 SQL 語法
# Lesson 3: GROUP BY 子句, HAVING 子句
INSERT INTO sql_learning_system_db.quizzes (lesson_id, lesson_quiz_id, prerequisite_sql, question, type, choice1, choice2, choice3, choice4, answer)
VALUES
    (4, 1, 'create table book
(
    id           int primary key,
    title        varchar(100),
    author       varchar(100),
    type         varchar(100),
    price        float,
    publish_date date
);
INSERT INTO book (id, title, author, type, price, publish_date) VALUES
(1, ''To Kill a Mockingbird'', ''Harper Lee'', ''Fiction'', 15.99, ''1960-07-11''),
(2, ''1984'', ''George Orwell'', ''Science Fiction'', 12.50, ''1949-06-08''),
(3, ''The Great Gatsby'', ''F. Scott Fitzgerald'', ''Fiction'', 10.99, ''1925-04-10'');
INSERT INTO book (id, title, author, type, price, publish_date) VALUES
(4, ''Pride and Prejudice'', ''Jane Austen'', ''Romance'', 9.99, ''1813-01-28''),
(5, ''The Catcher in the Rye'', ''J.D. Salinger'', ''Fiction'', 14.50, ''1951-07-16''),
(6, ''The Hobbit'', ''J.R.R. Tolkien'', ''Fantasy'', 11.75, ''1937-09-21'')',
        'GROUP BY 子句用於對檢索的數據進行分組。以下是一個簡單的 GROUP BY 子句示例：
        SELECT author, COUNT(*) FROM book GROUP BY author;
This SQL code retrieves the count of books written by each author from a table named "book".

Explanation step by step:
1.  SELECT author, COUNT(*) : This part of the code selects the "author" column and counts the number of rows for each author.
2.  FROM book : This specifies that the data is being retrieved from a table named "book".
3.  GROUP BY author : This groups the results by the "author" column, so that the count of books is calculated for each unique author in the table.
        試試運行這個 SELECT 語句，看看它返回了什麼結果。',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT author, COUNT(*) FROM book GROUP BY author'),
        (4, 2, NULL,
        '除了COUNT(*)，GROUP BY 子句還可以與其他聚合函數一起使用，例如SUM、AVG、MIN、MAX等。例如：
SELECT author, SUM(price) FROM book GROUP BY author;
試試寫出Fiction類書籍的平均價格。',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT type, AVG(price) FROM book GROUP BY type'),
        (4, 3, NULL,
        'HAVING 子句用於過濾 GROUP BY 子句的結果。以下是一個簡單的 HAVING 子句示例：
SELECT author, COUNT(*) FROM book GROUP BY author HAVING COUNT(*) > 1;
這個 SQL 語句檢索了至少有兩本書的作者。',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT author, COUNT(*) FROM book GROUP BY author HAVING COUNT(*) > 1'),
        (4, 4, NULL,
        'HAVING 子句可以使用聚合函數來過濾結果，例如：
SELECT author, AVG(price) FROM book GROUP BY author HAVING AVG(price) > 12;
試試寫出平均價格大於10的書籍類型。',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT type, AVG(price) FROM book GROUP BY type HAVING AVG(price) > 10'),
        (4, 5, NULL,
        'HAVING 子句還可以與 WHERE 子句一起使用，例如：
SELECT author, COUNT(*) FROM book WHERE price > 10 GROUP BY author HAVING COUNT(*) > 1;
這個 SQL 語句檢索了價格大於10的書籍中至少有兩本書的作者。',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT author, COUNT(*) FROM book WHERE price > 10 GROUP BY author HAVING COUNT(*) > 1'),
        (4, 6, NULL,
        'HAVING 子句還可以使用 AND 和 OR 來組合多個條件，例如：
SELECT author, COUNT(*) FROM book GROUP BY author HAVING COUNT(*) > 1 AND AVG(price) > 10;
這個 SQL 語句檢索了至少有兩本書的作者，且平均價格大於10。',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT author, COUNT(*) FROM book GROUP BY author HAVING COUNT(*) > 1 AND AVG(price) > 10'),
        (4, 7, NULL,
         '試試寫出滿足以下描述的SQL語句：
選擇所有平均價格大於10的書籍類型。',
            'SELECT', NULL, NULL, NULL, NULL, 'SELECT type, AVG(price) FROM book GROUP BY type HAVING AVG(price) > 10'),
        (4, 8, NULL,
            '試試寫出滿足以下描述的SQL語句：
選擇所有平均價格大於10且總價格大於50的書籍類型。',
            'SELECT', NULL, NULL, NULL, NULL, 'SELECT type, AVG(price), SUM(price) FROM book GROUP BY type HAVING AVG(price) > 10 AND SUM(price) > 50');



# Chapter 3: 資料表的創建和修改、資料的插入、更新和刪除
# Lesson 1: CREATE TABLE 語句, DROP TABLE 語句, ALTER TABLE 語句
INSERT INTO sql_learning_system_db.quizzes (lesson_id, lesson_quiz_id, prerequisite_sql, question, type, choice1, choice2, choice3, choice4, answer, check_sql)
VALUES
    (5, 1, NULL,
     'CREATE TABLE 語句用於創建新的資料表。以下是一個簡單的 CREATE TABLE 語句示例：
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(10),
    major VARCHAR(50),
    gpa DECIMAL(3, 2)
);
     這個表包含了學生的基本信息，如學生ID、姓名、出生日期、性別、專業、GPA等欄位。創表語句的格式為CREATE TABLE 表名 (列定義1, 列定義2, ...); , 列定義包括列名、數據類型和約束條件。其中INT表示整數類型，PRIMARY KEY表示主鍵約束，VARCHAR(50)表示最大長度為50的字符串，DATE表示日期類型，DECIMAL(3, 2)表示3位整數和2位小數的十進制數字。主鍵約束用於唯一標識每條記錄，確保表中的每條記錄都有唯一的主鍵值。',
        'CHANGE', NULL, NULL, NULL, NULL, 'Next', 'SELECT TABLE_NAME FROM information_schema.tables WHERE table_name = ''student'';'),
    (5, 2, NULL,
        'DROP TABLE 語句用於刪除現有的資料表。以下是一個簡單的 DROP TABLE 語句示例：
DROP TABLE student;
        這個語句將刪除名為student的資料表。請注意，刪除資料表將永久刪除該表及其所有數據，請謹慎操作。',
            'CHANGE', NULL, NULL, NULL, NULL, 'Next', 'SELECT TABLE_NAME FROM information_schema.tables WHERE table_name = ''student'';'),
        (5, 3, NULL,
            'ALTER TABLE 語句用於修改現有的資料表結構。以下是一個簡單的 ALTER TABLE 語句示例：
ALTER TABLE student ADD COLUMN email VARCHAR(100);
        這個語句將向student表中添加一個email列，該列的數據類型為VARCHAR(100)。ALTER TABLE 語句還可以用於修改列的數據類型、添加約束條件、刪除列等操作。',
            'CHANGE', NULL, NULL, NULL, NULL, 'ALTER TABLE student ADD COLUMN email VARCHAR(100);', 'select * from student;'),
        (5, 4, NULL,
            'ALTER TABLE 語句還可以用於修改現有列的數據類型。以下是一個簡單的 ALTER TABLE 語句示例：
ALTER TABLE student MODIFY COLUMN gpa DECIMAL(4, 2);
        這個語句將student表中gpa列的數據類型從DECIMAL(3, 2)修改為DECIMAL(4, 2)。 MODIFY COLUMN 子句用於修改列的數據類型和約束條件。',
            'CHANGE', NULL, NULL, NULL, NULL, 'ALTER TABLE student MODIFY COLUMN gpa DECIMAL(4, 2);', 'select * from student;'),
        (5, 5, NULL,
            'ALTER TABLE 語句還可以用於刪除現有列。以下是一個簡單的 ALTER TABLE 語句示例：
ALTER TABLE student DROP COLUMN major;
        這個語句將刪除student表中的major列。 DROP COLUMN 子句用於刪除列。',
            'CHANGE', NULL, NULL, NULL, NULL, 'ALTER TABLE student DROP COLUMN major;', 'select * from student;'),
        (5, 6, NULL,
            'ALTER TABLE 語句還可以用於添加主鍵約束。以下是一個簡單的 ALTER TABLE 語句示例：
ALTER TABLE student ADD PRIMARY KEY (student_id);
        這個語句將student_id列設置為student表的主鍵。 ADD PRIMARY KEY 子句用於添加主鍵約束。',
            'CHANGE', NULL, NULL, NULL, NULL, 'ALTER TABLE student ADD PRIMARY KEY (student_id);', 'select * from student;');

# Chapter 3: 資料表的創建和修改、資料的插入、更新和刪除
# Lesson 2: INSERT INTO 語句, DELETE FROM 語句, UPDATE 語句
INSERT INTO sql_learning_system_db.quizzes (lesson_id, lesson_quiz_id, prerequisite_sql, question, type, choice1, choice2, choice3, choice4, answer, check_sql)
VALUES
    (6, 1, 'CREATE TABLE movies (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    release_year INT,
    director VARCHAR(100)
);INSERT INTO movies (id, title, genre, release_year, director)
VALUES
(1, ''The Shawshank Redemption'', ''Drama'', 1994, ''Frank Darabont''),
(2, ''The Godfather'', ''Crime'', 1972, ''Francis Ford Coppola''),
(3, ''Inception'', ''Sci-Fi'', 2010, ''Christopher Nolan''),
(4, ''The Dark Knight'', ''Action'', 2008, ''Christopher Nolan''),
(5, ''Pulp Fiction'', ''Crime'', 1994, ''Quentin Tarantino'');',
        '先用SELECT * FROM movies看一下現在的表中有甚麼內容吧。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next', NULL),
    (6, 2, NULL,
        'INSERT INTO 語句用於向資料表中插入新的數據行。以下是一個簡單的 INSERT INTO 語句示例：
INSERT INTO movies (id, title, genre, release_year, director)
VALUES
(6, ''Forrest Gump'', ''Drama'', 1994, ''Robert Zemeckis'');
這個語句將一部新電影的信息插入到movies表中。 INSERT INTO 語句的格式為INSERT INTO 表名 (列1, 列2, ...) VALUES (值1, 值2, ...); , 列1, 列2, ...表示要插入的列，值1, 值2, ...表示要插入的值。',
        'CHANGE', NULL, NULL, NULL, NULL, 'INSERT INTO movies (id, title, genre, release_year, director) VALUES (6, ''Forrest Gump'', ''Drama'', 1994, ''Robert Zemeckis'');', 'SELECT * FROM movies WHERE title = ''Forrest Gump'';'),
    (6, 3, NULL,
        '你也可以一次插入多條數據行，例如
INSERT INTO movies (id, title, genre, release_year, director)
VALUES
(7, ''The Matrix'', ''Sci-Fi'', 1999, ''Lana Wachowski''),
(8, ''The Lord of the Rings'', ''Fantasy'', 2001, ''Peter Jackson'');',
        'CHANGE', NULL, NULL, NULL, NULL, 'INSERT INTO movies (id, title, genre, release_year, director) VALUES (7, ''The Matrix'', ''Sci-Fi'', 1999, ''Lana Wachowski''), (8, ''The Lord of the Rings'', ''Fantasy'', 2001, ''Peter Jackson'');', 'SELECT * FROM movies WHERE title = ''The Matrix'' OR title = ''The Lord of the Rings'';'),
    (6, 4, NULL,
        'DELETE FROM 語句用於刪除資料表中的數據行。以下是一個簡單的 DELETE FROM 語句示例：
DELETE FROM movies WHERE title = ''The Godfather'';
這個語句將刪除movies表中標題為"The Godfather"的電影信息。 DELETE FROM 語句的格式為DELETE FROM 表名 WHERE 條件; , WHERE 條件用於指定要刪除的數據行。',
        'CHANGE', NULL, NULL, NULL, NULL, 'DELETE FROM movies WHERE title = ''The Godfather'';', 'SELECT * FROM movies;'),
    (6, 5, NULL,
        '試試寫出滿足以下描述的SQL語句：
刪除所有上映年份在2000年之前的電影。',
        'CHANGE', NULL, NULL, NULL, NULL, 'DELETE FROM movies WHERE release_year < 2000;', 'SELECT * FROM movies;'),
    (6, 6, NULL,
        'UPDATE 語句用於更新資料表中的數據行。以下是一個簡單的 UPDATE 語句示例：
UPDATE movies SET director = ''Quentin Tarantino'' WHERE title = ''Pulp Fiction'';
這個語句將movies表中標題為"Pulp Fiction"的電影的導演信息更新為"Quentin Tarantino"。 UPDATE 語句的格式為UPDATE 表名 SET 列 = 值 WHERE 條件; , SET 列 = 值用於指定要更新的列和新值，WHERE 條件用於指定要更新的數據行。',
        'CHANGE', NULL, NULL, NULL, NULL, 'UPDATE movies SET director = ''Quentin Tarantino'' WHERE title = ''Pulp Fiction'';', 'SELECT * FROM movies WHERE title = ''Pulp Fiction'';'),
    (6, 7, NULL,
        '你也可以一次更新多條數據行，例如
UPDATE movies SET director = ''Christopher Nolan'' WHERE genre = ''Sci-Fi'';
這個語句將movies表中類型為"Sci-Fi"的電影的導演信息更新為"Christopher Nolan"。',
        'CHANGE', NULL, NULL, NULL, NULL, 'UPDATE movies SET director = ''Christopher Nolan'' WHERE genre = ''Sci-Fi'';', 'SELECT * FROM movies WHERE genre = ''Sci-Fi'';'),
    (6, 8, NULL,
        '試試寫出滿足以下描述的SQL語句：
將所有上映年份在1990年之後的電影的導演信息更新為"Steven Spielberg"。',
        'CHANGE', NULL, NULL, NULL, NULL, 'UPDATE movies SET director = ''Steven Spielberg'' WHERE release_year > 1990;', 'SELECT * FROM movies WHERE release_year > 1990;');

# Chapter 4: 資料庫設計和正規化
# Lesson 1: 資料庫設計原則, 正規化的基本概念
INSERT INTO sql_learning_system_db.quizzes (lesson_id, lesson_quiz_id, prerequisite_sql, question, type, choice1, choice2, choice3, choice4, answer)
VALUES
    (7, 1, NULL,
     '資料庫設計是指設計和組織資料庫中的表、列和關係，以滿足用戶需求並確保數據的完整性和一致性。以下是一些資料庫設計的原則：
1. 識別實體和屬性：確定需要存儲的實體（如學生、課程）和屬性（如學生的姓名、課程的名稱）。
2. 設計正規化的資料庫結構：使用正規化技術將數據分解為更小的表，以減少數據冗余和提高數據的一致性。
3. 定義關係：確定表之間的關係，如一對多、多對多等。
4. 考慮性能和安全性：設計資料庫結構時要考慮性能和安全性需求，如索引、權限等。',
     'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (7, 2, NULL,
     '1. 識別實體和屬性：
實體是指現實世界中的一個獨立對象，如學生、課程、訂單等。屬性是實體的特徵或描述，如學生的姓名、課程的名稱、訂單的日期等。
2. 設計正規化的資料庫結構：
正規化是一種數據庫設計技術，旨在減少數據冗余和提高數據的一致性。正規化通常分為多個正規化級別，如第一正規化形式（1NF）、第二正規化形式（2NF）、第三正規化形式（3NF）等。每個正規化級別都有特定的要求，如消除重複組、確保每個列都與主鍵有關等。',
     'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (7, 3, NULL,
     '3. 定義關係：
關係是指表之間的連接和依賴關係。常見的關係包括一對多關係、多對多關係等。在資料庫設計中，通過使用外鍵約束來定義表之間的關係，確保數據的一致性和完整性。
4. 考慮性能和安全性：
在設計資料庫結構時，需要考慮性能和安全性需求。性能方面，可以通過添加索引、優化查詢等方式來提高資料庫的查詢效率；安全性方面，可以通過設置權限、加密數據等方式來保護數據的安全。',
     'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (7, 4, NULL,
     '正規化是一種數據庫設計技術，旨在減少數據冗余和提高數據的一致性。正規化通常分為多個正規化級別，如第一正規化形式（1NF）、第二正規化形式（2NF）、第三正規化形式（3NF）等。每個正規化級別都有特定的要求，如消除重複組、確保每個列都與主鍵有關等。
正規化的基本概念包括：
1. 第一正規化形式（1NF）：確保每個列都是不可再分的原子值，消除重複組。
2. 第二正規化形式（2NF）：確保每個非主鍵列都完全依賴於主鍵，消除部分依賴。
3. 第三正規化形式（3NF）：確保每個非主鍵列都不依賴於其他非主鍵列，消除遞移依賴。',
     'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (7, 5, NULL,
     '第一正規化形式（1NF）要求每個列都是不可再分的原子值，消除重複組。以下是一個簡單的例子：
原始表格：
學生ID    姓名    課程
1        張三    數學, 英語
2        李四    數學, 物理
1NF表格：
學生ID    姓名    課程
1        張三    數學
1        張三    英語
2        李四    數學
2        李四    物理
在1NF表格中，每個列都是原子值，消除了重複組。',
     'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (7, 6, NULL,
     '第二正規化形式（2NF）要求每個非主鍵列都完全依賴於主鍵，消除部分依賴。以下是一個簡單的例子：
原始表格：
學生ID    課程    課程名稱    課程學分
1        001    數學        3
1        002    英語        2
2        001    數學        3
2        003    物理        4

2NF表格：
學生ID    課程
1        001
1        002
2        001
2        003
課程表格：
課程    課程名稱    課程學分
001    數學        3
002    英語        2
003    物理        4
在2NF表格中，每個非主鍵列都完全依賴於主鍵，消除了部分依賴。',
     'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (7, 7, NULL,
     '第三正規化形式（3NF）要求每個非主鍵列都不依賴於其他非主鍵列，消除遞移依賴。以下是一個簡單的例子：
原始表格：
學生ID    課程    課程名稱    課程學分    課程老師
1        001    數學        3        張老師
1        002    英語        2        王老師
2        001    數學        3        張老師
2        003    物理        4        李老師
     3NF表格：
學生表格：
學生ID    課程
1        001
1        002
2        001
2        003
課程表格：
課程    課程名稱    課程學分
001    數學        3
002    英語        2
003    物理        4
老師表格：
課程    課程老師
001    張老師
002    王老師
003    李老師
在3NF表格中，每個非主鍵列都不依賴於其他非主鍵列，消除了遞移依賴。',
     'ARTICLE', NULL, NULL, NULL, NULL, 'Next');

# Chapter 5: 多表操作
# Lesson 1: JOIN 操作
INSERT INTO sql_learning_system_db.quizzes (lesson_id, lesson_quiz_id, prerequisite_sql, question, type, choice1, choice2, choice3, choice4, answer)
VALUES
    (8, 1, 'CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    major VARCHAR(50)
);
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    instructor VARCHAR(50)
);
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    grade VARCHAR(2),
    PRIMARY KEY (student_id, course_id)
);
INSERT INTO students (student_id, first_name, last_name, major)
VALUES
    (1, ''Alice'', ''Smith'', ''Computer Science''),
    (2, ''Bob'', ''Jones'', ''Mathematics''),
    (3, ''Charlie'', ''Brown'', ''Physics'');
INSERT INTO courses (course_id, course_name, instructor)
VALUES
    (101, ''Introduction to Programming'', ''Dr. Johnson''),
    (102, ''Calculus I'', ''Prof. Davis''),
    (103, ''Mechanics'', ''Dr. Lee'');
INSERT INTO enrollments (student_id, course_id, grade)
VALUES
    (1, 101, ''A''),
    (1, 102, ''B''),
    (2, 101, ''B''),
    (2, 103, ''A''),
    (3, 102, ''C'');',
     '現在有3個表，分別是students、courses和enrollments，先自己看看表內有甚麼吧。
JOIN 操作用於將多個表中的數據進行聯合查詢。以下是一個簡單的 JOIN 操作示例：
SELECT students.first_name, students.last_name, courses.course_name, enrollments.grade
FROM students
JOIN enrollments ON students.student_id = enrollments.student_id
JOIN courses ON enrollments.course_id = courses.course_id;
這個 SQL 語句聯合查詢了students、courses和enrollments表，並返回了學生的姓名、課程名稱和成績。ON 子句用於指定表之間的連接條件。',
     'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (8, 2, NULL,
     'JOIN 操作有不同的類型，包括 INNER JOIN、LEFT JOIN、RIGHT JOIN 和 FULL JOIN。以下是這些 JOIN 操作的簡要說明：
1. INNER JOIN：返回兩個表中匹配行的交集。
2. LEFT JOIN：返回左表中的所有行，以及右表中匹配行的交集。
3. RIGHT JOIN：返回右表中的所有行，以及左表中匹配行的交集。
4. FULL JOIN：返回兩個表中的所有行，並將不匹配的行填充為 NULL 值。
這些 JOIN 操作可以根據具體的查詢需求來選擇使用。',
     'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (8, 3, NULL,
     'INNER JOIN 是 JOIN 操作中最常用的類型，它返回兩個表中匹配行的交集。以下是一個 INNER JOIN 操作示例：
SELECT students.first_name, students.last_name, courses.course_name, enrollments.grade
FROM students
INNER JOIN enrollments ON students.student_id = enrollments.student_id
INNER JOIN courses ON enrollments.course_id = courses.course_id;
這個 SQL 語句使用 INNER JOIN 操作聯合查詢了students、courses和enrollments表，並返回了學生的姓名、課程名稱和成績。',
     'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (8, 4, NULL,
     'LEFT JOIN 是一種 JOIN 操作，返回左表中的所有行，以及右表中匹配行的交集。以下是一個 LEFT JOIN 操作示例：
SELECT students.first_name, students.last_name, courses.course_name, enrollments.grade
FROM students
LEFT JOIN enrollments ON students.student_id = enrollments.student_id
LEFT JOIN courses ON enrollments.course_id = courses.course_id;
這個 SQL 語句使用 LEFT JOIN 操作聯合查詢了students、courses和enrollments表，並返回了學生的姓名、課程名稱和成績。如果某個學生沒有選修任何課程，則其成績為 NULL。',
     'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (8, 5, NULL,
     'RIGHT JOIN 是一種 JOIN 操作，返回右表中的所有行，以及左表中匹配行的交集。以下是一個 RIGHT JOIN 操作示例：
SELECT students.first_name, students.last_name, courses.course_name, enrollments.grade
FROM students
RIGHT JOIN enrollments ON students.student_id = enrollments.student_id
RIGHT JOIN courses ON enrollments.course_id = courses.course_id;
這個 SQL 語句使用 RIGHT JOIN 操作聯合查詢了students、courses和enrollments表，並返回了學生的姓名、課程名稱和成績。如果某個課程沒有學生選修，則學生的姓名和成績為 NULL。',
     'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (8, 6, NULL,
     'FULL JOIN 是一種 JOIN 操作，返回兩個表中的所有行，並將不匹配的行填充為 NULL 值。以下是一個 FULL JOIN 操作示例：
SELECT students.first_name, students.last_name, courses.course_name, enrollments.grade
FROM students
FULL JOIN enrollments ON students.student_id = enrollments.student_id
FULL JOIN courses ON enrollments.course_id = courses.course_id;
這個 SQL 語句使用 FULL JOIN 操作聯合查詢了students、courses和enrollments表，並返回了學生的姓名、課程名稱和成績。如果某個學生沒有選修任何課程，或某個課程沒有學生選修，則其成績為 NULL。',
     'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (8, 7, 'drop table students;drop table courses;drop table enrollments;
CREATE TABLE movies (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    release_year INT,
    director VARCHAR(100)
);
CREATE TABLE actors (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    birth_year INT
);
CREATE TABLE movie_cast (
    movie_id INT,
    actor_id INT,
    role VARCHAR(50),
    PRIMARY KEY (movie_id, actor_id)
);
INSERT INTO movies (id, title, genre, release_year, director)
VALUES
    (1, ''The Shawshank Redemption'', ''Drama'', 1994, ''Frank Darabont''),
    (2, ''The Godfather'', ''Crime'', 1972, ''Francis Ford Coppola''),
    (3, ''Inception'', ''Sci-Fi'', 2010, ''Christopher Nolan'');
INSERT INTO actors (id, name, birth_year)
VALUES
    (1, ''Morgan Freeman'', 1937),
    (2, ''Marlon Brando'', 1924),
    (3, ''Leonardo DiCaprio'', 1974);
INSERT INTO movie_cast (movie_id, actor_id, role)
VALUES
    (1, 1, ''Red''),
    (1, 2, ''Vito Corleone''),
    (3, 3, ''Cobb'');',
        '現在有3個表，分別是movies、actors和movie_cast，先自己看看表內有甚麼吧。',
    'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (8, 8, NULL,
     '試試寫出滿足以下描述的SQL語句：(JOIN 操作)
選擇所有電影的標題、類型和導演和演員的名字',
     'SELECT', NULL, NULL, NULL, NULL, 'SELECT movies.title, movies.genre, movies.director, actors.name FROM movies JOIN movie_cast ON movies.id = movie_cast.movie_id JOIN actors ON movie_cast.actor_id = actors.id;'),
    (8, 9, NULL,
        '試試寫出滿足以下描述的SQL語句：(INNER JOIN 操作)
選擇所有電影的標題、類型和導演和演員的名字，只包括有演員信息的電影。',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT movies.title, movies.genre, movies.director, actors.name FROM movies INNER JOIN movie_cast ON movies.id = movie_cast.movie_id INNER JOIN actors ON movie_cast.actor_id = actors.id;'),
    (8, 10, NULL,
        '試試寫出滿足以下描述的SQL語句：(LEFT JOIN 操作)
選擇所有電影的標題、類型和導演和演員的名字，包括沒有演員信息的電影。',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT movies.title, movies.genre, movies.director, actors.name FROM movies LEFT JOIN movie_cast ON movies.id = movie_cast.movie_id LEFT JOIN actors ON movie_cast.actor_id = actors.id;'),
    (8, 11, NULL,
        '試試寫出滿足以下描述的SQL語句：(RIGHT JOIN 操作)
選擇所有電影的標題、類型和導演和演員的名字，包括沒有電影信息的演員。',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT movies.title, movies.genre, movies.director, actors.name FROM movies RIGHT JOIN movie_cast ON movies.id = movie_cast.movie_id RIGHT JOIN actors ON movie_cast.actor_id = actors.id;'),
    (8, 12, NULL,
        '試試寫出滿足以下描述的SQL語句：(FULL JOIN 操作)
選擇所有電影的標題、類型和導演和演員的名字，包括沒有電影信息的演員和沒有演員信息的電影。',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT movies.title, movies.genre, movies.director, actors.name FROM movies FULL JOIN movie_cast ON movies.id = movie_cast.movie_id FULL JOIN actors ON movie_cast.actor_id = actors.id;');


# Chapter 5: 多表操作
# Lesson 2: UNION 操作, INTERSECT 操作
INSERT INTO sql_learning_system_db.quizzes (lesson_id, lesson_quiz_id, prerequisite_sql, question, type, choice1, choice2, choice3, choice4, answer)
VALUES
    (9, 1, 'CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    major VARCHAR(50)
);
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    instructor_id INT
);
CREATE TABLE instructors (
    instructor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    grade VARCHAR(2),
    PRIMARY KEY (student_id, course_id)
);
INSERT INTO students (student_id, first_name, last_name, major)
VALUES
    (1, ''Alice'', ''Smith'', ''Computer Science''),
    (2, ''Bob'', ''Jones'', ''Mathematics''),
    (3, ''Charlie'', ''Brown'', ''Physics''),
    (4, ''Dr.'', ''Johnson'');
INSERT INTO courses (course_id, course_name, instructor)
VALUES
    (101, ''Introduction to Programming'', ''Dr. Johnson''),
    (102, ''Calculus I'', ''Prof. Davis''),
    (103, ''Mechanics'', ''Dr. Lee'');
INSERT INTO enrollments (student_id, course_id, grade)
VALUES
    (1, 101, ''A''),
    (1, 102, ''B''),
    (2, 101, ''B''),
    (2, 103, ''A''),
    (3, 102, ''C'');
INSERT INTO instructors (instructor_id, first_name, last_name)
VALUES
    (1, ''Dr.'', ''Johnson''),
    (2, ''Prof.'', ''Davis''),
    (3, ''Dr.'', ''Lee'');',
     '現在有4個表，分別是students、courses、instructors和enrollments，先自己看看表內有甚麼吧。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (9, 2, NULL,
        'UNION 操作用於合併兩個或多個 SELECT 語句的結果集。以下是一個簡單的 UNION 操作示例：
SELECT first_name, last_name
FROM students
UNION
SELECT first_name, last_name
FROM instructors;
這個 SQL 語句合併了students和instructors表中的數據，並返回了所有學生和教師的姓名。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (9, 3, NULL,
        'INTERSECT 操作用於返回兩個 SELECT 語句的交集。以下是一個簡單的 INTERSECT 操作示例：
SELECT first_name, last_name
FROM students
INTERSECT
SELECT first_name, last_name
FROM instructors;
這個 SQL 語句返回了同時是學生和教師的人員的姓名。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (9, 4, 'drop table students;drop table courses;drop table instructors;drop table enrollments;
CREATE TABLE movies (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    release_year INT,
    director_id INT
);
CREATE TABLE directors (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
CREATE TABLE actors (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
CREATE TABLE movie_cast (
    movie_id INT,
    actor_id INT,
    role VARCHAR(50),
    PRIMARY KEY (movie_id, actor_id)
);
INSERT INTO movies (id, title, genre, release_year, director_id)
VALUES
    (1, ''The Shawshank Redemption'', ''Drama'', 1994, 1),
    (2, ''The Godfather'', ''Crime'', 1972, 2),
    (3, ''Inception'', ''Sci-Fi'', 2010, 3);
INSERT INTO directors (id, first_name, last_name)
VALUES
    (1, ''Frank'', ''Darabont''),
    (2, ''Francis Ford'', ''Coppola''),
    (3, ''Christopher'', ''Nolan'');
INSERT INTO actors (id, first_name, last_name)
VALUES
    (1, ''Morgan'', ''Freeman''),
    (2, ''Marlon'', ''Brando''),
    (3, ''Leonardo'', ''DiCaprio'');
INSERT INTO movie_cast (movie_id, actor_id, role)
VALUES
    (1, 1, ''Red''),
    (1, 2, ''Vito Corleone''),
    (3, 3, ''Cobb'');
INSERT INTO actors (id, first_name, last_name)
VALUES
    (4, ''Frank'', ''Darabont''),
    (5, ''Frank'', ''De Niro''),
    (6, ''Tom'', ''Darabont'');',
        '現在有4個表，分別是movies、directors、actors和movie_cast，先自己看看表內有甚麼吧。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (9, 5, NULL,
        '試試寫出滿足以下描述的SQL語句：(UNION 操作)
選擇所有電影的導演和演員的名字',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT directors.first_name, directors.last_name FROM directors UNION SELECT actors.first_name, actors.last_name FROM actors;'),
    (9, 6, NULL,
        '試試寫出滿足以下描述的SQL語句：(INTERSECT 操作)
選擇同時是導演和演員的人員的名字',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT first_name, last_name FROM directors INTERSECT SELECT first_name, last_name FROM actors;');

# Chapter 5: 多表操作
# Lesson 3: 子查詢
INSERT INTO sql_learning_system_db.quizzes (lesson_id, lesson_quiz_id, prerequisite_sql, question, type, choice1, choice2, choice3, choice4, answer)
VALUES
    (10, 1, 'CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
);

INSERT INTO departments (id, name)
VALUES
(1, ''Engineering''),
(2, ''Marketing''),
(3, ''Sales'');

INSERT INTO employees (id, name, department_id, salary)
VALUES
(1, ''Alice'', 1, 60000.00),
(2, ''Bob'', 1, 55000.00),
(3, ''Charlie'', 2, 50000.00),
(4, ''David'', 2, 52000.00),
(5, ''Eve'', 3, 48000.00),
(6, ''Frank'', 3, 49000.00);',
        '現在有2個表，分別是departments和employees，先自己看看表內有甚麼吧。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (10, 2, NULL,
        '子查詢是指在 SQL 查詢語句中嵌套另一個 SELECT 語句。以下是一個簡單的子查詢示例：
SELECT name
FROM employees
WHERE department_id = (
    SELECT id
    FROM departments
    WHERE name = ''Engineering''
);
這個 SQL 語句使用子查詢查詢了屬於"Engineering"部門的員工姓名。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (10, 3, NULL,
        '子查詢可以用於 WHERE 子句、SELECT 子句、FROM 子句等不同的位置。以下是一些常見的子查詢應用場景：
1. WHERE 子句：用於篩選符合條件的數據行。
2. SELECT 子句：用於返回子查詢的結果作為列的值。
3. FROM 子句：用於將子查詢的結果作為臨時表使用。
4. EXISTS 子句：用於檢查子查詢是否返回任何行。
5. IN 子句：用於檢查某個值是否在子查詢的結果集中。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (10, 4, NULL,
        'WHERE 子句中的子查詢用於篩選符合條件的數據行。以下是一個使用子查詢的 WHERE 子句示例：
SELECT name
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
這個 SQL 語句使用子查詢查詢了薪水高於平均薪水的員工姓名。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (10, 5, NULL,
        'SELECT 子句中的子查詢用於返回子查詢的結果作為列的值。以下是一個使用子查詢的 SELECT 子句示例：
SELECT name, (
    SELECT name
    FROM departments
    WHERE id = employees.department_id
) AS department
FROM employees;
這個 SQL 語句使用子查詢查詢了員工所屬的部門名稱。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (10, 6, NULL,
        'FROM 子句中的子查詢用於將子查詢的結果作為臨時表使用。以下是一個使用子查詢的 FROM 子句示例：
SELECT e.name, d.name AS department
FROM (
    SELECT *
    FROM employees
) AS e
JOIN departments AS d ON e.department_id = d.id;
這個 SQL 語句使用子查詢將employees表的數據作為臨時表使用，並聯合查詢了employees和departments表。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (10, 7, NULL,
        'EXISTS 子句用於檢查子查詢是否返回任何行。以下是一個使用 EXISTS 子句的示例：
SELECT name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM departments d
    WHERE e.department_id = d.id
);
這個 SQL 語句使用 EXISTS 子句檢查了employees表中的員工是否屬於任何部門。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (10, 8, NULL,
        'IN 子句用於檢查某個值是否在子查詢的結果集中。以下是一個使用 IN 子句的示例：
SELECT name
FROM employees
WHERE department_id IN (
    SELECT id
    FROM departments
    WHERE name IN (''Engineering'', ''Marketing'')
);
這個 SQL 語句使用 IN 子句查詢了屬於"Engineering"或"Marketing"部門的員工姓名。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (10, 9, 'drop table departments;drop table employees;
CREATE TABLE books (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    genre VARCHAR(50),
    publisher_id INT
);
CREATE TABLE authors (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
CREATE TABLE publishers (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);
CREATE TABLE reviewers (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
CREATE TABLE book_reviews (
    book_id INT,
    reviewer_id INT,
    rating INT,
    PRIMARY KEY (book_id, reviewer_id)
);
INSERT INTO books (id, title, author_id, genre, publisher_id)
VALUES
    (1, ''To Kill a Mockingbird'', 1, ''Fiction'', 1),
    (2, ''1984'', 2, ''Science Fiction'', 2),
    (3, ''Pride and Prejudice'', 3, ''Romance'', 3);
INSERT INTO authors (id, first_name, last_name)
VALUES
    (1, ''Harper'', ''Lee''),
    (2, ''George'', ''Orwell''),
    (3, ''Jane'', ''Austen'');
INSERT INTO publishers (id, name)
VALUES
    (1, ''HarperCollins''),
    (2, ''Penguin Books''),
    (3, ''Vintage Classics'');
INSERT INTO book_reviews (book_id, reviewer_id, rating)
VALUES
    (1, 1, 5),
    (1, 2, 4),
    (2, 1, 4),
    (2, 3, 5),
    (3, 2, 5);
INSERT INTO reviewers (id, first_name, last_name)
VALUES
    (1, ''Alice'', ''Smith''),
    (2, ''Bob'', ''Jones''),
    (3, ''Charlie'', ''Brown''),
    (4, ''David'', ''Johnson'');',
        '現在有5個表，分別是books、authors、publishers、reviewers和book_reviews，先自己看看表內有甚麼吧。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next'),
    (10, 10, NULL,
        '試試寫出滿足以下描述的SQL語句：(子查詢)
選擇有參與評論的書籍的標題和作者姓氏',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT title, (
    SELECT last_name
    FROM authors
    WHERE id = books.author_id
) AS author
FROM books
WHERE id IN (
    SELECT book_id
    FROM book_reviews
);'),
    (10, 11, NULL,
        '試試寫出滿足以下描述的SQL語句：(子查詢)
選擇評分為5的書籍的標題和評論者姓氏',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT title, (
    SELECT last_name
    FROM reviewers
    WHERE id = book_reviews.reviewer_id
) AS reviewer
FROM books
JOIN book_reviews ON books.id = book_reviews.book_id
WHERE rating = 5;');


# Chapter 6: 進階 SQL 主題
# Lesson 1: 視圖 (Views)
INSERT INTO sql_learning_system_db.quizzes (lesson_id, lesson_quiz_id, prerequisite_sql, question, type, choice1, choice2, choice3, choice4, answer, check_sql)
VALUES
    (11, 1, 'CREATE TABLE books (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    genre VARCHAR(50),
    publisher_id INT
);
CREATE TABLE authors (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
CREATE TABLE publishers (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);
CREATE TABLE reviewers (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
CREATE TABLE book_reviews (
    book_id INT,
    reviewer_id INT,
    rating INT,
    PRIMARY KEY (book_id, reviewer_id)
);
INSERT INTO books (id, title, author_id, genre, publisher_id)
VALUES
    (1, ''To Kill a Mockingbird'', 1, ''Fiction'', 1),
    (2, ''1984'', 2, ''Science Fiction'', 2),
    (3, ''Pride and Prejudice'', 3, ''Romance'', 3);
INSERT INTO authors (id, first_name, last_name)
VALUES
    (1, ''Harper'', ''Lee''),
    (2, ''George'', ''Orwell''),
    (3, ''Jane'', ''Austen'');
INSERT INTO publishers (id, name)
VALUES
    (1, ''HarperCollins''),
    (2, ''Penguin Books''),
    (3, ''Vintage Classics'');
INSERT INTO book_reviews (book_id, reviewer_id, rating)
VALUES
    (1, 1, 5),
    (1, 2, 4),
    (2, 1, 4),
    (2, 3, 5),
    (3, 2, 5);
INSERT INTO reviewers (id, first_name, last_name)
VALUES
    (1, ''Alice'', ''Smith''),
    (2, ''Bob'', ''Jones''),
    (3, ''Charlie'', ''Brown''),
    (4, ''David'', ''Johnson'');',
        '現在有5個表，分別是books、authors、publishers、reviewers和book_reviews，先自己看看表內有甚麼吧。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next', NULL),
        (11, 2, NULL,
        '視圖（Views）是一種虛擬的表，它是基於查詢結果集的表。視圖可以簡化複雜的查詢操作，提高數據的安全性和保護數據的完整性。以下是一個簡單的視圖創建示例：
CREATE VIEW book_reviews_view AS
SELECT books.title, authors.last_name AS author, reviewers.last_name AS reviewer, book_reviews.rating
FROM books
JOIN authors ON books.author_id = authors.id
JOIN book_reviews ON books.id = book_reviews.book_id
JOIN reviewers ON book_reviews.reviewer_id = reviewers.id;
這個 SQL 語句創建了一個名為book_reviews_view的視圖，該視圖包含了書籍的標題、作者姓氏、評論者姓氏和評分。',
        'CHANGE', NULL, NULL, NULL, NULL, 'CREATE VIEW book_reviews_view AS
SELECT books.title, authors.last_name AS author, reviewers.last_name AS reviewer, book_reviews.rating
FROM books
JOIN authors ON books.author_id = authors.id
JOIN book_reviews ON books.id = book_reviews.book_id
JOIN reviewers ON book_reviews.reviewer_id = reviewers.id;', 'SELECT * FROM book_reviews_view;'),
    (11, 3, NULL,
        '視圖可以像表一樣使用，可以對視圖進行查詢、更新、刪除等操作。以下是一個使用視圖的查詢示例：
SELECT *
FROM book_reviews_view
WHERE rating = 5;
這個 SQL 語句查詢了評分為5的書籍評論。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next', NULL),
    (11, 4, NULL,
        '視圖可以簡化複雜的查詢操作，提高數據的安全性和保護數據的完整性。以下是一些使用視圖的優點：
1. 簡化查詢：視圖可以將複雜的查詢操作封裝在一個視圖中，提供更簡潔的查詢接口。
2. 提高安全性：通過視圖可以限制用戶對數據的訪問權限，提高數據的安全性。
3. 保護數據完整性：通過視圖可以將數據的完整性保護在視圖中，防止用戶對數據進行不當修改。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next', NULL),
    (11, 5, 'drop view book_reviews_view;',
        '試試寫出滿足以下描述的SQL語句：(視圖)
創建一個名為book_view的視圖，包含書籍的標題、種類、作者姓氏、出版商名稱和評分',
        'CREATE VIEW', NULL, NULL, NULL, NULL, 'CREATE VIEW book_view AS
SELECT books.title, books.genre, authors.last_name AS author, publishers.name AS publisher, book_reviews.rating
FROM books
JOIN authors ON books.author_id = authors.id
JOIN publishers ON books.publisher_id = publishers.id
JOIN book_reviews ON books.id = book_reviews.book_id;', 'SELECT * FROM book_view;'),
    (11, 6, NULL,
        '試試寫出滿足以下描述的SQL語句：(視圖)
查詢book_view視圖中評分為5的書籍',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT * FROM book_view WHERE rating = 5;', NULL);


# Chapter 6: 進階 SQL 主題
# Lesson 2: 索引 (Indexes), 觸發器 (Triggers)和事務 (Transactions)
INSERT INTO sql_learning_system_db.quizzes (lesson_id, lesson_quiz_id, prerequisite_sql, question, type, choice1, choice2, choice3, choice4, answer, check_sql)
VALUES
    (12, 1, 'CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
);
CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);
CREATE TABLE projects (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT
);
CREATE TABLE tasks (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    project_id INT,
    employee_id INT
);
INSERT INTO employees (id, name, department_id, salary)
VALUES
    (1, ''Alice'', 1, 60000.00),
    (2, ''Bob'', 1, 55000.00),
    (3, ''Charlie'', 2, 50000.00),
    (4, ''David'', 2, 52000.00);
INSERT INTO departments (id, name)
VALUES
    (1, ''Engineering''),
    (2, ''Marketing'');
INSERT INTO projects (id, name, department_id)
VALUES
    (1, ''Project A'', 1),
    (2, ''Project B'', 2);
INSERT INTO tasks (id, name, project_id, employee_id)
VALUES
    (1, ''Task 1'', 1, 1),
    (2, ''Task 2'', 1, 2),
    (3, ''Task 3'', 2, 3),
    (4, ''Task 4'', 2, 4);',
        '現在有4個表，分別是employees、departments、projects和tasks，先自己看看表內有甚麼吧。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next', NULL),
    (12, 2, NULL,
        '索引（Indexes）是一種數據結構，用於提高數據庫查詢操作的效率。索引可以加速查詢操作，減少數據庫的讀取時間。以下是一個創建索引的示例：
CREATE INDEX employee_name_index
ON employees (name);
這個 SQL 語句創建了一個名為employee_name_index的索引，用於加速對employees表中name列的查詢操作。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next', NULL),
    (12, 3, NULL,
        '索引可以提高查詢操作的效率，減少數據庫的讀取時間。以下是一些使用索引的優點：
1. 加速查詢：索引可以加速查詢操作，提高數據庫的查詢效率。
2. 減少讀取時間：索引可以減少數據庫的讀取時間，提高數據庫的性能。
3. 提高數據庫的效率：通過使用索引可以提高數據庫的效率，提高用戶的查詢響應速度。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next', NULL),
    (12, 4, 'DROP INDEX employee_name_index;',
        '試試寫出滿足以下描述的SQL語句：(索引)
創建一個名為employee_department_index的索引，用於加速對employees表中department_id列的查詢操作',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next', NULL),
    (12, 5, NULL,
        '試試寫出滿足以下描述的SQL語句：(索引)
創建一個名為task_project_index的索引，用於加速對tasks表中project_id列的查詢操作',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next', NULL),
    (12, 6, 'CREATE TABLE salary_changes (
    id INT PRIMARY KEY,
    employee_id INT,
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2)
);',
        '觸發器（Triggers）是一種數據庫對象，用於在數據庫中自動執行某些操作。觸發器可以在數據庫中監聽特定的事件，並在事件發生時自動執行相應的操作。以下是一個創建觸發器的示例：
CREATE TRIGGER update_salary_trigger
AFTER UPDATE OF salary ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary > OLD.salary THEN
        INSERT INTO salary_changes (employee_id, old_salary, new_salary)
        VALUES (NEW.id, OLD.salary, NEW.salary);
    END IF;
END;
這個 SQL 語句創建了一個名為update_salary_trigger的觸發器，用於在employees表中salary列更新時記錄薪水變化。
第1句CREATE TRIGGER update_salary_trigger：創建一個名為update_salary_trigger的觸發器。
第2句AFTER UPDATE OF salary ON employees：在employees表中salary列更新後觸發觸發器。根據需要，可以在INSERT、UPDATE或DELETE操作前後觸發觸發器，如要在操作前觸發，可以使用BEFORE關鍵字。
第3句FOR EACH ROW：對每一行數據觸發觸發器。
第4句BEGIN：開始觸發器的操作。
第5-9句IF NEW.salary > OLD.salary THEN...END IF：如果新的薪水高於舊的薪水，則插入一條薪水變化記錄，NEW和OLD是特殊變量，分別表示新的和舊的數據行(我們已經新增了一個salary_changes表，用於記錄薪水變化)。
第10句END：結束觸發器的操作。
試試執行上述代碼。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next', 'SELECT TRIGGER_NAME, EVENT_MANIPULATION, EVENT_OBJECT_TABLE
FROM information_schema.TRIGGERS WHERE TRIGGER_NAME = update_salary_trigger AND EVENT_MANIPULATION = UPDATE AND EVENT_OBJECT_TABLE = employees;'),
    (12, 7, NULL,
        '現在試試更新一個員工的薪水，觀察觸發器的效果。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next', NULL),
    (12, 8, NULL,
        '試試寫出滿足以下描述的SQL語句：(觸發器)
創建一個名為delete_employee_trigger的觸發器，用於在employees表中刪除員工時自動刪除相關的任務',
        'CHANGE', NULL, NULL, NULL, NULL, 'CREATE TRIGGER delete_employee_trigger BEFORE DELETE ON employees FOR EACH ROW BEGIN DELETE FROM tasks WHERE employee_id = OLD.id; END;', 'SELECT * FROM tasks;'),
    (12, 9, 'DROP TRIGGER update_salary_trigger;',
        '試試寫出滿足以下描述的SQL語句：(觸發器)
創建一個名為update_project_trigger的觸發器，用於在tasks表中更新員工所屬的項目時自動更新員工所屬的部門',
        'CHANGE', NULL, NULL, NULL, NULL, 'CREATE TRIGGER update_project_trigger AFTER UPDATE OF project_id ON tasks FOR EACH ROW BEGIN UPDATE employees SET department_id = (SELECT department_id FROM projects WHERE id = NEW.project_id) WHERE id = NEW.employee_id; END;', 'SELECT * FROM employees;'),
    (12, 10, 'CREATE TABLE transfers (
    id INT PRIMARY KEY,
    amount DECIMAL(10, 2),
    type VARCHAR(50),
    date DATE
);',
        '事務（Transactions）是一組數據庫操作，它們要麼全部成功，要麼全部失敗。事務可以確保數據庫的一致性和完整性。以下是一個創建事務的示例：
START TRANSACTION;
    INSERT INTO transfers (id, amount, type, date) VALUES (1, 100.00, ''Deposit'', ''2022-01-01'');
    INSERT INTO transfers (id, amount, type, date) VALUES (2, 50.00, ''Withdrawal'', ''2022-01-02'');
COMMIT;
這個 SQL 語句創建了一個包含兩個操作的事務，第一個操作是向transfers表中插入一條存款記錄，第二個操作是向transfers表中插入一條取款記錄。COMMIT語句用於提交事務，確保所有操作都成功。當事務提交後，數據庫的狀態將更新。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next', 'SELECT * FROM transfers;'),
    (12, 11, NULL,
        '事務可以確保數據庫的一致性和完整性。以下是一些使用事務的優點：
1. 保證數據的完整性：事務可以確保數據庫的一致性和完整性，保證數據的正確性。
2. 提高數據庫的性能：事務可以提高數據庫的性能，減少數據庫的讀取時間。
3. 提高數據庫的安全性：事務可以提高數據庫的安全性，防止數據的丟失或損壞。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next', NULL),
    (12, 12, 'DROP TABLE transfers;',
        '如果在事務過程中出現錯誤，並且您想要撤銷更改，您可以使用ROLLBACK語句。 然後，事務將被回滾，插入和更新語句將不會被執行。 這意味著資料庫中不會發生任何更改。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next', NULL);


# Chapter 7: 實戰案例和最佳實踐
# Lesson 1: 常見的 SQL 問題和解決方案
INSERT INTO sql_learning_system_db.quizzes (lesson_id, lesson_quiz_id, prerequisite_sql, question, type, choice1, choice2, choice3, choice4, answer, check_sql)
VALUES
    (13, 1, 'CREATE TABLE customers (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);
CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    PRIMARY KEY (order_id, product_id)
);
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2)
);
INSERT INTO customers (id, first_name, last_name, email)
VALUES
    (1, ''Alice'', ''Smith'', ''
    (2, ''Bob'', ''Jones'', ''
    (3, ''Charlie'', ''Brown'', '');
INSERT INTO orders (id, customer_id, order_date, total_amount)
VALUES
    (1, 1, ''2022-01-01'', 100.00),
    (2, 2, ''2022-01-02'', 150.00),
    (3, 3, ''2022-01-03'', 200.00);
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES
    (1, 1, 2, 50.00),
    (1, 2, 1, 30.00),
    (2, 2, 3, 30.00),
    (3, 3, 1, 200.00);
INSERT INTO products (id, name, price)
VALUES
    (1, ''Product A'', 50.00),
    (2, ''Product B'', 30.00),
    (3, ''Product C'', 200.00);',
        '現在有4個表，分別是customers、orders、order_items和products，先自己看看表內有甚麼吧。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next', NULL),
    (13, 2, NULL,
        '試試寫出滿足以下描述的SQL語句：(常見的 SQL 問題和解決方案)
查詢每個客戶的總訂單金額',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT customers.first_name, customers.last_name, SUM(orders.total_amount) AS total_order_amount FROM customers JOIN orders ON customers.id = orders.customer_id GROUP BY customers.id, customers.first_name, customers.last_name;', NULL),
    (13, 3, NULL,
        '試試寫出滿足以下描述的SQL語句：(常見的 SQL 問題和解決方案)
查詢每個產品的總銷售量',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT products.name, SUM(order_items.quantity) AS total_sales FROM products JOIN order_items ON products.id = order_items.product_id GROUP BY products.id, products.name;', NULL),
    (13, 4, NULL,
        '試試寫出滿足以下描述的SQL語句：(常見的 SQL 問題和解決方案)
查詢每個客戶的平均訂單金額',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT customers.first_name, customers.last_name, AVG(orders.total_amount) AS avg_order_amount FROM customers JOIN orders ON customers.id = orders.customer_id GROUP BY customers.id, customers.first_name, customers.last_name;', NULL),
    (13, 5, NULL,
        '試試寫出滿足以下描述的SQL語句：(常見的 SQL 問題和解決方案)
查詢每個產品的平均價格',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT products.name, AVG(products.price) AS avg_price FROM products GROUP BY products.id, products.name;', NULL),
    (13, 6, NULL,
        '試試寫出滿足以下描述的SQL語句：(常見的 SQL 問題和解決方案)
查詢每個客戶的訂單數量',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT customers.first_name, customers.last_name, COUNT(orders.id) AS order_count FROM customers JOIN orders ON customers.id = orders.customer_id GROUP BY customers.id, customers.first_name, customers.last_name;', NULL),
    (13, 7, NULL,
        '試試寫出滿足以下描述的SQL語句：(常見的 SQL 問題和解決方案)
查詢每個產品的訂單數量',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT products.name, COUNT(order_items.order_id) AS order_count FROM products JOIN order_items ON products.id = order_items.product_id GROUP BY products.id, products.name;', NULL),
    (13, 8, NULL,
        '試試寫出滿足以下描述的SQL語句：(常見的 SQL 問題和解決方案)
查詢每個客戶的最大訂單金額',
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT customers.first_name, customers.last_name, MAX(orders.total_amount) AS max_order_amount FROM customers JOIN orders ON customers.id = orders.customer_id GROUP BY customers.id, customers.first_name, customers.last_name;', NULL);


# Chapter 7: 實戰案例和最佳實踐
# Lesson 2: SQL 最佳實踐
INSERT INTO sql_learning_system_db.quizzes (lesson_id, lesson_quiz_id, prerequisite_sql, question, type, choice1, choice2, choice3, choice4, answer, check_sql)
VALUES
    (14, 1, NULL,
        'SQL 最佳實踐是一組用於編寫高效、可讀性強且易於維護的 SQL 代碼的準則。以下是一些 SQL 最佳實踐：
1. 使用索引：為經常查詢的列創建索引，以提高查詢效率。
2. 使用視圖：使用視圖簡化複雜的查詢操作，提高數據的安全性和保護數據的完整性。
3. 使用觸發器：使用觸發器在數據庫中自動執行某些操作，提高數據庫的效率和安全性。
4. 使用事務：使用事務確保數據庫的一致性和完整性，提高數據庫的性能和安全性。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next', NULL),
    (14, 2, NULL,
        'SQL 最佳實踐可以幫助您編寫高效、可讀性強且易於維護的 SQL 代碼。以下是一些使用 SQL 最佳實踐的優點：
1. 提高效率：SQL 最佳實踐可以提高 SQL 代碼的執行效率，減少查詢時間。
2. 提高可讀性：SQL 最佳實踐可以提高 SQL 代碼的可讀性，使代碼易於理解和維護。
3. 提高安全性：SQL 最佳實踐可以提高數據庫的安全性，防止數據的丟失或損壞。',
        'ARTICLE', NULL, NULL, NULL, NULL, 'Next', NULL);