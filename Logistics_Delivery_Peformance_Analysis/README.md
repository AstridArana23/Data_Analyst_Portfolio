## Overview 
This project analyzes logistics delivery performance data to identify key factors affecting delivery speed, efficiency, and customer satisfaction. 

By combining Python and ML, the goal is to uncover operational bottlenecks and provide data-driven recommendations to improve delivery reliability and reduce delays.  

## Business Problem
Logistics companies often face challenges such as late deliveries, inconsistent carrier performance, and regional inefficiencies. This project hopes to answer: 
- What factors contribute the most to delivery delays?
- Which regions, carriers, or warehouses perform best or worst?
- How do delivery delays impact customer satisfaction and package quality?
- Can we predict whether a delivery will be late? 

## Dataset 
The dataset contains logistics shipment records with features such as: 
- Order ID: Unique identifier for each order
- Agent Age: Age of the delivery agent
- Agent_Rating: Rating or performance score of the delivery agent
- Store_ Latitude: Geographic coordinates of the store where the order was placed
- Store_Longitude: Geographic coordinates of the store where the order was placed
- Drop_Latitude: Geographic coordinates of the delivery location
- Drop_Longitude: Geographic coordinates of the delivery location
- Order_Date: Date when the order was placed
- Order_Time: Time when the order was placed
- Pickup_Time: Time when the order was picked up for delivery
- Weather: Weather conditions during the delivery (e.g., sunny, rainy, snowy  
- Traffic: Traffic conditions during the delivery (e.g., low, medium, jam) 
- Vehicle: Type of vehicle used for the delivery (e.g., van, motorcycle, bicycle, scooter)
- Area: Area where the delivery took place (Urban, Metropolitan, etc)
- Delivery_Time: Time taken to complete the delivery (time unit)
- Category: Product category of the ordered item (e.g., electronics, apparel, groceries)

Source: Kaggle https://www.kaggle.com/datasets/sujalsuthar/amazon-delivery-dataset

## Tools & Technologies 
- Python
- Pandas & NumPy
- Matplotlib & Seaborn
- Scikit-learn
- Google Colab

## Workflow
This project follows a structured end-to-end data science pipeline to ensure reproducibility and clear business alignment.
1. Problem Definition
2. Data Collection
3. Data Cleaning & Feature Engineering
4. Exploratory Data Analysis (EDA)
5. Insights
6. Predictive Modeling using classification models
7. Conclusion


## Recommendations 
Based on analysis: 
- Optimize high-delay regions with improved routing strategies

## Project Structure 
- notebooks/ -> Python + Google Colab
- data/ → raw dataset
- outputs/ → processed datasets

## Author 
Astrid Arana Rivera
Aspiring Data Scientist

