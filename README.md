# BankCampaign-Optimization

This project aims to optimize direct marketing campaigns in the banking sector using data mining techniques. It evaluates and improves the marketing effectiveness for a fictional bank, "Bank Uhuy," by leveraging classification models to predict customer responses. This project follows the CRISP-DM methodology to structure the data mining process.

## Table of Contents

- [Project Overview](#project-overview)
- [Dataset](#dataset)
- [Technologies and Libraries](#technologies-and-libraries)
- [Methodology (CRISP-DM)](#methodology-crisp-dm)
- [Data Preparation](#data-preparation)
- [Modeling](#modeling)
- [Evaluation Metrics](#evaluation-metrics)
- [Results and Insights](#results-and-insights)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

Bank Uhuy uses direct marketing as a core strategy to expand its customer base by promoting financial products, including fixed-term deposits. This project evaluates past marketing campaign data to gain insights and improve future campaigns. Key objectives include understanding customer behavior and identifying factors that significantly influence campaign success.

## Dataset

- **Source**: [Kaggle Bank Marketing Dataset](https://www.kaggle.com/datasets/janiobachmann/bank-marketing-dataset)
- **Features**:
  - **Customer Information**: Age, job, marital status, education, balance
  - **Campaign Data**: Contact method, last contact day/month, duration, previous outcome
  - **Financial Information**: Housing and personal loan status
  - **Response Variable**: Subscription to term deposits (binary response)

This dataset contains 11,162 rows and 17 columns, representing various aspects of customer demographics, account details, and previous campaign interactions.

## Technologies and Libraries

- **Python**: Core language for data manipulation and modeling
- **Jupyter Notebook**: Environment for development and analysis
- **SAS Visual Analytics**: For Exploratory Data Analysis (EDA) and model deployment
- **Libraries**:
  - **Pandas** and **NumPy**: Data manipulation
  - **Matplotlib** and **Seaborn**: Data visualization
  - **scikit-learn**: Model building and evaluation

## Methodology (CRISP-DM)

This project follows the CRISP-DM methodology:
1. **Business Understanding**: Understanding the key business goals and challenges of Bank Uhuy’s marketing strategy.
2. **Data Understanding**: Conducting EDA to uncover patterns and relationships within the data.
3. **Data Preparation**: Cleaning, handling missing values, and feature selection.
4. **Modeling**: Building multiple classification models (Decision Tree, Random Forest, Neural Network, SVM).
5. **Evaluation**: Assessing model performance based on Misclassification Rate and F1-Score.
6. **Deployment**: Implementing the best model for predictive use in the operational environment.

## Data Preparation

1. **Missing Values Check**: Ensured data completeness to prevent bias in analysis.
2. **Outlier Handling**: Applied Interquartile Range (IQR) method to manage outliers in features like age, balance, and duration.
3. **Feature Selection**: Selected only the most relevant features to reduce model complexity and improve performance.

## Modeling

Four primary models were developed:
1. **Decision Tree**: Easy to interpret but prone to overfitting.
2. **Random Forest**: Ensemble method with multiple decision trees to improve accuracy and generalization.
3. **Neural Network**: Captures complex relationships but requires more data.
4. **Support Vector Machine (SVM)**: Effective for high-dimensional data, with a focus on maximizing the margin between classes.

Each model was trained and validated using a 70-15-15 train-validation-test split.

## Evaluation Metrics

1. **Misclassification Rate**: Measures the proportion of incorrect predictions.
2. **F1-Score**: Combines precision and recall to evaluate model balance.
3. **Confusion Matrix**: Analyzes prediction errors to gain deeper insight.

## Results and Insights

- **Best Model**: The Neural Network model achieved the lowest Misclassification Rate and the highest F1-Score, demonstrating superior performance in predicting customer responses.
- **Campaign Optimization**: Insights derived from the model outputs suggest effective targeting strategies based on age, balance, and contact methods.
- **Deployment**: The Neural Network model was deployed in Bank Uhuy’s environment for real-time prediction, supporting informed marketing strategies and improved customer conversion.

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

1. Load the dataset and execute the data preparation steps.
2. Train and evaluate the models by running `model_training.py`.
3. Deploy the best-performing model using the provided deployment script (`deploy_model.py`).

## Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -m 'Add YourFeature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE.md](LICENSE.md) file for more details.
