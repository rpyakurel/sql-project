WITH Agent_Answered_Calls AS(
    SELECT
      Agent_ID,
      COUNT(*) AS Total_Assigned,
      COUNT(CASE WHEN Status = 'ANSWERED'THEN 1 END) AS Total_Answered,
      COUNT(CASE WHEN Status = 'UNANSWERED' THEN 1 END) AS Total_Unanswered,
      ROUND((COUNT(CASE WHEN Status = 'ANSWERED' THEN 1 END) / COUNT (*)) * 100/2 ) AS Percent_Answered,
      ROUND((COUNT(CASE WHEN Status = 'UNANSWERED' THEN 1 END) / COUNT (*)) * 100/2 ) AS Percent_Unanswered
    FROM `rothys-assessment.CX.agent_performance`
    WHERE Direction ='INCOMING'
    GROUP BY Agent_ID
  ),

Agent_Handle_Time AS (
      SELECT
        Agent_ID,
        ROUND(AVG(Handle_Time_in_sec),2) AS Avg_Handle_Time,
        ROUND(AVG(After_Contact_Time_in_sec), 2) AS Avg_After_Time,
        ROUND(AVG(Total_Handle_Time_in_sec), 2) AS Avg_Total_Time
      FROM `rothys-assessment.CX.agent_performance`
      GROUP BY Agent_ID      
  ),

Agent_Conversation_Count AS(
      SELECT
        Agent_ID,
        COUNT(DISTINCT Conversation_ID) AS Distinct_Conversations
      FROM `rothys-assessment.CX.agent_performance`
      GROUP BY Agent_ID
)

SELECT
  ac.Agent_ID,
  ac.Total_Assigned,
  ac.Total_Answered,
  ac.Total_Unanswered,
  ht.Avg_Handle_Time,
  ht.Avg_After_Time,
  ht.Avg_Total_Time,
  cc.Distinct_Conversations
FROM Agent_Answered_Calls ac
JOIN Agent_Handle_Time ht ON ac.Agent_ID = ht.Agent_ID
JOIN Agent_Conversation_Count cc ON ac.Agent_ID = cc.Agent_ID
ORDER BY ht.Avg_Total_Time ASC,ht.Avg_Handle_Time ASC,ht.Avg_After_Time ASC, cc.Distinct_Conversations DESC, ac.Percent_Answered DESC
LIMIT 3; 






