SELECT 
    machine_id,
    ROUND(AVG(processing), 3) AS processing_time
FROM (
    SELECT 
        a1.machine_id,
        EXTRACT(EPOCH FROM (a2.timestamp - a1.timestamp)) AS processing
    FROM Activity a1
    JOIN Activity a2
        ON a1.machine_id = a2.machine_id
       AND a1.process_id = a2.process_id
       AND a1.activity_type = 'start'
       AND a2.activity_type = 'end'
) AS sub
GROUP BY machine_id;
