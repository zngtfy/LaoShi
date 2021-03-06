USE [LaoShi]
GO
DELETE [System].[User];
DBCC CHECKIDENT ('[System].[User]', RESEED, 0); 
GO
DELETE [System].[Role];
DBCC CHECKIDENT ('[System].[Role]', RESEED, 0);
GO
SET IDENTITY_INSERT [Business].[Student] ON 
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'1654050052', 5, CAST(N'1998-01-01T00:00:00.000' AS DateTime), 1, N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'1654050051', 6, CAST(N'1998-10-19T00:00:00.000' AS DateTime), 1, N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'1654052049', 7, CAST(N'1998-03-11T00:00:00.000' AS DateTime), 1, N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, N'1654050032', 8, CAST(N'1997-02-04T00:00:00.000' AS DateTime), 1, N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'1654050100', 9, CAST(N'1998-05-14T00:00:00.000' AS DateTime), 1, N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, N'1551040043', 10, CAST(N'1997-11-21T00:00:00.000' AS DateTime), 0, N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, N'18xxxxxxxx', 11, CAST(N'1985-05-05T00:00:00.000' AS DateTime), 0, N'HVCH khóa 2018, ngành KHMT', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[Student] OFF
GO
SET IDENTITY_INSERT [Business].[TeacherDelegateStudent] ON 
GO
INSERT [Business].[TeacherDelegateStudent] ([Id], [TeacherId], [StudentId], [Topic], [Description], [Time], [SupervisedType], [RefUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, 1, N'NGHIÊN CỨU VÀ ỨNG DỤNG AI VÀO HỆ THỐNG PHỎNG VẤN ẢO HỖ TRỢ DOANH NGHIỆP (VIS)', N'Nghiên cứu khoa học sinh viên, Đồ án tốt nghiệp đai học', N'2019-2020', N'SV-TNDH', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherDelegateStudent] ([Id], [TeacherId], [StudentId], [Topic], [Description], [Time], [SupervisedType], [RefUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, 2, N'Áp dụng và nghiên cứu công nghệ AI nhằm phát triển ứng dụng dịch tự động Trung - Việt (cơ bản)', N'Nghiên cứu khoa học sinh viên, Đồ án tốt nghiệp đai học', N'2019-2020', N'SV-TNDH', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherDelegateStudent] ([Id], [TeacherId], [StudentId], [Topic], [Description], [Time], [SupervisedType], [RefUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, 3, N'Áp dụng và nghiên cứu công nghệ AI nhằm phát triển ứng dụng dịch tự động Trung - Việt (cơ bản)', N'Nghiên cứu khoa học sinh viên, Đồ án tốt nghiệp đai học', N'2019-2020', N'SV-TNDH', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherDelegateStudent] ([Id], [TeacherId], [StudentId], [Topic], [Description], [Time], [SupervisedType], [RefUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 1, 4, N'NGHIÊN CỨU VÀ ỨNG DỤNG AI VÀO HỆ THỐNG PHỎNG VẤN ẢO HỖ TRỢ DOANH NGHIỆP (VIS)', N'Nghiên cứu khoa học sinh viên, Đồ án tốt nghiệp đai học', N'2019-2020', N'SV-TNDH', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherDelegateStudent] ([Id], [TeacherId], [StudentId], [Topic], [Description], [Time], [SupervisedType], [RefUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 1, 5, N'NGHIÊN CỨU VÀ ỨNG DỤNG AI VÀO HỆ THỐNG PHỎNG VẤN ẢO HỖ TRỢ DOANH NGHIỆP (VIS)', N'Nghiên cứu khoa học sinh viên, Đồ án tốt nghiệp đai học', N'2019-2020', N'SV-TNDH', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherDelegateStudent] ([Id], [TeacherId], [StudentId], [Topic], [Description], [Time], [SupervisedType], [RefUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 1, 6, N'Áp dụng và nghiên cứu công nghệ AI nhằm phát triển ứng dụng dịch tự động Trung - Việt (cơ bản)', N'Nghiên cứu khoa học sinh viên, Đồ án tốt nghiệp đai học', N'2019-2020', N'SV-TNDH', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherDelegateStudent] ([Id], [TeacherId], [StudentId], [Topic], [Description], [Time], [SupervisedType], [RefUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 1, 7, N'NGHIÊN CỨU XÂY DỰNG ỨNG DỤNG DỊCH TỰ ĐỘNG ĐƠN GIẢN NGÔN NGỮ TRUNG-VIỆT DỰA TRÊN THÀNH QUẢ                  CÔNG NGHỆ AI HIỆN ĐẠI', N'Luận văn thạc sĩ', N'2019-2020', N'LV-ThS', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[TeacherDelegateStudent] OFF
GO
SET IDENTITY_INSERT [System].[Role] ON 
GO
INSERT [System].[Role] ([Id], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'Administration', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Role] ([Id], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'Teacher Assistant', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Role] ([Id], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'Student', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Role] ([Id], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, N'Other Teacher', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Role] ([Id], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'School-Staff', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Role] ([Id], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, N'Guest', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Role] ([Id], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1002, N'Grad-Student', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [System].[Role] OFF
GO
SET IDENTITY_INSERT [System].[User] ON 
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'admin', N'Hao', N'Lee', N'occbuu@gmail.com', N'+84919004169', N'39-41 Lê Thạch, Phường 12, Quận 4, TP.HCM', N'assets/img/avatars/ava2.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', 'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, GETDATE(), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'hanh', N'Phúc Hạnh', N'Nguyễn Thị', N'nguyenthiphuchanh@gmail.com', N'+84 975221728', N'39-41 Lê Thạch, Phường 12, Quận 4, TP.HCM', N'assets/img/avatars/ava3.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', 'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, GETDATE(), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'nhat', N'Duy Nhật', N'Nguyễn', N'duynhat240896@gmail.com', N'+84 792073173', N'39-41 Lê Thạch, Phường 12, Quận 4, TP.HCM', N'assets/img/avatars/ava4.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', 'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, GETDATE(), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, N'an', N'Trường An', N'Nguyễn Dương', N'anannguyen202@gmail.com', N'+84 398131428', N'39-41 Lê Thạch, Phường 12, Quận 4, TP.HCM', N'assets/img/avatars/ava5.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', 'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, GETDATE(), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'yenkhuong214@gmail.com', N'Khương', N'Nguyễn Thị Yến', N'yenkhuong214@gmail.com', N'+84 764668557', N'59/39/15B Đỗ Thúc Tịnh, phường 12, quận Gò Vấp, thành phố Hồ Chí Minh', N'assets/img/avatars/ava6.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', 'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, GETDATE(), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, N'buikhue0959@gmail.com', N'Khuê', N'Bùi Đan', N'buikhue0959@gmail.com', N'+84 907940889', N'401 Nguyễn Trãi, phường 7, quận 5, Tp.HCM', N'assets/img/avatars/ava1.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', 'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, GETDATE(), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, N'tranthihonghuong176@gmail.com', N'Hường', N'Trần Thị Hồng', N'tranthihonghuong176@gmail.com', N'+84 987654321', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/ava5.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', 'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, GETDATE(), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, N'hangntt2398@gmail.com', N'Hằng', N'Nguyễn Thị Thanh', N'hangntt2398@gmail.com', N'+84 987654321', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/ava4.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', 'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, GETDATE(), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, N'thanhnguyen145.ou@gmail.com', N'Thanh', N'Nguyễn Thị Thu', N'thanhnguyen145.ou@gmail.com', N'+84 987654321', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/ava3.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', 'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, GETDATE(), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, N'nguyentankhoi97@gmail.com', N'Khôi', N'Nguyễn Tấn', N'nguyentankhoi97@gmail.com', N'+84 329746982', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/ava5.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', 'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, GETDATE(), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, N'lochh.188i@ou.edu.vn', N'Lộc', N'Huỳnh Hoàng', N'lochh.188i@ou.edu.vn', N'+84 987654321', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/ava2.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', 'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, GETDATE(), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, N'toan.nguyen@tanvieta.co', N'Zng', N'Tfy', N'toan.nguyen@tanvieta.co', N'+84345 515 010', N'39-41 Lê Thạch, Phường 12, Quận 4, TP.HCM', N'assets/img/avatars/ava2.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', 'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, GETDATE(), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [System].[User] OFF
GO
