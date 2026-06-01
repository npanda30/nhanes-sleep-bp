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
