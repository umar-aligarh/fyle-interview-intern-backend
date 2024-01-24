SELECT
  COUNT(teacher_id) AS "cnt"
FROM assignments
WHERE state='GRADED' AND grade='A'
GROUP BY teacher_id
HAVING
  COUNT(teacher_id) = (
    SELECT COUNT(teacher_id) AS "cnt"
    FROM assignments
    WHERE state='GRADED' AND grade='A'
    GROUP BY teacher_id
    ORDER BY "cnt" DESC
    LIMIT 1
  )
ORDER BY teacher_id ASC
