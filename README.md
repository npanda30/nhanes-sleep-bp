# NHANES 2021-2023: Sleep Duration and Blood Pressure

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
- Linear regression predicting systolic BP from sleep hours, controlling for age, sex, and BMI (in progress)

## Key Findings
- Sleep hours are approximately normally distributed, peaking at 7-8 hours
- Systolic BP increases markedly with age, especially after 45
- The sleep-BP relationship appears to vary by age group (in progress)

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

## Methods
- Linear regression (OLS) with HC3 robust standard errors
- Binary logistic regression with odds ratio interpretation
- Six interaction models tested with mean-centered variables to reduce multicollinearity
- All analysis conducted in Python using statsmodels

## SQL Layer
- SQL analysis conducted in DuckDB, replicating key EDA queries and interaction findings — see `sql/` folder

## Limitations
- Cross-sectional design: cannot establish causality or direction of effect
- Sleep is self-reported, which introduces measurement error
- Survey weights not applied (appropriate for portfolio use; noted as simplification)

## Repository Structure
- `Notebooks/01_load_and_merge.ipynb` — data loading, merging, and cleaning
- `Notebooks/02_exploratory_analysis.ipynb` — exploratory plots and visualizations
- `Data/nhanes_clean.csv` — cleaned dataset (5,999 adult participants)

## How to Run
1. Clone this repository
2. Install dependencies: `pip install pandas numpy matplotlib seaborn statsmodels scikit-learn`
3. Run notebooks in order starting with `01_load_and_merge.ipynb`
