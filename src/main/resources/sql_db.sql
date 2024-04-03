drop database if exists sql_db;

create database if not exists sql_db default character set utf8mb4 collate utf8mb4_general_ci;

-- 用户表
create table if not exists sql_db.`user`
(
    `id` bigint not null auto_increment comment '主键' primary key,
    `username` varchar(256) unique not null comment '用户名',
    `password` varchar(256) not null comment '密码',
    `create_time` TIMESTAMP default CURRENT_TIMESTAMP not null comment '创建时间',
    `update_time` TIMESTAMP default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    `is_active` BOOLEAN default false not null comment '是否激活'
) comment '用户表';

create table if not exists sql_db.`sql_session`
(
    `username` varchar(256) unique not null comment '用户名' primary key,
    `container_id` varchar(256) unique not null comment '容器id',
    `expiry_time` TIMESTAMP not null comment '过期',
    `port` int unique not null comment '端口',
    foreign key (`username`) references `user` (`username`)
) comment 'sql会话表';


create table if not exists sql_db.`sql_playground`
(
    `id` bigint not null auto_increment comment '主键' primary key,
    `query` text not null comment 'sql'
) comment 'sql query表';

create table if not exists sql_db.`sql_practice_quiz`
(
    `id` bigint not null auto_increment comment '主键' primary key,
    `question` text not null comment '问题',
    `answer` text not null comment '答案',
    `playground_id` bigint not null comment 'playground id',
    foreign key (`playground_id`) references `sql_playground` (`id`)
) comment 'sql quiz表';

create table if not exists sql_db.`sql_multi_choice_quiz`
(
    `id` bigint not null auto_increment comment '主键' primary key,
    `question` varchar(100) not null comment '问题',
    `option1` varchar(50) not null comment '选项1',
    `option2` varchar(50) not null comment '选项2',
    `option3` varchar(50) not null comment '选项3',
    `option4` varchar(50) not null comment '选项4',
    `answer` int not null comment '答案',
    `playground_id` bigint not null comment 'playground id',
    foreign key (`playground_id`) references `sql_playground` (`id`)
) comment 'sql multi choice quiz表';

insert into sql_db.`user` (`username`, `password`, `is_active`) values ('derr01', '123456', true);


