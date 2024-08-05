# Econometrics - ECON 255

### These are some data analysis reports I conducted for my econometrics course at Williams College during Fall 2023.

# Airbnb Host Analysis

This project analyzes various factors influencing the ratings of Airbnb listings in Boston. The primary focus is to understand the relationship between the rating of a listing and various predictor variables such as neighborhood, number of reviews, reviews per month, and gender of the host.

## Project Overview

- **Objective**: To study the impact of various factors on Airbnb listing ratings and identify key predictors of high ratings.
- **Data Source**: The data is sourced from Inside Airbnb, specifically the Boston dataset, which includes verified and cleaned public data published by Airbnb.

## Data Description

The dataset contains the following key variables:
- **rating**: The rating of the Airbnb listing.
- **neighbourhood**: The neighborhood where the listing is located.
- **number_of_reviews**: The total number of reviews the listing has received.
- **reviews_per_month**: The number of reviews the listing receives per month.
- **gender_of_host**: The predicted gender of the host based on their name.

## Methodology

1. **Data Preprocessing**:
   - Converted the rating from a string to a numerical format.
   - Encoded the neighborhood as a categorical variable.
   - Predicted the gender of the host using the Python package `gender-guesser`.

2. **Analysis**:
   - Explored the relationship between rating and other variables using OLS regression models.
   - Investigated the impact of neighborhood, number of reviews, reviews per month, and gender on the ratings.

3. **Key Findings**:
   - The neighborhood significantly affects the ratings, with some neighborhoods like Charlestown and Roslindale having higher expected ratings compared to others like South Boston.
   - There is a positive correlation between the number of reviews per month and the rating.
   - Listings with female-sounding host names tend to have higher ratings than those with male or ambiguous names.
