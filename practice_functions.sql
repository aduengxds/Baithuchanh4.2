
USE QuanLySinhVien;

-- 1. Hiển thị môn học có credit lớn nhất
SELECT *
FROM Subject
WHERE Credit = (
    SELECT MAX(Credit)
    FROM Subject
);

-- 2. Hiển thị môn học có điểm thi lớn nhất
SELECT DISTINCT S.*
FROM Subject S
JOIN Mark M ON S.SubjectId = M.SubjectId
WHERE M.Mark = (
    SELECT MAX(Mark)
    FROM Mark
);

-- 3. Hiển thị thông tin sinh viên và điểm trung bình,
-- sắp xếp theo điểm trung bình giảm dần
SELECT
    S.StudentId,
    S.StudentName,
    AVG(M.Mark) AS AverageMark
FROM Student S
JOIN Mark M ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
ORDER BY AverageMark DESC;
