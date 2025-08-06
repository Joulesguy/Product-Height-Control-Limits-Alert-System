# Product-Height-Control-Limits-Alert-System
The Product Height Control Limits Alert System is a SQL-based project designed to monitor and ensure the quality of product heights in a manufacturing environment.

The primary objective of this project is to create an alert mechanism that flags any deviations in product height from established control limits for each operator. This is crucial for maintaining product quality and compliance with industry standards.

**Key Features:**
Control Limits Calculation: The project utilizes statistical methods to calculate upper control limits (UCL) and lower control limits (LCL) for product heights based on historical data. These limits are determined using the average height and standard deviation of the product heights for each operator.

Dynamic Alert System: An alert column is generated to indicate whether the height of a product falls within the defined control limits. This boolean flag helps operators quickly identify products that require attention.

Window Function Implementation: The project employs SQL window functions to calculate control limits dynamically. A window of length 5 is used to consider the last five rows of data, allowing for real-time monitoring of product heights as new data is entered.

Data Organization: The final output is organized to include essential fields such as operator, row number, height, average height, standard deviation, UCL, LCL, and alert status. The results are ordered by item number for easy reference.

DataFrame Export: The resulting dataset, containing alerts for product heights, is saved as a DataFrame named alerts, making it easy to integrate with data analysis tools or reporting systems.

Use Case:
This project is particularly useful for quality control teams in manufacturing settings, where maintaining consistent product dimensions is critical. By implementing this alert system, organizations can proactively address potential quality issues, reduce waste, and enhance overall production efficiency.

**Technologies Used:**
SQL (Structured Query Language)
Database Management System (e.g., PostgreSQL, SQL Server)
