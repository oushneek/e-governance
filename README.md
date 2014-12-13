# e-governance
> Project for Therap Java Fest-2014

## Project Proposal and User Guidelines
1. [Download Project Proposal](https://github.com/ratulcse10/e-governance/blob/master/E_Governance.pdf)
2. [Download User Guidelines](https://github.com/ratulcse10/e-governance/blob/master/User_Guidelines.pdf)

## How to Deploy

### Step 1 (Clone)
Clone this Repository to your computer or Download the master zip file

### Step 2 (Setup Environment)
To Deploy this project you need the following environment on your computer

1. Netbeans 7.4
2. Oracle JDK 1.8
3. Apache Tomcat 7
4. MySQL 5.6
5. MySQL Connector (JDBC) [version: 5.1.23] 

### Step 3 (Setup Database)
Create a Database named `e_governance` on your MySQL

After creating the Database import the below SQL File to create and seed the tables

[Download Database SQL File](https://github.com/ratulcse10/e-governance/blob/master/e_governance.sql)

### Step 4 (Setup Database Username and Password)
Please check the `database.connection.ConnectDetails` Class and Change the Username and Password According to your Database Login Details

Also if you change the database name, please change here too
```java
// JDBC driver name and database URL
public static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
public static final String DB_URL = "jdbc:mysql://localhost/e_governance";

//  Database credentials
public static final String USER = "root";
public static final String PASS = "";
```

### Step 5 (Start Server)
Start `Apache Tomcat` and `MySQL`

### Step 6 (Import project)
Import the Project in Netbeans and Click Run


## Demo Login Details
### Education
Name | Email | Password
------------ | ------------- | -------------
Ideal School and College | ideal@edu.gov.bd | idealedu
Motijheel Model School  | motijheel@edu.gov.bd | motijheeledu

### Bank
Name | Email | Password
------------ | ------------- | -------------
Dhaka Bank | basic@bank.gov.bd | dhakabank
Basic Bank  | dhanmondi@police.gov.bd | basicbank

### Police
Name | Email | Password
------------ | ------------- | -------------
Dhanmondi Thana | dhanmondi@police.gov.bd | dhanmondipolice
Ramna Thana  | ramna@police.gov.bd | ramnapolice

### Hospital
Name | Email | Password
------------ | ------------- | -------------
Islami Bank Hospital | islami@medical.gov.bd | islami
Square Hospital  | square@medical.gov.bd | square

### Job
Name | Email | Password
------------ | ------------- | -------------
Agrani Bank | agrani@job.gov.bd | agranijob
Square Hospital  | square@job.gov.bd | squarejob

### Govt
Name | Email | Password
------------ | ------------- | -------------
Administration | gov@gov.bd | gov

## Development Credit
**SUST_Nirontor**
  * Md Abu Shahriar Ratul
  * Tazbeea Tazakka Oushneek

**Department of Computer Science and Engineering,Shahjalal University of Science and Technology,Sylhet**

