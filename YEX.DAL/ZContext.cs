using Microsoft.EntityFrameworkCore;
using SKG.Ext;

namespace YEX.DAL
{
    using Models;

    public partial class ZContext : DbContext
    {
        public ZContext() { }

        public ZContext(DbContextOptions<ZContext> options) : base(options) { }

        public virtual DbSet<AssignmentSubmission> AssignmentSubmission { get; set; }
        public virtual DbSet<Class> Class { get; set; }
        public virtual DbSet<ClassAnnouncement> ClassAnnouncement { get; set; }
        public virtual DbSet<ClassAssignment> ClassAssignment { get; set; }
        public virtual DbSet<ClassAssignmentExam> ClassAssignmentExam { get; set; }
        public virtual DbSet<ClassAssignmentGroup> ClassAssignmentGroup { get; set; }
        public virtual DbSet<ClassAttendance> ClassAttendance { get; set; }
        public virtual DbSet<ClassDocument> ClassDocument { get; set; }
        public virtual DbSet<ClassMember> ClassMember { get; set; }
        public virtual DbSet<ClassScoreConfig> ClassScoreConfig { get; set; }
        public virtual DbSet<ClassSession> ClassSession { get; set; }
        public virtual DbSet<ClassStudent> ClassStudent { get; set; }
        public virtual DbSet<ClassStudentScore> ClassStudentScore { get; set; }
        public virtual DbSet<Code> Code { get; set; }
        public virtual DbSet<CodeType> CodeType { get; set; }
        public virtual DbSet<Comment> Comment { get; set; }
        public virtual DbSet<Exam> Exam { get; set; }
        public virtual DbSet<ExamAnswer> ExamAnswer { get; set; }
        public virtual DbSet<ExamDetail> ExamDetail { get; set; }
        public virtual DbSet<ExamQuestion> ExamQuestion { get; set; }
        public virtual DbSet<Function> Function { get; set; }
        public virtual DbSet<FunctionRole> FunctionRole { get; set; }
        public virtual DbSet<Group> Group { get; set; }
        public virtual DbSet<LoginHistory> LoginHistory { get; set; }
        public virtual DbSet<News> News { get; set; }
        public virtual DbSet<PasswordHistory> PasswordHistory { get; set; }
        public virtual DbSet<ReferenceDocument> ReferenceDocument { get; set; }
        public virtual DbSet<Request> Request { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<School> School { get; set; }
        public virtual DbSet<SchoolCampus> SchoolCampus { get; set; }
        public virtual DbSet<Setting> Setting { get; set; }
        public virtual DbSet<Student> Student { get; set; }
        public virtual DbSet<StudentExam> StudentExam { get; set; }
        public virtual DbSet<StudentExamDetail> StudentExamDetail { get; set; }
        public virtual DbSet<Subject> Subject { get; set; }
        public virtual DbSet<SubmissionAttachment> SubmissionAttachment { get; set; }
        public virtual DbSet<Teacher> Teacher { get; set; }
        public virtual DbSet<TeacherDelegateStudent> TeacherDelegateStudent { get; set; }
        public virtual DbSet<TeacherEduBackground> TeacherEduBackground { get; set; }
        public virtual DbSet<TeacherExperience> TeacherExperience { get; set; }
        public virtual DbSet<TeacherMajor> TeacherMajor { get; set; }
        public virtual DbSet<TeacherPublicProfile> TeacherPublicProfile { get; set; }
        public virtual DbSet<TeacherResearchWork> TeacherResearchWork { get; set; }
        public virtual DbSet<TeacherSkill> TeacherSkill { get; set; }
        public virtual DbSet<TeacherStudy> TeacherStudy { get; set; }
        public virtual DbSet<Thesis> Thesis { get; set; }
        public virtual DbSet<ThesisDoc> ThesisDoc { get; set; }
        public virtual DbSet<ThesisPublication> ThesisPublication { get; set; }
        public virtual DbSet<ThesisReference> ThesisReference { get; set; }
        public virtual DbSet<ThesisStudent> ThesisStudent { get; set; }
        public virtual DbSet<ThesisTeacher> ThesisTeacher { get; set; }
        public virtual DbSet<ThesisWork> ThesisWork { get; set; }
        public virtual DbSet<ThesisWorkAttachment> ThesisWorkAttachment { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<UserGroup> UserGroup { get; set; }
        public virtual DbSet<UserRole> UserRole { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                var user = AppSetting.S.DbUser;
                //var password = AppSetting.S.DbPassword.Decrypt(AppSetting.S.RsaPrivateKey);
                var password = "Password123";
                var t = string.Format(AppSetting.S.DbConnection, user, password);
                optionsBuilder.UseSqlServer(t);
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AssignmentSubmission>(entity =>
            {
                entity.ToTable("AssignmentSubmission", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.SubmissionUrl)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.SubmitForGroup)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.SubmitForMembers).IsUnicode(false);

                entity.Property(e => e.SubmitType)
                    .HasMaxLength(20)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Class>(entity =>
            {
                entity.ToTable("Class", "Business");

                entity.Property(e => e.ClassTime).HasMaxLength(500);

                entity.Property(e => e.Code).HasMaxLength(50);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.EndDate).HasColumnType("datetime");

                entity.Property(e => e.Images)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);

                entity.Property(e => e.Note).HasColumnType("ntext");

                entity.Property(e => e.SchoolYear)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.StartDate).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.Venue).HasMaxLength(4000);
            });

            modelBuilder.Entity<ClassAnnouncement>(entity =>
            {
                entity.ToTable("ClassAnnouncement", "Business");

                entity.Property(e => e.Brief).HasMaxLength(500);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.Title).HasMaxLength(500);

                entity.Property(e => e.Type).HasMaxLength(500);
            });

            modelBuilder.Entity<ClassAssignment>(entity =>
            {
                entity.ToTable("ClassAssignment", "Business");

                entity.Property(e => e.AssignmentContent).HasColumnType("ntext");

                entity.Property(e => e.AssignmentType)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.AssignmentUrl)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.DueDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.SubmitType)
                    .HasMaxLength(20)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ClassAssignmentExam>(entity =>
            {
                entity.ToTable("ClassAssignmentExam", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Note).HasMaxLength(500);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<ClassAssignmentGroup>(entity =>
            {
                entity.ToTable("ClassAssignmentGroup", "Business");
            });

            modelBuilder.Entity<ClassAttendance>(entity =>
            {
                entity.ToTable("ClassAttendance", "Business");

                entity.Property(e => e.Altitude)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.DeviceId)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Latitude)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Longtitude)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Note).HasMaxLength(500);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<ClassDocument>(entity =>
            {
                entity.ToTable("ClassDocument", "Business");

                entity.Property(e => e.Content).HasColumnType("ntext");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Description).HasMaxLength(500);

                entity.Property(e => e.DocumentType).HasMaxLength(20);

                entity.Property(e => e.ImageUrl)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.LinkUrl)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.Title).HasMaxLength(500);

                entity.Property(e => e.Type).HasMaxLength(20);
            });

            modelBuilder.Entity<ClassMember>(entity =>
            {
                entity.ToTable("ClassMember", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.MemberRole).HasMaxLength(4000);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Note).HasColumnType("ntext");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<ClassScoreConfig>(entity =>
            {
                entity.ToTable("ClassScoreConfig", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<ClassSession>(entity =>
            {
                entity.ToTable("ClassSession", "Business");

                entity.Property(e => e.ClassContent).HasColumnType("ntext");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.DateOfClass).HasColumnType("datetime");

                entity.Property(e => e.FromTime)
                    .HasMaxLength(5)
                    .IsUnicode(false);

                entity.Property(e => e.Location).HasMaxLength(500);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Session)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.SessionType)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.ToTime)
                    .HasMaxLength(5)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ClassStudent>(entity =>
            {
                entity.ToTable("ClassStudent", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.FinalResult)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FinalScore).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.StudentRole)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ClassStudentScore>(entity =>
            {
                entity.ToTable("ClassStudentScore", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Note).HasMaxLength(500);

                entity.Property(e => e.Score).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.ScoreType)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<Code>(entity =>
            {
                entity.ToTable("Code", "System");

                entity.Property(e => e.CodeType)
                    .HasMaxLength(64)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.DisplayAs).HasColumnType("ntext");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.HasOne(d => d.CodeTypeNavigation)
                    .WithMany(p => p.CodeNavigation)
                    .HasForeignKey(d => d.CodeType)
                    .HasConstraintName("FkCodeType");

                entity.HasOne(d => d.Parent)
                    .WithMany(p => p.InverseParent)
                    .HasForeignKey(d => d.ParentId)
                    .HasConstraintName("FkCodeParent");
            });

            modelBuilder.Entity<CodeType>(entity =>
            {
                entity.HasKey(e => e.Code)
                    .HasName("PK__CodeType__A25C5AA6DDBFDB4F");

                entity.ToTable("CodeType", "System");

                entity.Property(e => e.Code)
                    .HasMaxLength(64)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.DisplayAs).HasColumnType("ntext");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<Comment>(entity =>
            {
                entity.ToTable("Comment", "Business");

                entity.Property(e => e.ApprovedDate).HasColumnType("datetime");

                entity.Property(e => e.CommentType)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<Exam>(entity =>
            {
                entity.ToTable("Exam", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ExamDepartment).HasMaxLength(500);

                entity.Property(e => e.ExamSchool).HasMaxLength(500);

                entity.Property(e => e.ExamType)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<ExamAnswer>(entity =>
            {
                entity.ToTable("ExamAnswer", "Business");

                entity.Property(e => e.AnswerImage)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.AnswerType)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.IsCorrect).HasDefaultValueSql("((0))");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<ExamDetail>(entity =>
            {
                entity.ToTable("ExamDetail", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<ExamQuestion>(entity =>
            {
                entity.ToTable("ExamQuestion", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.QuestionImage)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.QuestionInstruction).HasMaxLength(500);

                entity.Property(e => e.QuestionType)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Note)
                    .HasMaxLength(500)
                    .IsUnicode(true);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<Function>(entity =>
            {
                entity.ToTable("Function", "System");

                entity.Property(e => e.Code)
                    .HasMaxLength(64)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Description)
                    .HasMaxLength(512)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.Url)
                    .HasMaxLength(128)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<FunctionRole>(entity =>
            {
                entity.ToTable("FunctionRole", "System");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Description)
                    .HasMaxLength(512)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<Group>(entity =>
            {
                entity.ToTable("Group", "System");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Description).HasMaxLength(512);

                entity.Property(e => e.InitialChar).HasMaxLength(32);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<LoginHistory>(entity =>
            {
                entity.ToTable("LoginHistory", "System");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Host)
                    .HasMaxLength(256)
                    .IsUnicode(false);

                entity.Property(e => e.LastAccessedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.SignInOn).HasColumnType("datetime");

                entity.Property(e => e.SignOutOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.UserAgent)
                    .HasMaxLength(256)
                    .IsUnicode(false);

                entity.Property(e => e.UserName)
                    .HasMaxLength(128)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<News>(entity =>
            {
                entity.ToTable("News", "Business");

                entity.Property(e => e.Brief).HasMaxLength(512);

                entity.Property(e => e.Category)
                    .HasMaxLength(64)
                    .IsUnicode(false);

                entity.Property(e => e.Content).HasColumnType("ntext");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ImgUrl).IsUnicode(false);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.NewsType)
                    .HasMaxLength(64)
                    .IsUnicode(false);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.Thumbnail).IsUnicode(false);

                entity.Property(e => e.Title).HasMaxLength(512);
            });

            modelBuilder.Entity<PasswordHistory>(entity =>
            {
                entity.ToTable("PasswordHistory", "System");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.PasswordHash).HasColumnType("text");

                entity.Property(e => e.PasswordSalt).HasColumnType("text");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<ReferenceDocument>(entity =>
            {
                entity.ToTable("ReferenceDocument", "Business");

                entity.Property(e => e.City).HasMaxLength(200);

                entity.Property(e => e.Content).HasColumnType("ntext");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Doi)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.DownloadUrl)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.IndexedBy).HasMaxLength(500);

                entity.Property(e => e.Isbn)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Issn)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Pages)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Publisher).HasMaxLength(500);

                entity.Property(e => e.PublisherUrl)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.RefUrl)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.Type)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ViewGroup)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Request>(entity =>
            {
                entity.ToTable("Request", "Business");

                entity.Property(e => e.Content).HasColumnType("ntext");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.RequestName).HasMaxLength(100);

                entity.Property(e => e.RequestType)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Result).HasMaxLength(200);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.ViewGroup)
                    .HasMaxLength(1)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role", "System");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Description)
                    .HasMaxLength(512)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<School>(entity =>
            {
                entity.ToTable("School", "Business");

                entity.Property(e => e.BriefName).HasMaxLength(500);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Description).HasColumnType("ntext");

                entity.Property(e => e.LogoUrl).HasMaxLength(500);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.SchoolAddress).HasMaxLength(500);

                entity.Property(e => e.SchoolCode).HasMaxLength(50);

                entity.Property(e => e.SchoolName).HasMaxLength(500);

                entity.Property(e => e.SchoolNameEng).HasMaxLength(500);

                entity.Property(e => e.SchoolPhone).HasMaxLength(50);

                entity.Property(e => e.SchoolType).HasMaxLength(200);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.WebSite).HasMaxLength(2000);
            });

            modelBuilder.Entity<SchoolCampus>(entity =>
            {
                entity.ToTable("SchoolCampus", "Business");

                entity.Property(e => e.CampusName).HasMaxLength(500).IsUnicode(true);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Address).HasMaxLength(500).IsUnicode(true);

                entity.Property(e => e.Note).HasMaxLength(500).IsUnicode(true);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Latitude).HasMaxLength(200).IsUnicode(false);
                entity.Property(e => e.Longtitude).HasMaxLength(200).IsUnicode(false);
                entity.Property(e => e.Altitude).HasMaxLength(200).IsUnicode(false);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
                
            });

            modelBuilder.Entity<Setting>(entity =>
            {
                entity.ToTable("Setting", "System");

                entity.Property(e => e.Code)
                    .HasMaxLength(64)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.DataType)
                    .HasMaxLength(32)
                    .IsUnicode(false);

                entity.Property(e => e.Description)
                    .HasMaxLength(512)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.Value)
                    .HasMaxLength(1024)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Student>(entity =>
            {
                entity.ToTable("Student", "Business");

                entity.Property(e => e.Birthday).HasColumnType("datetime");

                entity.Property(e => e.Class).HasMaxLength(512);

                entity.Property(e => e.CourseName).HasMaxLength(512);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Note).HasMaxLength(500);

                entity.Property(e => e.OfficialStudentId)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.StudentType)
                    .HasMaxLength(128)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<StudentExam>(entity =>
            {
                entity.ToTable("StudentExam", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.EndTime).HasColumnType("datetime");

                entity.Property(e => e.Note).HasMaxLength(500);

                entity.Property(e => e.StartTime).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<StudentExamDetail>(entity =>
            {
                entity.ToTable("StudentExamDetail", "Business");

                entity.Property(e => e.Answers).HasMaxLength(500);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Note).HasMaxLength(500);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<Subject>(entity =>
            {
                entity.ToTable("Subject", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Department).HasMaxLength(500);

                entity.Property(e => e.MajorGroup).HasMaxLength(50);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Note).HasColumnType("ntext");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.SubjectCode).HasMaxLength(50);

                entity.Property(e => e.SubjectName)
                    .IsRequired()
                    .HasMaxLength(500);

                entity.Property(e => e.SubjectType).HasMaxLength(20);
            });

            modelBuilder.Entity<SubmissionAttachment>(entity =>
            {
                entity.ToTable("SubmissionAttachment", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.DisplayName).HasMaxLength(512);

                entity.Property(e => e.Extension).HasMaxLength(250);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.Url).IsUnicode(false);
            });

            modelBuilder.Entity<Teacher>(entity =>
            {
                entity.ToTable("Teacher", "Business");

                entity.Property(e => e.Address).HasMaxLength(500);

                entity.Property(e => e.Birthday).HasColumnType("datetime");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Email)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.FullName).HasMaxLength(200);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.PhoneNumber)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.Title).HasMaxLength(50);

                entity.Property(e => e.ViewGroup)
                    .HasMaxLength(1)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TeacherDelegateStudent>(entity =>
            {
                entity.ToTable("TeacherDelegateStudent", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Description).HasMaxLength(2000);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.RefUrl)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.SupervisedType).HasMaxLength(1000);

                entity.Property(e => e.Time).HasMaxLength(100);

                entity.Property(e => e.Topic).HasMaxLength(1000);

                entity.Property(e => e.ViewGroup)
                    .HasMaxLength(1)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TeacherEduBackground>(entity =>
            {
                entity.ToTable("TeacherEduBackground", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.DegreeDate).HasColumnType("datetime");

                entity.Property(e => e.DegreeNo).HasMaxLength(200);

                entity.Property(e => e.DegreeRegNo).HasMaxLength(200);

                entity.Property(e => e.Duration)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.RefUrl1)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.RefUrl2)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.Title).HasMaxLength(2000);

                entity.Property(e => e.Type)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ViewGroup)
                    .HasMaxLength(1)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TeacherExperience>(entity =>
            {
                entity.ToTable("TeacherExperience", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Description).HasColumnType("ntext");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.ViewGroup)
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.WorkLevel).HasMaxLength(250);

                entity.Property(e => e.WorkLocation).HasMaxLength(200);

                entity.Property(e => e.WorkTitle).HasMaxLength(1000);

                entity.Property(e => e.WorkType)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.WorkingTime).HasMaxLength(100);
            });

            modelBuilder.Entity<TeacherMajor>(entity =>
            {
                entity.ToTable("TeacherMajor", "Business");

                entity.Property(e => e.CanDelete).HasDefaultValueSql("((0))");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Field).HasMaxLength(250);

                entity.Property(e => e.FieldEng).HasMaxLength(250);

                entity.Property(e => e.MajorCode).HasMaxLength(50);

                entity.Property(e => e.MajorName).HasMaxLength(500);

                entity.Property(e => e.MajorNameEng).HasMaxLength(500);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.ViewGroup)
                    .HasMaxLength(1)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TeacherPublicProfile>(entity =>
            {
                entity.ToTable("TeacherPublicProfile", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Description).HasMaxLength(2000);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.RefUrl)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.SourceLogoUrl)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.SourceName).HasMaxLength(1000);

                entity.Property(e => e.SourceType).HasMaxLength(1000);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.ViewGroup)
                    .HasMaxLength(1)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TeacherResearchWork>(entity =>
            {
                entity.ToTable("TeacherResearchWork", "Business");

                entity.Property(e => e.City).HasMaxLength(200);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Doi)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.DownloadUrl)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.IndexedBy).HasMaxLength(512);

                entity.Property(e => e.Isbn)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Issn)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Pages)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Publisher).HasMaxLength(500);

                entity.Property(e => e.PublisherUrl)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.RefUrl)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.Type)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ViewGroup)
                    .HasMaxLength(1)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TeacherSkill>(entity =>
            {
                entity.ToTable("TeacherSkill", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Description).HasMaxLength(2000);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(2000);

                entity.Property(e => e.RefUrl)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.Type)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.ViewGroup)
                    .HasMaxLength(1)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TeacherStudy>(entity =>
            {
                entity.ToTable("TeacherStudy", "Business");

                entity.Property(e => e.City).HasMaxLength(200);

                entity.Property(e => e.Color).HasMaxLength(150);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Description).HasMaxLength(2000);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Publisher).HasMaxLength(500);

                entity.Property(e => e.RefUrl)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.Result).HasMaxLength(500);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.StudyLevel).HasMaxLength(250);

                entity.Property(e => e.TeacherRole).HasMaxLength(1000);

                entity.Property(e => e.Time).HasMaxLength(100);

                entity.Property(e => e.Title).HasMaxLength(1000);

                entity.Property(e => e.Type).HasMaxLength(100);

                entity.Property(e => e.ViewGroup)
                    .HasMaxLength(1)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Thesis>(entity =>
            {
                entity.ToTable("Thesis", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Keyword).HasMaxLength(2000);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Note).HasMaxLength(500);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.StudyCode).HasMaxLength(100);

                entity.Property(e => e.StudyField).HasMaxLength(2000);

                entity.Property(e => e.ThesisCategory).HasMaxLength(2000);

                entity.Property(e => e.ThesisLevel)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ThesisTitle).HasMaxLength(2000);

                entity.Property(e => e.ThesisType)
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ThesisDoc>(entity =>
            {
                entity.ToTable("ThesisDoc", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.DocName).HasMaxLength(500);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Note).HasMaxLength(500);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.Url).HasMaxLength(500);
            });

            modelBuilder.Entity<ThesisPublication>(entity =>
            {
                entity.ToTable("ThesisPublication", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Note).HasMaxLength(500);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<ThesisReference>(entity =>
            {
                entity.ToTable("ThesisReference", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<ThesisStudent>(entity =>
            {
                entity.ToTable("ThesisStudent", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.EndTime).HasColumnType("datetime");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Note).HasMaxLength(500);

                entity.Property(e => e.Role).HasMaxLength(500);

                entity.Property(e => e.StartTime).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<ThesisTeacher>(entity =>
            {
                entity.ToTable("ThesisTeacher", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Note).HasMaxLength(500);

                entity.Property(e => e.Role)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<ThesisWork>(entity =>
            {
                entity.ToTable("ThesisWork", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Note).HasMaxLength(500);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.WorkName).HasMaxLength(500);

                entity.Property(e => e.WorkType)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ThesisWorkAttachment>(entity =>
            {
                entity.ToTable("ThesisWorkAttachment", "Business");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.DisplayName).HasMaxLength(500);

                entity.Property(e => e.Extension).HasMaxLength(250);

                entity.Property(e => e.Note).HasMaxLength(500);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.Url)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.Version)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User", "System");

                entity.Property(e => e.Address).HasMaxLength(256);

                entity.Property(e => e.Avatar)
                    .HasMaxLength(512)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Email)
                    .HasMaxLength(128)
                    .IsUnicode(false);

                entity.Property(e => e.FirstName).HasMaxLength(64);

                entity.Property(e => e.InvalidAttempts).HasDefaultValueSql("((0))");

                entity.Property(e => e.LastName).HasMaxLength(64);

                entity.Property(e => e.LastPasswordChanged).HasColumnType("datetime");

                entity.Property(e => e.LastSignIn).HasColumnType("datetime");

                entity.Property(e => e.LockExpired).HasColumnType("datetime");

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.PasswordHash).HasColumnType("text");

                entity.Property(e => e.PasswordSalt).HasColumnType("text");

                entity.Property(e => e.Phone)
                    .HasMaxLength(64)
                    .IsUnicode(false);

                entity.Property(e => e.ReminderExpired).HasColumnType("datetime");

                entity.Property(e => e.ReminderToken)
                    .HasMaxLength(128)
                    .IsUnicode(false);

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");

                entity.Property(e => e.UserName)
                    .HasMaxLength(128)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<UserGroup>(entity =>
            {
                entity.ToTable("UserGroup", "System");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Description)
                    .HasMaxLength(512)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<UserRole>(entity =>
            {
                entity.ToTable("UserRole", "System");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Description)
                    .HasMaxLength(512)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((0))");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}