USE [LaoShi]
GO
DELETE [System].[Function];
DBCC CHECKIDENT ('[System].[Function]', RESEED, 0); 
GO
DELETE  [System].[FunctionRole];
DBCC CHECKIDENT ('[System].[FunctionRole]', RESEED, 0);
GO
SET IDENTITY_INSERT [System].[Function] ON 
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, NULL, N'S0', N'transfer', 0, N'Select Class', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, NULL, N'S1', NULL, 1, N'Class info', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 2, N'S1-01', N'dashboard', 1, N'Class info - Dashboard', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 2, N'S1-02', N'mycourse-intro', 2, N'Class info - Course Introduction', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 2, N'S1-03', N'mycourse-student-list', 3, N'Class info - Course Student List', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 2, N'S1-04', N'mycourse-material', 4, N'Class info - Course Materials', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 2, N'S1-05', N'mycourse-assignment', 5, N'Class info - Course Assignment', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 2, N'S1-06', N'mycourse-score', 6, N'Class info - Course Score', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, 2, N'S1-07', N'mycourse-discussion', 7, N'Class info - Course Discussion', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, 2, N'S1-08', N'mycourse-teacher', 8, N'Class info - Course''s instructor info', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, NULL, N'S2', NULL, 1, N'Student profile', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, 11, N'S2-01', NULL, 1, N'Student profile - Edit profile info', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, 11, N'S2-02', NULL, 2, N'Student profile - Change pass', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, NULL, N'A1', NULL, 1, N'User Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, 14, N'A1-01', N'user-create', 1, N'User Management - Create new User', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, 14, N'A1-02', N'user-search', 2, N'User Management - Search & edit user', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, 14, N'A1-03', N'user-upload-list', 3, N'User Management - Upload user list', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (18, NULL, N'A2', NULL, 2, N'Role Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (19, 18, N'A2-01', N'role-create', 1, N'Role Management - Create new role', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (20, 18, N'A2-02', N'role-search', 2, N'Role Management - Search & edit role', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (21, NULL, N'A3', NULL, 3, N'Group Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (22, 21, N'A3-01', N'group-create', 1, N'Group Management - Create new group', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (23, 21, N'A3-02', N'group-search', 2, N'Group Management - Search & edit group', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (24, NULL, N'A4', NULL, 4, N'School Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (25, 24, N'A4-01', N'school-create', 1, N'School Management - Create new school', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (26, 24, N'A4-02', N'school-search', 2, N'School Management -  Search & edit school', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (27, NULL, N'A5', NULL, 5, N'Subject Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (28, 27, N'A5-01', N'subject-create', 1, N'Subject Management - Create new subject', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (29, 27, N'A5-02', N'subject-search', 2, N'Subject Management -  Search & edit subject', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (30, NULL, N'A6', NULL, 6, N'Class/ Course Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (31, 30, N'A6-01', N'class-create', 1, N'Class/ Course Management - Create new class', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (32, 30, N'A6-02', N'class-search', 2, N'Class/ Course Management -  Search & edit Class ', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (33, NULL, N'A7', NULL, 7, N'Teacher Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (34, 33, N'A7-01', N'teacher-create', 1, N'Teacher Management - Create new teacher', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (35, 33, N'A7-02', N'teacher-search', 2, N'Teacher Management - Search & edit teacher', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (36, 30, N'A6-03', N'class-report', 3, N'Class/ Course Management -  Class Report', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (37, NULL, N'A8', N'request-management', 8, N'Request Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (39, NULL, N'P0', NULL, 0, N'Home page', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (40, NULL, N'P1', NULL, 1, N'LaoShi Introduction', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (41, NULL, N'P2', NULL, 2, N'LaoShi Information', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (42, NULL, N'P3', NULL, 3, N'LaoShi Studies & Works', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (43, NULL, N'P4', NULL, 4, N'LaoShi ''s students', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (44, NULL, N'P5', NULL, 5, N'LaoShi ''s contact (Make request)', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (45, NULL, N'P6', NULL, 6, N'Login page', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (46, NULL, N'A0', N'dashboard-admin', 0, N'Dashboard of Admin', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (47, NULL, N'G0', N'dashboard-grad', 0, N'Dashboard of Grad-Student', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [System].[Function] OFF
GO
SET IDENTITY_INSERT [System].[FunctionRole] ON 
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 14, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 15, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 16, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 17, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 18, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 19, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 20, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 21, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, 22, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, 23, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, 24, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, 25, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, 26, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, 27, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, 28, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, 29, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, 30, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (18, 31, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (19, 32, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (20, 33, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (21, 34, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (22, 35, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (23, 36, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (24, 37, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (25, 14, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (26, 15, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (27, 16, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (28, 17, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (29, 18, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (30, 19, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (31, 20, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (32, 21, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (33, 22, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (34, 23, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (35, 24, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (36, 25, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (37, 26, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (38, 27, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (39, 28, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (40, 29, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (41, 30, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (42, 31, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (43, 32, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (44, 33, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (45, 34, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (46, 35, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (47, 36, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (48, 37, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (49, 1, 3, N'TA function', 1, 1, CAST(N'2019-12-29T17:22:08.240' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (50, 2, 3, N'Student function', 1, 1, CAST(N'2019-12-29T17:22:08.240' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (51, 3, 3, N'Student function', 1, 1, CAST(N'2019-12-29T17:22:08.240' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (52, 4, 3, N'Student function', 1, 1, CAST(N'2019-12-29T17:22:08.240' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (53, 5, 3, N'Student function', 1, 1, CAST(N'2019-12-29T17:22:08.240' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (54, 6, 3, N'Student function', 1, 1, CAST(N'2019-12-29T17:22:08.240' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (55, 7, 3, N'Student function', 1, 1, CAST(N'2019-12-29T17:22:08.240' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (56, 8, 3, N'Student function', 1, 1, CAST(N'2019-12-29T17:22:08.240' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (57, 9, 3, N'Student function', 1, 1, CAST(N'2019-12-29T17:22:08.240' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (58, 10, 3, N'Student function', 1, 1, CAST(N'2019-12-29T17:22:08.240' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (59, 11, 3, N'Student function', 1, 1, CAST(N'2019-12-29T17:22:08.240' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (60, 12, 3, N'Student function', 1, 1, CAST(N'2019-12-29T17:22:08.240' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (61, 13, 3, N'Student function', 1, 1, CAST(N'2019-12-29T17:22:08.240' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1002, 46, 1, N'Admin function', 1, 1, CAST(N'2019-12-29T17:21:07.357' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1003, 46, 2, N'TA function', 1, 1, CAST(N'2019-12-29T17:21:44.403' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [System].[FunctionRole] OFF
GO
