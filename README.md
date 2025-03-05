# **Google Data Analytics Professional: Bellabeat**
## **User Trend Analysis for Bellabeat**

### **Project Overview**
In this hypothetical case study, I assume the role of a junior data analyst working on the marketing analytics team at **Bellabeat**, a high-tech company specializing in health-focused products for women. My task is to analyze smart device data to uncover insights into consumer behavior and product usage.  

For this analysis, I use a **Fitbit dataset from 2016** to identify trends in user activity that could inform Bellabeat's marketing strategy, helping the company better understand its customer base and optimize its product offerings.  

This case study will outline the **data analysis process**, from exploring and cleaning the data to generating actionable insights and making recommendations based on the findings.

---

## **Business Understanding**
### **Key Stakeholders**
- **Urška Sršen** — Co-founder & Chief Creative Officer  
- **Sando Mur** — Co-founder & Mathematician  
- **Bellabeat Marketing Analytics Team** (including myself)  

### **Business Problem & Objective**
The goal of this analysis is to **identify behavioral trends** among Fitbit users. These insights will help:  
✔ Refine **Bellabeat’s marketing strategy**  
✔ Target the **right customer segments**  
✔ Optimize the **design and features** of Bellabeat's products to better meet user needs  

---

## **Data Sources**
The dataset used for this analysis was sourced from **Kaggle** (https://www.kaggle.com/datasets/arashnic/fitbit), containing Fitbit fitness tracker data.  
- **29 CSV files** covering daily, hourly, and minute-level data  
- Some files contain over **1 million rows of data**  

### **Data Credibility & Limitations**
While the dataset provides valuable insights, there are key considerations:  
✅ **Credibility**: The dataset includes actual Fitbit user data, but…  
⚠ **Small Sample Size**: Only **33 users**, barely above the **Central Limit Theorem** threshold for normality  
⚠ **Potential Bias**:  
   - Users who actively track fitness may already be **more health-conscious** than the average consumer  
   - **Self-selection bias**: Participants likely volunteered their data  
   - **Device Limitations**: Fitbit tracking accuracy can vary (e.g., not capturing short movements)  
⚠ **Outdated Data**: The dataset is from **2016**, so trends may not reflect current consumer behavior  

---

## **Modeling and Evaluation**
This analysis was conducted using **R**, following these steps:

### **1. Data Exploration & Summary**
- The **average user took 7,638 steps per day**, nearly **double** the U.S. average (3,000–4,000 steps, Mayo Clinic).  
- Outlier detection revealed **~100 instances** where users recorded **0 steps**.  

### **2. Correlation Analysis**
- A **moderate positive correlation (0.59)** was found between **total steps and calories burned**.  
- This aligns with expectations: **higher activity levels generally lead to greater calorie expenditure**.  
- (*Further statistical testing could confirm significance.*)  

### **3. Outlier Detection & Impact**
- The **histogram of total steps** shows a **right-skewed distribution** with **zero-step days**.  
- Possible reasons:  
  - Users **did not wear their Fitbit** on some days.  
  - Device **syncing issues** led to missing data.  
  - Users had **sedentary days**, which may not accurately represent their overall activity trends.  

---

## **Key Insights & Market Implications**
### **1. Steps vs. Caloric Burn**
✅ Users who walk more **burn more calories**, reinforcing the importance of active lifestyles.  
✅ Bellabeat can highlight **fitness benefits** in marketing campaigns.  

### **2. Activity Distribution & Outliers**
✅ Some users **recorded 0 steps**, which might skew overall trends.  
✅ Bellabeat could investigate whether users are using wearables **for non-fitness purposes** (e.g., sleep tracking).  

### **3. Market Insights for Bellabeat**
✔ Since Fitbit users in this dataset **walk significantly more** than the U.S. average, Bellabeat’s **target audience** might be:  
   - **Active individuals** looking to enhance their wellness habits  
   - Consumers already **engaged in fitness** rather than beginners  
✔ Marketing should focus on **enhancing** existing health habits rather than simply encouraging more movement.  

---

## **Recommendations**
1️⃣ **Expand Target Market**: Position **Leaf** and **Time** as **holistic wellness devices** for **overall health tracking**, not just fitness.  
2️⃣ **Enhance Product Messaging**: Highlight the connection between **activity, sleep, and stress management** to appeal to wellness-focused consumers.  
3️⃣ **Investigate User Behavior**: Analyze **zero-step users** to determine whether they use the device for **non-fitness reasons** (e.g., sleep tracking).  

---

## **Tools & Technologies Used**
- **R** for data analysis  
- **Tidyverse (ggplot2, dplyr)** for data wrangling & visualization  
- **Kaggle** for dataset sourcing  
- **Markdown** for project documentation  

---

## **Conclusion**
This case study provided **data-driven insights** into **Fitbit user behavior**, offering key takeaways for Bellabeat’s marketing strategy. While the dataset has limitations, the analysis suggests Bellabeat can:  
✅ **Expand its target audience** to wellness-focused consumers  
✅ **Improve messaging** to emphasize holistic health tracking  
✅ **Investigate user behavior trends** for future product development  

---

## **Next Steps**
🔍 Conduct further analysis on **hourly & minute-level data** to refine insights.  
📊 Test additional **statistical significance** of findings (e.g., p-values for correlation).  
📢 Develop **personalized marketing campaigns** based on data-driven segmentation.  
