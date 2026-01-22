This task focuses on practicing intermediate SQL concepts using a real-world dataset.
The Chinook sample database was used to analyze customer orders, products, and revenue by applying different types of SQL joins and aggregations.

The objective of this task is to understand how relational tables connect with each other and how business insights can be derived from joined data.

Dataset

The Chinook database (MySQL version) was used for this task.
It contains structured tables such as customers, invoices, invoice lines, tracks, and genres, which makes it suitable for practicing joins and analytical queries.

Tools Used

MySQL 8.x

MySQL Workbench

What was done in this task

Studied table relationships using primary and foreign keys

Used INNER JOIN to combine customers with their orders

Used LEFT JOIN to identify customers who never placed an order

Joined multiple tables to connect orders with products and categories

Calculated total revenue using quantity and unit price

Analyzed revenue by product, genre, country, and customer

Exported the final joined dataset for reporting

Wrote business insights based on the query results

Files in this submission

joins_queries.sql
Contains all SQL queries used in this task, including joins, aggregations, and analysis queries.

joined_output.csv
Exported output of the final joined query showing customer, order, product, category, and revenue details.

insights.txt
Contains key business insights derived from the analysis.

Key Learning

This task helped in understanding how SQL joins work in real business scenarios and how raw transactional data can be transformed into meaningful insights using SQL.

Conclusion

By completing this task, I gained practical experience in writing clean SQL join queries and performing basic business analysis using relational data. The Chinook database provided a realistic structure to apply these concepts effectively.
