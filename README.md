# Customer, Order and Retention Query Audit

## Project Overview

This project focuses on analysing customer and order data using PostgreSQL to understand customer purchasing behaviour, order performance, and customer retention.

The project demonstrates how SQL can be used to clean, organise, query, and analyse relational data to generate meaningful business insights.

## Project Objectives

- Examine customer and order records.
- Perform data quality checks.
- Analyse customer purchasing behaviour.
- Identify repeat customers.
- Calculate order values and Average Order Value (AOV).
- Examine monthly customer activity.
- Calculate customer retention rates.
- Provide business insights and recommendations.

## Tools and Technologies

- PostgreSQL
- Supabase
- SQL
- GitHub

## Database Structure

The project uses four relational tables:

1. **Customers:** Stores customer information.
2. **Products:** Stores product details and prices.
3. **Orders:** Stores customer order records and order statuses.
4. **Order Items:** Stores products, quantities, and prices associated with each order.

## Project Analysis

The analysis covers:

- Data quality auditing
- Customer analysis
- Order analysis
- Revenue calculations
- Average Order Value
- Repeat customer analysis
- Monthly customer activity
- Customer retention analysis

## Key Findings

- Total registered customers: 10
- Total recorded orders: 15
- Highest customer order value: Daniel
- Lowest customer order value: Mary
- Average Order Value: 223,466.67
- January–February customer retention rate: 33.33%

*Note: Revenue figures are based on calculated order values across all order statuses. They should not be interpreted as completed sales revenue without accounting for cancelled and returned orders.*

## Business Recommendations

- Improve customer retention strategies.
- Monitor customer purchasing behaviour.
- Encourage repeat purchases.
- Monitor order fulfilment and cancellation patterns.
- Track average order value over time.

## Project Folder Structure

```text
Customer-Order-and-Retention-Query-Audit/
├── data/
│   └── raw/
├── sql/
├── documentation/
│   └── business_insights.md
└── README.md
```

## Skills Demonstrated

- SQL querying
- Database design
- Data quality auditing
- Aggregate functions
- Joins and subqueries
- Common Table Expressions (CTEs)
- Customer retention analysis
- Business insight generation

## Conclusion

This project demonstrates the practical application of PostgreSQL in analysing relational customer and order data. It strengthened my understanding of SQL and showed how data analysis can support business decision-making.