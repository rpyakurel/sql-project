SELECT Agent_ID,
  ROUND(AVG(Handle_Time_in_sec), 2) AS Handle_Time,
  ROUND(AVG(After_Contact_Time_in_sec), 2) AS After_Time,
  ROUND(AVG(Total_Handle_Time_in_sec), 2) AS Total_Time
FROM `rothys-assessment.CX.agent_performance`
GROUP BY Agent_ID
ORDER BY Total_Time ASC
LIMIT 3;
