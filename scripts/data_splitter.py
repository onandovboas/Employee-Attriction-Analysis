import pandas as pd
import os

def process_data(entry_path, output_path):
    # Read the CSV file
    df = pd.read_csv(entry_path)

    
    workInfoCol = [
        'EmployeeNumber', 
        'Attrition', 
        'BusinessTravel', 
        'DailyRate', 
        'Department', 
        'DistanceFromHome', 
        'HourlyRate', 
        'JobLevel', 
        'JobRole', 
        'MonthlyIncome', 
        'MonthlyRate', 
        'PercentSalaryHike',
        'PerformanceRating',
        'StandardHours',
        'TotalWorkingYears',
        'TrainingTimesLastYear',
        'YearsAtCompany',
        'YearsInCurrentRole',
        'YearsSinceLastPromotion',
        'YearsWithCurrManager'
        ]

    workPerceptionCol = [
        'EmployeeNumber',
        'EnvironmentSatisfaction',
        'JobInvolvement',
        'JobSatisfaction',
        'RelationshipSatisfaction',
        'WorkLifeBalance'
        ]

    demograficCol = [
        'EmployeeNumber',
        'Age',
        'Education',
        'EducationField',
        'Gender',
        'MaritalStatus',
        'NumCompaniesWorked'
        ]
    
    demografic_df = df.loc[:, demograficCol]
    workInfo_df = df.loc[:, workInfoCol]
    workPerception_df = df.loc[:, workPerceptionCol]

    createTable = {
    'demografic_df': demografic_df,
    'workInfo_df': workInfo_df,
    'workPerception_df': workPerception_df
    }

    for name, table in createTable.items():
        final_path = os.path.join(output_path, f"{name}.csv")
        table.to_csv(final_path, index=False)

process_data(
    r"data\raw\ibm-hr.csv",
    r"data\processed"
    )