-- Uma das primeiras consulta é:
-- Achamos que os funcionários estão pedindo demissão porque ganham mal e estão insatisfeitos com o trabalho.
-- Preciso puxar então os dados de Attrition, MonthlyIncome, JobSatisfaction, "EnvironmentSatisfaction", "RelationshipSatisfaction", "WorkLifeBalance"
SELECT "workInfo"."EmployeeNumber", "workInfo"."Department", "workInfo"."Attrition", "workInfo"."MonthlyIncome", "workPerception"."JobSatisfaction", "workPerception"."EnvironmentSatisfaction", "workPerception"."RelationshipSatisfaction" 
FROM "workInfo"
INNER JOIN "workPerception" ON "workInfo"."EmployeeNumber" = "workPerception"."EmployeeNumber"

WHERE "workInfo"."Attrition" = 'Yes';