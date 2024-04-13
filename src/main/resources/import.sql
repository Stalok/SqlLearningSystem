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
    ('CREATE TABLE 語句, DROP TABLE 語句', 'Create new tables in SQL using the CREATE TABLE statement', 'playground', 3, 1),
    ('ALTER TABLE 語句', 'Modify existing tables in SQL using the ALTER TABLE statement', 'playground', 3, 1),
#     ('DROP TABLE 語句', 'Delete tables in SQL using the DROP TABLE statement', 'playground', 3, 1),
    # chapter 4: 資料的插入、更新和刪除
    ('INSERT INTO 語句', 'Insert new data into tables using the INSERT INTO statement', 'playground', 4, 1),
    ('UPDATE 語句', 'Update existing data in tables using the UPDATE statement', 'playground', 4, 1),
    ('DELETE FROM 語句', 'Delete data from tables using the DELETE FROM statement', 'playground', 4, 1),
    # chapter 5: 資料庫設計和正規化
    ('資料庫設計原則', 'Principles of database design', 'text', 5, 1),
    ('資料庫正規化', 'Normalize data in databases using normalization techniques', 'text', 5, 1),
    # chapter 6: 多表操作
    ('JOIN 操作', 'Combine data from multiple tables using JOIN operations in SQL', 'playground', 6, 1),
    ('子查詢', 'Use subqueries to retrieve data in SQL', 'playground', 6, 1),
    ('聯合查詢', 'Combine results from multiple queries using UNION operations in SQL', 'playground', 6, 1),
    # chapter 7: 進階 SQL 主題
    ('視圖', 'Create and use views in SQL to simplify complex queries', 'playground', 7, 1),
    ('索引', 'Improve query performance using indexes in SQL', 'text', 7, 1),
    ('觸發器', 'Implement triggers to automate actions in SQL databases', 'text', 7, 1),
    ('事務', 'Manage transactions in SQL databases using transaction control statements', 'text', 7, 1),
    # chapter 8: 實戰案例和最佳實踐
    ('常見的 SQL 問題和解決方案', 'Common SQL problems and solutions', 'text', 8, 1),
    ('優化 SQL 查詢', 'Optimize SQL queries for better performance', 'text', 8, 1)
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
        , 'article', NULL, NULL, NULL, NULL, 'Next'),
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
', 'article', NULL, NULL, NULL, NULL, 'Next'),
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
     'article', NULL, NULL, NULL, NULL, 'Next')
;


# Chapter 2: 基本 SQL 語法
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
    (5, ''Honda'', 40000, 2015, ''green'')
    (6, ''Ford'', 30000, 2014, ''yellow''),
    (7, ''Chevrolet'', 20000, 2013, ''red''),
    (8, ''Nissan'', 10000, 2012, ''white''),
    (9, ''Hyundai'', 5000, 2011, ''pink''),
    (10, ''Kia'', 1000, 2010, ''white'');',
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
        'SELECT', NULL, NULL, NULL, NULL, 'SELECT * FROM Car WHERE color = ''red''');

# Chapter 3: 資料表的創建和修改
INSERT INTO sql_learning_system_db.quizzes (lesson_id, lesson_quiz_id, prerequisite_sql, question, type, choice1, choice2, choice3, choice4, answer)
VALUES
