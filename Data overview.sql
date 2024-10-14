SELECT COUNT(DISTINCT(Agent_ID))
 FROM `rothys-assessment.CX.agent_performance`;

 SELECT COUNT(Status), Status
  FROM `rothys-assessment.CX.agent_performance`
 GROUP BY Status; 

 SELECT COUNT(Channel),Channel
  FROM `rothys-assessment.CX.agent_performance`
 GROUP BY Channel; 

  SELECT COUNT(Direction),Direction
  FROM `rothys-assessment.CX.agent_performance`
 GROUP BY Direction; 

   SELECT COUNT(Channel),Channel
  FROM `rothys-assessment.CX.agent_performance`
 GROUP BY Channel; 