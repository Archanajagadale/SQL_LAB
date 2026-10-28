use bank;

Select * from transaction_table;

Select Transaction_type, amount, row_number() over() from transaction_table;
Select transaction_type, amount, row_number() over(order by amount) from transaction_table;
Select transaction_type, amount, Row_number() over(order by amount DESC) from trasanction_table;
Select transaction_type, amount, row_number() over(Partition by transaction_type order by amount) from transaction_table;

Select Transaction_date,Amount,Transaction_type,
lag(amount) over (order by transaction_date),
lag (amount) over (Partition by Transaction_type order by transaction_date)
from transaction_table;

Select Transaction_date, amount, Transaction_type,
lead(amount)
over (order by transaction_date DESC)
from transaction_table;

Select Transaction_date, amount, Transaction_type,
lead (amount) over (partition by Transaction_type)
from transaction_table;

Select * from loans;

Select loan_id,loan_amount, Rank() over (order by Loan_amount DESC) from Loans;

Select loan_id, customer_id,Loan_amount, dense_rank() over (order by loan_amount DESC) AS Dens_Rank from loans;

Select loan_id, customer_id,Loan_amount, row_number() over (order by loan_amount DESC) from Loans;

Select loan_id, customer_id,Loan_amount, row_number() over (partition by customer_id order by loan_amount desc) from Loans;

Select * from Loans;
Insert into loans values (306,3500000,7.8,"2025-06-01","2026-07-02",101);
Insert into loans values (307,35000,7.8,"2025-06-01","2026-07-02",101);

Select Loan_id, customer_id, Loan_amount, Sum(Loan_amount) over (order by Loan_amount desc) as running_total from loans;

Select Loan_id, customer_id, Loan_amount, Lag(Loan_amount) over (order by Loan_amount desc) as Previous_amount  from loans;

Select Loan_id, customer_id, Loan_amount, Lead(Loan_amount) over (order by Loan_amount desc) as Previous_amount  from loans;