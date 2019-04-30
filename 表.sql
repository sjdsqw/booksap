/*
Navicat SQL Server Data Transfer

Source Server         : Book
Source Server Version : 105000
Source Host           : localhost:1433
Source Database       : book
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 105000
File Encoding         : 65001

Date: 2019-04-30 12:55:52
*/


-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE [admin]
GO
CREATE TABLE [admin] (
[id] varchar(255) NOT NULL ,
[password] varchar(255) NOT NULL ,
[auth] varchar(255) NULL 
)


GO

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [admin] ([id], [password], [auth]) VALUES (N'admin', N'123123', N'1'), (N'sjds', N'123456', N'1')
GO
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE [book]
GO
CREATE TABLE [book] (
[id] int NOT NULL ,
[bookname] varchar(255) NULL ,
[number] int NULL ,
[describe] varchar(255) NULL ,
[price] float(53) NULL ,
[img] varchar(255) NULL 
)


GO

-- ----------------------------
-- Records of book
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [book] ([id], [bookname], [number], [describe], [price], [img]) VALUES (N'1', N'三国演义', N'200', N'历史类', N'50', null), (N'2', N'水浒传', N'60', N'历史类', N'67', null), (N'3', N'骆驼祥子', N'54', N'文学类', N'47', null), (N'4', N'天体运动', N'65', N'科幻类', N'78', null), (N'5', N'三生三世', N'65', N'文学类', N'65', null), (N'6', N'核武器', N'54', N'军事类', N'74', null), (N'7', N'历史7', N'54', N'历史类', N'54', null), (N'8', N'历史8', N'54', N'历史类', N'6', null), (N'9', N'历史9', N'54', N'历史类', N'45', null), (N'10', N'历史10', N'54', N'历史类', N'45', null), (N'11', N'历史11', N'54', N'历史类', N'45', null), (N'12', N'历史12', N'54', N'历史类', N'45', null)
GO
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE [borrow]
GO
CREATE TABLE [borrow] (
[jiebookname] varchar(255) NULL ,
[peopleid] varchar(255) NULL 
)


GO

-- ----------------------------
-- Records of borrow
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [borrow] ([jiebookname], [peopleid]) VALUES (N'', N''), (N'水浒传', N'123456'), (N'水浒传', N'111')
GO
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for d_user
-- ----------------------------
DROP TABLE [d_user]
GO
CREATE TABLE [d_user] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] varchar(255) NULL ,
[sex] varchar(255) NULL ,
[salary] float(53) NULL 
)


GO

-- ----------------------------
-- Records of d_user
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [d_user] ON
GO
SET IDENTITY_INSERT [d_user] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE [t_user]
GO
CREATE TABLE [t_user] (
[id] int NOT NULL ,
[name] varchar(255) NULL ,
[sex] varchar(255) NULL ,
[salary] float(53) NULL 
)


GO

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN TRANSACTION
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Indexes structure for table admin
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table admin
-- ----------------------------
ALTER TABLE [admin] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table book
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table book
-- ----------------------------
ALTER TABLE [book] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table d_user
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table d_user
-- ----------------------------
ALTER TABLE [d_user] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table t_user
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_user
-- ----------------------------
ALTER TABLE [t_user] ADD PRIMARY KEY ([id])
GO
