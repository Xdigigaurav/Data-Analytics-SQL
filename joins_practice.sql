SELECT 
    sub.student_id,
    sub.student_name,
    sub.subject_name,
    COUNT(ex.student_id) AS attended_exams
FROM (
    SELECT *
    FROM Students
    CROSS JOIN Subjects
) AS sub
LEFT JOIN Examinations ex
    ON sub.student_id = ex.student_id
   AND sub.subject_name = ex.subject_name
GROUP BY 
    sub.student_id,
    sub.student_name,
    sub.subject_name
ORDER BY 
    sub.student_id,
    sub.subject_name;
