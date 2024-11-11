# BankCampaign-Optimization

This project optimizes direct marketing campaigns in the banking sector, specifically for "Bank Uhuy." Using CRISP-DM methodology and multiple machine learning models, we analyze customer data to enhance marketing effectiveness. Our focus includes identifying key factors that impact customer conversion and optimizing the marketing approach for improved engagement and retention.

## Table of Contents

- [Project Overview](#project-overview)
- [Dataset](#dataset)
- [Technologies and Libraries](#technologies-and-libraries)
- [Methodology](#methodology)
- [Data Preparation](#data-preparation)
- [Modeling](#modeling)
- [Evaluation Metrics](#evaluation-metrics)
- [Results and Findings](#results-and-findings)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

The purpose of this project is to evaluate and improve the direct marketing campaigns of Bank Uhuy by analyzing customer response data. We leverage CRISP-DM, a systematic approach for data mining, and apply various classification models to predict customer responses. This helps Bank Uhuy enhance customer engagement and improve conversion rates.

## Dataset

- **Source**: [Kaggle Bank Marketing Dataset](https://www.kaggle.com/datasets/janiobachmann/bank-marketing-dataset)
- **Details**: The dataset includes 17 columns and 11,162 rows, with features such as:
  - **Age**: Customer's age
  - **Balance**: Account balance
  - **Campaign**: Number of contacts during the campaign
  - **Contact Method**: Communication type (cellular, telephone)
  - **Education**: Customer’s education level
  - **Housing Loan**: Whether they have a home loan
  - **Previous Outcome**: Outcome of the previous marketing campaign
  - **Others**: Include job type, marital status, day/month of last contact, and response variables like `Deposit`

## Technologies and Libraries

- **Python** for data processing and model building
- **SAS Visual Analytics** for exploratory data analysis and model visualization
- **Libraries**:
  - **Pandas** and **NumPy** for data manipulation
  - **scikit-learn** for machine learning models and evaluation
  - **Matplotlib** and **Seaborn** for data visualization

## Methodology

This project uses the **CRISP-DM** (Cross-Industry Standard Process for Data Mining) methodology, which includes:
1. **Business Understanding**: Define campaign objectives and customer segments.
2. **Data Understanding**: Explore customer demographics, previous interactions, and preferences.
3. **Data Preparation**: Handle missing values, outliers, and feature selection.
4. **Modeling**: Apply Decision Tree, Random Forest, Neural Network, and SVM models.
5. **Evaluation**: Assess models using metrics like F1-Score and Misclassification Rate.
6. **Deployment**: Integrate the final model for operational use at Bank Uhuy.

## Data Preparation

1. **Missing Values**: Verified that there were no missing values in the dataset.
2. **Outlier Handling**: Outliers were managed using the Interquartile Range (IQR) method.
3. **Feature Selection**: Unnecessary columns were removed to improve model accuracy.

## Modeling

Four models were used for classification:
1. **Decision Tree**
2. **Random Forest**
3. **Neural Network**
4. **Support Vector Machine (SVM)**

Each model’s performance was evaluated, and results were compared to identify the most effective model.

## Evaluation Metrics

- **Misclassification Rate**: Percentage of incorrect predictions.
- **F1-Score**: Harmonic mean of precision and recall.
- **Confusion Matrix**: Used to derive TP, TN, FP, and FN values, essential for evaluating classification performance.

## Results and Findings

The **Neural Network model** outperformed others, achieving the lowest Misclassification Rate and the highest F1-Score, making it the optimal model for classifying customer responses in direct marketing. This model is now deployed to automate and improve marketing strategies at Bank Uhuy.

## Installation

1. Clone this repository:
    ```bash
    git clone https://github.com/FebianFelix/BankCampaign-Optimization.git
    ```
2. Navigate into the directory:
    ```bash
    cd BankCampaign-Optimization
    ```
3. Install dependencies:
    ```bash
    pip install -r requirements.txt
    ```

## Usage

Run the analysis and model training scripts to process the data, train models, and evaluate results. Use `main.py` to generate predictions or connect the application with Bank Uhuy’s marketing data for real-time predictions.

## Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/NewFeature`).
3. Commit your changes (`git commit -m 'Add NewFeature'`).
4. Push to the branch (`git push origin feature/NewFeature`).
5. Open a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
