drop database if exists sql_learning_system_db;

create database if not exists sql_learning_system_db default character set utf8mb4 collate utf8mb4_general_ci;

-- 课程章节表
create table if not exists sql_learning_system_db.`chapter`
(
    `id` int not null auto_increment comment '主键' primary key,
    `course_id` int not null comment '章节id, 第X章',
    `name` varchar(256) not null comment '章节名称',
    `description` varchar(256) not null comment '章节描述',
    `create_time` TIMESTAMP default CURRENT_TIMESTAMP not null comment '创建时间',
    `update_time` TIMESTAMP default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    `is_active` BOOLEAN default false not null comment '是否激活'
) comment '课程章节表';

-- 课程表
create table if not exists sql_learning_system_db.`lesson`
(
    `id` int not null auto_increment comment '主键' primary key,
    `name` varchar(256) not null comment '课程名称',
    `description` varchar(256) not null comment '课程描述',
    `type` varchar(256) not null comment '课程类型, could be article or playground(lab)',
    `chapter` int not null comment '所屬章节' references chapter(id),
    `total_quizzes` int default 0 not null comment '总quiz数',
    `create_time` TIMESTAMP default CURRENT_TIMESTAMP not null comment '创建时间',
    `update_time` TIMESTAMP default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    `is_active` BOOLEAN default false not null comment '是否激活'
) comment '课程表';

drop table if exists sql_learning_system_db.`user`;
-- 用户表
create table if not exists sql_learning_system_db.`user`
(
    `id` bigint not null auto_increment comment '主键' primary key,
    `username` varchar(256) unique not null comment '用户名',
    `password` varchar(256) not null comment '密码',
    `email` varchar(256) not null comment '邮箱',
    `progress` int default 1 not null comment '学习进度, store the last completed lesson id' references lesson(id),
    `create_time` TIMESTAMP default CURRENT_TIMESTAMP not null comment '创建时间',
    `update_time` TIMESTAMP default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    `last_login_time` TIMESTAMP default CURRENT_TIMESTAMP not null comment '最后登录时间',
    `is_active` BOOLEAN default true not null comment '是否激活'
) comment '用户表';



drop table if exists sql_learning_system_db.quizzes;
create table if not exists sql_learning_system_db.quizzes (
    id int primary key auto_increment comment 'quiz id',
    lesson_id int not null comment 'lesson id' references lesson(id),
    lesson_quiz_id int not null comment '用于在lesson中排序',    -- 用于在playground中排序
    prerequisite_sql varchar(3000) comment 'sql to run before the quiz',      -- sql to run before the quiz
    question varchar(3000) not null,     -- 问题
    type varchar(255) not null,         -- 类型 (article, multi_choice, SELECT, changes)
    choice1 varchar(355),
    choice2 varchar(355),
    choice3 varchar(355),
    choice4 varchar(355),
    answer varchar(2000),
    check_sql varchar(3000)   -- 检查sql
    -- multi_choice:
    -- query: select ...
    -- changes: make changes to mirror_db and query both db to compare
);
create trigger after_insert_quizzes
    after insert on sql_learning_system_db.quizzes
    for each row
    begin
        update sql_learning_system_db.lesson
        set total_quizzes = (select count(*) from quizzes where lesson_id = new.lesson_id)
        where id = new.lesson_id;
    end;

SELECT TRIGGER_NAME, EVENT_MANIPULATION, EVENT_OBJECT_TABLE
FROM information_schema.TRIGGERS;
# drop table if exists sql_learning_system_db.playground_session;
# create table if not exists sql_learning_system_db.playground_session (
#     `username` varchar(256) unique not null comment '用户名' primary key,
#     `container_id` varchar(256) unique not null comment '容器id',
#     `port` int unique not null comment '端口',
#     `expiry_time` TIMESTAMP not null comment '过期',
#     foreign key (`username`) references `user` (`username`)
# );