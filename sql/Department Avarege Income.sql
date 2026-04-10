WITH "MeanIncome" AS (
SELECT "workInfo"."EmployeeNumber", "workInfo"."Attrition", "Department", "MonthlyIncome", 
  AVG("MonthlyIncome") OVER(
    PARTITION BY "Department"
  ) AS avgIncome,
  "workPerception"."JobSatisfaction",
  "workPerception"."EnvironmentSatisfaction",
  "workPerception"."RelationshipSatisfaction",
  "workPerception"."WorkLifeBalance"
 FROM "workInfo"
INNER JOIN "workPerception" ON "workPerception"."EmployeeNumber" = "workInfo"."EmployeeNumber" )

SELECT * FROM "MeanIncome"
WHERE "MonthlyIncome" > avgincome AND "Attrition" = 'Yes'