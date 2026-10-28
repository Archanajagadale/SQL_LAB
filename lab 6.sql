--  Display customer Table
use bank;
Select * from customer;
-- 2. Display all customer FirstName in uppercase.
Select first_name, upper(first_name)as new_name from customer;

-- Display all customer FirstName in lowercase.d
Select first_name, lower(first_name)as L_s from customer;

-- 4. Find the total number of characters in each customer FirstName
select first_name, length(first_name) as Lengthofname from customer;

-- 5. Display only the first three characters of customer FirstName .
Select first_name, left(first_name,3) from customer;

-- Combine customer's FirstName with LastName.
Select concat (first_name,"",Last_name) as combine from customer;

 -- Trim
Select First_name, trim(First_name) from customer;

-- Right
Select First_name, right(first_name,2) from customer;

-- mid
Select First_name, mid(first_name,2,3) from customer;

-- Round
Select round(456.52);

-- ceil
Select ceil(456.1);

-- Floor
Select floor(45.5);

-- abs
Select abs(-89.8);

-- mod
select mod(75,4);

--  Display customer Table
Select * from customer;

-- Display the current system date
Select current_date();

-- Display the current system date and time.
Select now();

-- 4. Display the Birth of year
Select Date_of_Birth, year(Date_of_birth) from customer;

-- Display the Birth month
Select Date_of_Birth, month (Date_of_birth) from customer;

-- Calculate the number of days since BirthDate
Select Date_of_Birth, datediff(current_date() ,date_of_birth) from customer;

-- Find the latest birth date.
Select Date_of_birth from customer
order by Date_of_birth desc
limit 1;

Select max(date_of_birth) from customer;

-- 8. Find the earliest birth date
Select Date_of_birth from customer
order by Date_of_birth
limit 1;


-- 1. Categorize customers as Adult or Young based on their birth year
select year (date_of_birth),
case
when year(date_of_birth) > 1998 then "Young"
When year(date_of_birth) <= 1998 then "Adult"
end as category from customer;

--  Display 'Not Available' if a phone number is NULL
Select ifnull(Phone, "nott availble") from customer;

-- 3. Compare two customer names
Select First_name, nullif(First_name,"Priya") as new_name from customer;
 
-- Calculate the total balance maintained across all customer accounts.
select  Sum(Balance) from account_table;
 
-- 5. Calculate the average balance maintained across all customer accounts to understand the typical amount held by customers.
Select avg(Balance) from account_table;
 
 -- Identify the highest balance maintained in any customer account.
 Select max(balance) from account_table;

 
-- 7. Identify the lowest balance maintained in any customer account
Select min(balance) from account_table;
 
-- Determine the total number of customer accounts available in the system.
Select count(*) from customer;


-- 9. The bank wants to calculate the total account balance for each AccountType by grouping the records based on AccountType and identify which account type is attracting the highest total deposits from customers.
 Select account_type, sum(balance) from account_table
 group by Account_type
 order by sum(balance);
 
 
--  10. The bank management wants to identify only those account types whose total customer deposits exceed ₹25,000.
Select account_type, sum(balance) from account_table
group by Account_type
Having Sum(balance)>25000;
 