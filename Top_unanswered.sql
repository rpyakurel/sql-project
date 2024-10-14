WITH Agent_Unanswered AS (
  SELECT Agent_ID, 
    COUNT(*) AS Total,
    COUNT(CASE WHEN Status = 'ANSWERED' THEN 1 END) AS Total_Answered,
    COUNT(CASE WHEN Status = 'UNANSWERED' THEN 1 END) AS Total_Unanswered,
    ROUND((COUNT(CASE WHEN Status = 'ANSWERED' THEN 1 END) / COUNT(*)) * 100, 2) AS Percent_answered,
    ROUND((COUNT(CASE WHEN Status = 'UNANSWERED' THEN 1 END) / COUNT(*)) * 100, 2) AS Percent_unanswered
  FROM `rothys-assessment.CX.agent_performance`
  WHERE Direction = 'INCOMING'
  GROUP BY Agent_ID
)
SELECT *
FROM (
  SELECT *,
    NTILE(4) OVER (ORDER BY Percent_unanswered DESC) AS Quartile -- Dividing data into quartiles
  FROM Agent_Unanswered
) AS RankedAgents
WHERE Quartile = 1  -- Select the top 25% quartile
ORDER BY Percent_unanswered DESC;

