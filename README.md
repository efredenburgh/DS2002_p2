# DS2002_p2
Repository for Project 2: Capstone in Data Science Systems, Fall 2024
Emily Fredenburgh (xux5ev)

## Database Information:
- **Sakila** Database is a sample movie rental database

## Services Used:
- Azure Databricks - where the bulk of the code was performed
- Azure MySQL - where I loaded the dimension tables after connecting to Workbench
- MySQL Workbench - where I created and populated the dimension tables
- MongoDB Atlas - where I contained my json files in a database
- DBFS - where I worked with a local file system to read in a table

## Map of Repository Documentation:
### Project Folder Structure:
```
DS2002_p2/
│
├── CLASS_REFERENCE_CODE/
│   └── Ef-6.0-Lab-DataLakehouse-Structured-Streaming.ipynb
│
├── DATA/
│   ├── CSV/
│   │   ├── dim_customer.csv
│   │   ├── dim_date.csv
│   │   └── dim_film.csv
│   └── JSON/
│       ├── dim_inventory.json
│       └── dim_payment.json
│
├── OUTPUT/
│   └── 
│
├── SCRIPTS/
│   ├── DBC/
│   │   └── 
│   └── MySQL/
│       ├── create&populate_tables.sql
│       ├── create_sql.sql
│       ├── sakila-data.sql
│       └── sakila-schema.sql
│  
├── LICENSE.md
└── README.md
```
