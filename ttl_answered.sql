SELECT COUNT (*) 
FROM `rothys-assessment.CX.agent_performance` 
WHERE Status = 'ANSWERED';


SELECT Agent_ID, 
  COUNT(*) AS Total,
  COUNT(CASE WHEN Status = 'ANSWERED' THEN 1 END) AS Total_Answered,
  COUNT(CASE WHEN Status = 'UNANSWERED' THEN 1 END) AS Total_Unanswered,
  COUNT(CASE WHEN Status NOT IN ('ANSWERED', 'UNANSWERED') THEN 1 END) AS Unknown,
    ROUND((COUNT(CASE WHEN Status = 'ANSWERED' THEN 1 END) / COUNT(*)) * 100,2) AS Percent_answered,
    ROUND((COUNT(CASE WHEN Status = 'UNANSWERED' THEN 1 END) / COUNT(*))* 100,2) AS Percent_unanswered,
    ROUND((COUNT(CASE WHEN Status NOT IN ('ANSWERED','UNASWERED') THEN 1 END))/ COUNT (*) * 100,2 ) AS Percent_unkown
FROM `rothys-assessment.CX.agent_performance`
GROUP BY Agent_ID
ORDER BY Total_Answered DESC;