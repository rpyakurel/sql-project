SELECT COUNT (*) 
FROM `rothys-assessment.CX.agent_performance` 
WHERE Status = 'ANSWERED'
LIMIT 3;


SELECT Agent_ID, 
  COUNT(*) AS Total,
  COUNT(CASE WHEN Status = 'ANSWERED' THEN 1 END) AS Total_Answered,
  COUNT(CASE WHEN Status = 'UNANSWERED' THEN 1 END) AS Total_Unanswered,
    ROUND((COUNT(CASE WHEN Status = 'ANSWERED' THEN 1 END) / COUNT(*)) * 100,2) AS Percent_answered,
    ROUND((COUNT(CASE WHEN Status = 'UNANSWERED' THEN 1 END) / COUNT(*))* 100,2) AS Percent_unanswered,
FROM `rothys-assessment.CX.agent_performance`
WHERE Direction = 'INCOMING'
GROUP BY Agent_ID
ORDER BY Total_Unanswered DESC
LIMIT 3;