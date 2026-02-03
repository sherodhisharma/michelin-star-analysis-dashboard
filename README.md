## 1. Title
### Michelin-Starred Restaurants: Interactive Data Visualization Dashboard
## 2. Executive Summary

This project presents an interactive data visualization dashboard built using R Shiny to explore global Michelin-starred restaurants. The dashboard allows users to analyze trends across countries, cities, and Michelin star ratings, helping uncover patterns in fine-dining distribution and recognition.

The goal of this project is to demonstrate how data visualization and exploratory analysis can be used to generate meaningful insights for business, tourism, and hospitality decision-making.

Live App: https://sherodhi.shinyapps.io/Assignment3/

## 3. Business Problem

Michelin stars significantly influence restaurant reputation, customer demand, and tourism flows. However, stakeholders such as:

- hospitality consultants
- tourism boards
- restaurant groups
- investors
  
often lack an easy way to visually explore where Michelin recognition is concentrated and how it differs by region.

**Key business questions addressed:**

- Which countries and cities dominate Michelin star distribution?
- How are Michelin stars (1, 2, 3) distributed globally?
- Are Michelin-starred restaurants concentrated in specific geographic regions?

## 4. Methodology

1. Data Understanding & Preparation
2. Loaded and inspected Michelin-star restaurant dataset
3. Cleaned categorical and geographic variables
4. Prepared data for aggregation and visualization
5. Exploratory Data Analysis (EDA)
6. Grouped data by country, city, and star rating
7. Identified high-density Michelin regions
8. Compared distributions across star levels
9. Visualization & Dashboard Development
10. Built three interactive visualizations using R Shiny
11. Enabled user interaction to explore insights dynamically
12. Deployed the application using shinyapps.io

## 5. Skills & Tools Used

- Programming: R
- Data Visualization: ggplot2, Shiny
- Data Manipulation: dplyr, tidyverse
- Dashboard Development: R Shiny
- Data Analysis: Exploratory Data Analysis (EDA)
- Deployment: shinyapps.io
- Communication: Translating data insights into business context

## 6. Results & Business Recommendations
**Key Findings**

- Michelin-starred restaurants are heavily concentrated in a small number of countries and major cities.
- 1-star restaurants dominate the dataset, while 3-star restaurants are relatively rare and geographically clustered.
- Certain regions show strong fine-dining ecosystems, suggesting established culinary prestige and demand.

**Business Recommendations**

- Tourism boards can leverage Michelin-dense regions for premium food tourism campaigns.
- Restaurant groups can identify under-represented regions with growth potential.
- Hospitality investors may use geographic concentration insights to assess market maturity and opportunity.
- Aspiring chefs/restaurants can analyze competitive density before choosing locations.

## 7. Next Steps

To further strengthen this project:

- Integrate time-based data to analyze Michelin trends over multiple years.
- Add pricing or cuisine-type data to deepen business insights.
- Include user-driven filters for cuisine, country, or star level.
- Expand analysis with predictive modeling (e.g., factors influencing star levels).
- Compare Michelin data with tourism or economic indicators for richer analysis.
