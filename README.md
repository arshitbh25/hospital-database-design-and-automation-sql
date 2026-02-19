#  Hospital Management Database Design and Automation (SQL Project)

Designed and implemented a normalized hospital database in SQL Server with data migration, trigger-based validation, credential-based access control, and automated revenue reporting using stored procedures.


___
## 📌 Table of Contents
- <a href="#overview">Overview</a>
- <a href="#problem-statement">Problem Statement</a>
- <a href="#dataset">Dataset</a>
- <a href="#tools--technologies">Tools and Technologies</a>
- <a href="#project-structure">Project Structure</a>
- <a href="#methods">Methods</a>
- <a href="#key-insights">Key Insights</a>
- <a href="#how-to-run-this-project">How to Run This Project</a>
- <a href="#future-work">Future Work</a>
- <a href="#author--contact">Author and Contact</a>


___
<h2><a class="anchor" id="overview"></a>Overview</h2>

Hospitals often rely on Excel files for managing patient records, appointments, billing, and doctor information during early stages. However, Excel lacks relational integrity, scalability, and automation capabilities, leading to operational inefficiencies and data inconsistency.

This project demonstrates the complete transition from an Excel-based system to a structured relational database using SQL Server. It includes schema design, data migration, integrity enforcement using triggers and constraints, secure access control using stored procedures with credential validation, and automated financial reporting.

The project simulates a real-world database implementation scenario and demonstrates production-level SQL development skills required for Data Analyst and Database roles.


___
<h2><a class="anchor" id="problem-statement"></a>Problem Statement</h2>

The hospital faced the following key operational challenges:

- Lack of structured relational database
- No unique identifiers for core entities
- No referential integrity between related data
- Doctors being double-booked for appointments
- Appointments being scheduled with invalid dates
- No secure access control for sensitive patient data
- No automated reporting system for revenue analysis
- Inefficient manual reporting process

The objective was to design and implement a robust relational database system to ensure data integrity, improve operational efficiency, secure sensitive information, and automate reporting.


___
<h2><a class="anchor" id="dataset"></a>Dataset</h2>

**1. Primary Dataset (hospital_data)**
```bash
data/hospital_data.csv
```

The primary dataset contains combined hospital operational data exported from the legacy Excel system. It includes information related to:
- Patient details
- Doctor information
- Department records
- Appointment schedules
- Prescription records
- Billing and revenue data
- Lab Reports data

This dataset was imported into SQL Server and transformed into multiple normalized relational tables to ensure data integrity and efficient querying.


**2. Authentication Dataset (doctor_credentials)**
```bash
data/doctor_credentials.csv
```

This table stores login credentials for doctors and is used for authentication and secure access control through a stored procedure.
It ensures that only authorized doctors can access patient-related information after successful credential verification.


___
<h2><a class="anchor" id="tools--technologies"></a>Tools and Technologies</h2>

- SQL Server
- SQL Server Management Studio
- Transact-SQL (T-SQL)
- Stored Procedures
- Triggers
- Relational Database Design
- CSV Data Migration
- ER Diagram Design
- RDBMS Normalization Rules

___
<h2><a class="anchor" id="project-structure"></a>Project Structure</h2>

```
hospital-database-design-and-automation-sql/
│
├── README.md
│
├── sql/
│   ├── 01_database_schema_creation.sql
│   ├── 02_data_insertion_and_initialization.sql
│   ├── 03_appointment_scheduling_constraints.sql
│   ├── 04_role_based_access_control.sql
│   └── 05_monthly_department_revenue_report.sql
│
├── data/
|   ├── doctor_credentials.csv
│   └── hospital_data.csv
│
└── docs/
    └── hospital_er_diagram.png
```

___
<h2><a class="anchor" id="methods"></a>Methods</h2>

**1. Database Schema Design**

Created a fully normalized relational schema with proper:
- Primary Keys
- Foreign Keys
- Constraints
- Entity relationships

**File :**
```bash
sql/01_database_schema_creation.sql
```


**2. Data Migration and Initialization**

Imported raw hospital dataset from CSV into SQL Server and inserted structured data into normalized relational tables.

**File :**
```bash
sql/02_data_insertion_and_initialization.sql
```


**3. Appointment Scheduling Validation Using Trigger**

Created a Trigger to enforce scheduling rules and prevent:
- Double booking of doctors
- Invalid appointment entries
- Scheduling conflicts

The trigger automatically validates data during insertion.

**File :**
```bash
sql/03_appointment_scheduling_constraints.sql
```


**4. Secure Role-Based Access Using Stored Procedure with Credential Authentication**

Implemented a Stored Procedure that authenticates doctors using:
- Username
- Password

**Credentials are stored in :**
```bash
data/doctor_credentials.csv
```

Columns:
- doctor_id
- username
- password

The stored procedure ensures doctors can only access authorized patient information after successful authentication.

**File :**
```bash
sql/04_role_based_access_control.sql
```


**5. Automated Monthly Revenue Reporting Using Stored Procedure**

Created a Stored Procedure to automatically generate:
- Department-wise monthly revenue reports

This enables automated financial analysis without manual queries.

**File :**
```bash
sql/05_monthly_department_revenue_report.sql
```


___
<h2><a class="anchor" id="key-insights"></a>Key Insights</h2>

- Excel is not suitable for managing relational operational data at scale
- Relational databases ensure data consistency and integrity
- Triggers can enforce real-time data validation automatically
- Stored Procedures enable secure and reusable database logic
- Credential-based access improves data security
- Automated reporting improves business decision-making

___
<h2><a class="anchor" id="how-to-run-this-project"></a>How to Run This Project</h2>

Step 1: Clone Repository

```bash
git clone https://github.com/yourusername/hospital-database-design-and-automation-sql.git
```

Step 2: Open SQL Server Management Studio

Step 3: Run SQL files in order:

```bash
01_database_schema_creation.sql
02_data_insertion_and_initialization.sql
03_appointment_scheduling_constraints.sql
04_role_based_access_control.sql
05_monthly_department_revenue_report.sql
```

Step 4: Execute Stored Procedures


___
<h2><a class="anchor" id="future_work"></a>Future Work</h2>

Future improvements can include:
- Integration with Power BI for dashboard visualization
- Implementation of advanced role-based access control
- Password encryption for enhanced security
- Development of web-based frontend interface
- Real-time analytics and reporting system


___
<h2><a class="anchor" id="author--contact"></a>Author and Contact</h2>

**Arshit Bhardwaj**  
Aspiring Data Analyst

📧 Email: arshitbh25@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/arshit-bhardwaj/)  
🔗 [Portfolio](https://sites.google.com/view/arshit-bhardwaj/)
