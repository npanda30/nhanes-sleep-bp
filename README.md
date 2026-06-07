# NHANES 2021-2023: Sleep Duration and Blood Pressure

## Overview
A population-level analysis of NHANES 2021-2023 data (n=5,999) examining whether 
sleep duration predicts blood pressure outcomes in U.S. adults. Analysis includes 
exploratory data analysis, linear and logistic regression, and six interaction models. 
Conducted in Python (statsmodels) with a SQL layer in DuckDB.

## Research Question
Is self-reported sleep duration associated with blood pressure outcomes in U.S. adults, and does this relationship vary by age, sex, or BMI?

## Dataset
National Health and Nutrition Examination Survey (NHANES) 2021-2023, collected by the CDC. Data downloaded from [cdc.gov](https://www.cdc.gov/nchs/nhanes).

Six components used: Demographics, Blood Pressure Exam, Blood Pressure Questionnaire, Sleep Disorders, Body Measures, and Physical Activity.

## Methods
- Merged six NHANES XPT files on participant ID (SEQN)
- Selected and renamed key variables for readability
- Replaced NHANES refusal codes (7, 9) with NaN
- Dropped participants with missing values; filtered to adults 18+
- Final sample: 5,999 participants
- Exploratory data analysis with distributions, scatterplots, and grouped boxplots
- Linear regression (OLS) with HC3 robust standard errors
- Binary logistic regression with odds ratio interpretation
- Six interaction models tested with mean-centered variables to reduce multicollinearity
- All analysis conducted in Python using statsmodels

## Key Findings
- Sleep hours are approximately normally distributed, peaking at 7-8 hours (20.47% of sample)
- Systolic BP increases markedly with age — average BP rises from 112 mmHg (18-30) to 130 mmHg (61-80)
- Hypertension rates increase sharply with age — from 5.95% (18-30) to 55.84% (61-80), with the steepest jump between ages 31-45 and 46-60
- Sleep duration shows no significant association with systolic BP or hypertension diagnosis after controlling for age, sex, and BMI
- The sleep-BP relationship is sex-dependent — more sleep is weakly protective for males but not females (sleep × sex interaction, p=0.025)
- The female cardiovascular advantage diminishes significantly with age, consistent with loss of estrogen protection post-menopause (age × sex, p<0.001)
- BMI's effect on BP weakens in older adults (age × bmi, p=0.001)
- Males have higher average systolic BP (125.14 vs 120.36 mmHg) and higher hypertension rates (37.59% vs 35.31%) than females
- Average sleep hours are virtually identical between hypertensive and non-hypertensive participants (7.71 vs 7.72 hours)

### Linear Regression (Outcome: Systolic BP)
Sleep duration was not a significant predictor of systolic BP after controlling for age, sex, and BMI (β=0.10, p=0.499). Age was the strongest predictor (β=0.40 per year, p<0.001). Females had significantly lower systolic BP than males (β=-4.82 mmHg, p<0.001). Model assumptions of homoscedasticity and normality were violated; results refit with HC3 robust standard errors with no change in conclusions.

### Logistic Regression (Outcome: Hypertension Diagnosis)
Sleep duration did not significantly predict hypertension diagnosis (OR=0.990, p=0.597). Each additional year of age increased odds of hypertension by 6.4% (OR=1.064, p<0.001). Females had 17.3% lower odds of hypertension than males (OR=0.827, p=0.002). Each BMI unit increase raised odds by 8.3% (OR=1.083, p<0.001).

### Interaction Models
Six interaction terms were tested. Notable findings:
- **sleep × sex** (p=0.025): The sleep-BP relationship differs by sex — more sleep is weakly protective for males but not females
- **age × sex** (p<0.001): The female cardiovascular advantage diminishes with age, consistent with loss of estrogen protection post-menopause. This was the strongest secondary finding (ΔR²=+0.016)
- **age × bmi** (p=0.001): BMI's effect on BP weakens in older adults
- sleep × age, sleep × bmi, and bmi × sex were not significant

## SQL Layer
Key exploratory queries replicated in SQL using DuckDB, demonstrating proficiency 
in both Python and SQL for health data analysis. Queries cover sleep distribution, 
BP by age group, hypertension rates, sex comparisons, and the sleep × sex interaction.
See the `sql/` folder for all 6 annotated queries.

## Clinical Implications
While sleep duration alone did not predict BP, the significant sleep × sex interaction 
suggests sex-stratified approaches to sleep recommendations in cardiovascular care may 
be warranted. The rapid increase in hypertension rates after age 45 — particularly 
in females — supports early monitoring and intervention before midlife.

## Future Directions
- Apply NHANES survey weights for population-level inference
- Incorporate objective sleep measures (actigraphy) rather than self-report
- Extend analysis to diastolic BP and additional cardiovascular outcomes
- Examine race/ethnicity as an additional moderator

## Limitations
- Cross-sectional design: cannot establish causality or direction of effect
- Sleep is self-reported, which introduces measurement error
- Survey weights not applied (appropriate for portfolio use; noted as simplification)

## Repository Structure
- `Notebooks/01_load_and_merge.ipynb` — data loading, merging, and cleaning
- `Notebooks/02_exploratory_analysis.ipynb` — exploratory plots and visualizations
- `Notebooks/03_modeling.ipynb` — linear regression, logistic regression, interaction models
- `Notebooks/04_sql_duckdb.ipynb` — SQL analysis with DuckDB
- `Data/nhanes_clean.csv` — cleaned dataset (5,999 adult participants)
- `sql/` — 6 annotated SQL queries replicating key findings

1. Clone this repository
2. Install dependencies: `pip install pandas numpy matplotlib seaborn statsmodels scikit-learn duckdb`
3. Run notebooks in order starting with `01_load_and_merge.ipynb`
