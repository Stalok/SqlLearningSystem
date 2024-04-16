
1. **SQL 簡介**
    - 什麼是 SQL？, SQL 的歷史和用途, 常見的 SQL 資料庫系統

2. **基本 SQL 語法**
    - SELECT 語句, WHERE 子句
    - ORDER BY 子句
    - GROUP BY 子句, HAVING 子句

3. **資料表的創建和修改、資料的插入、更新和刪除**
    - CREATE TABLE 語句, DROP TABLE 語句, ALTER TABLE 語句
    - INSERT INTO 語句, DELETE FROM 語句, UPDATE 語句

4. **資料庫設計和正規化**
    - 資料庫設計原則, 正規化的基本概念

5. **多表操作**
    - JOIN 操作
    - UNION 操作, INTERSECT 操作
    - 子查詢

6. **進階 SQL 主題**
    - 視圖 (Views)
    - 索引 (Indexes), 觸發器 (Triggers)和事務 (Transactions)

7. **實戰案例和最佳實踐**
    - 常見的 SQL 問題和解決方案
    - SQL 最佳實踐


# 选题依据：基于容器化的 MySQL 教学平台设计与实现

## 目的和意义

在当今信息技术快速发展的背景下，数据库管理系统（DBMS）作为数据存储和管理的核心，对于计算机专业学生的培养至关重要。然而，传统的数据库教学往往受到硬件资源、环境配置和实验难度等因素的限制。因此，我们有必要探讨一种更灵活、高效的数据库教学模式。

本选题旨在设计和实现一个基于容器化的 MySQL 教学平台，为学生提供一个直接在浏览器中操作 MySQL 容器的环境，以便更好地学习和实践数据库知识。

## 国内外现状和发展趋势

### 现状

- **传统数据库教学**：传统数据库教学通常依赖于实验室环境，需要配置专门的服务器和数据库软件，存在资源浪费和环境复杂的问题。
- **云数据库服务**：云数据库服务（如阿里云RDS、腾讯云CDB）提供了便捷的数据库管理，但学生无法自主操作和探索。
- **容器化技术**：容器化技术（如Docker、Kubernetes）的发展使得数据库容器可以在不同环境中快速部署和管理。

### 发展趋势

- **容器化教学平台**：越来越多的教育机构开始关注容器化教学平台，为学生提供更灵活、高效的实验环境。
- **自助式学习**：学生可以根据自己的需求随时创建、管理和销毁数据库容器，实现自主学习。
- **云原生数据库**：云原生数据库（如TiDB、CockroachDB）结合了容器化和分布式技术，成为未来数据库领域的发展趋势。

## 主要参考文献

1. W3Schools. [MySQL Tutorial](https://www.w3schools.com/mysql/).
2. 知乎专栏. [SQL、Mysql、数据库到底什么关系？](https://zhuanlan.zhihu.com/p/130768469).
3. GeeksforGeeks. [SQL vs MySQL](https://www.geeksforgeeks.org/sql-vs-mysql/).
4. 知乎. [容器化 | 基于 Kubernetes 的新一代 MySQL 高可用架构实现方案](https://zhuanlan.zhihu.com/p/385980232).
5. 菜鸟教程. [MySQL 教程](https://www.runoob.com/mysql/mysql-tutorial.html).
6. 知乎. [京东到家MySQL容器化，为何首选Docker而非K8s？](https://www.zhihu.com/question/462713524).
7. 博客园. [容器化 | MySQL on K8s 开源开放的高可用容器编排方案 - RadonDB](https://www.cnblogs.com/radondb/p/14892635.html).
