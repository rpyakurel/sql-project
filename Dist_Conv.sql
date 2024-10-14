SELECT Agent_ID,
COUNT(DISTINCT(Conversation_ID)) AS Conv_ID
FROM `rothys-assessment.CX.agent_performance`
GROUP BY Agent_ID
ORDER BY Conv_ID DESC
LIMIT 3;