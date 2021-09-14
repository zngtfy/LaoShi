SELECT Id, ReminderToken, LastSignIn, InvalidAttempts, LockExpired, LastPasswordChanged FROM System.[User] WHERE UserName = 'admin';
SELECT * FROM System.PasswordHistory ORDER BY CreatedOn DESC;
SELECT * FROM System.LoginHistory WHERE UserName = 'admin' ORDER BY LastAccessedOn DESC;

UPDATE System.[User] SET LastPasswordChanged = NULL WHERE UserName = 'admin';
UPDATE System.[User] SET LastPasswordChanged = GETDATE() WHERE UserName = 'admin';

DELETE FROM System.PasswordHistory;
DELETE FROM System.LoginHistory;