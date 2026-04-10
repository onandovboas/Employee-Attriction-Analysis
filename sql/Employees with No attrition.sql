SELECT "workInfo"."Attrition", 
  COUNT("workInfo"."EmployeeNumber") AS N,
  AVG("workInfo"."MonthlyIncome")::NUMERIC(10,2) AS AvgIncome,
  STDDEV("workInfo"."MonthlyIncome")::NUMERIC(10,2) AS StddevIncome,
  AVG("workPerception"."JobSatisfaction")::NUMERIC(10,2) AS AvgJobSatisfaction,
  STDDEV("workPerception"."JobSatisfaction")::NUMERIC(10,2) AS StddevJobSatisfaction,
  AVG("workPerception"."EnvironmentSatisfaction")::NUMERIC(10,2) AS AvgEnvSatisfaction,
  AVG("workPerception"."RelationshipSatisfaction")::NUMERIC(10,2) AS AvgRelSatisfaction
FROM "workInfo"
INNER JOIN "workPerception" ON "workInfo"."EmployeeNumber" = "workPerception"."EmployeeNumber"
GROUP BY "workInfo"."Attrition"