use [Bank Loan];

select * from [Bank Loan];

 --- Total loan Applications ---
select count(id) from [Bank Loan];

 --- Month to Date Loan Application ---
select count(id) from [Bank Loan]
where month(issue_date) = 12;

--- Previous Month to Date Loan Applications ---
select count(id) from [Bank Loan]
where month(issue_date) = 11;

 ---Total funded amount ---
select sum(loan_amount) as Total_Funded_Amount
from [Bank Loan];

 ---  Month to Date Total funded amount ---
select SUM(loan_amount) as Total_Funded_Amount
from [Bank Loan] where MONTH(issue_date) = 12;

 --- Previous Month to Date Total funded amount ---
select SUM(loan_amount) as Total_Funded_Amount
from [Bank Loan] where MONTH(issue_date) = 11;

 --- Total Amount Received ---
select sum(total_payment) as Total_Amount_Received
from [Bank Loan];

 --- Month to Date Total Amount Received --- 
select sum(total_payment) as Total_Amount_Received
from [Bank Loan] where month(issue_date) = 12;

 --- Previous Month to Date Total Amount Received ---
select sum(total_payment) as Total_Amount_Received
from [Bank Loan] where month(issue_date) = 11;

 --- Avg interest rate ---
select AVG(int_rate)*100 as Average_Interest_Rate
from [Bank Loan];

 --- Month to Date Avg interest rate ---
select AVG(int_rate)*100 as MTD_Average_Interest_Rate
from [Bank Loan] where MONTH(issue_date) = 12;

 --- Previous Month to Date Avg interest rate ---
select AVG(int_rate)*100 as PMTD_Average_Interest_Rate
from [Bank Loan] where MONTH(issue_date) = 11;

 --- Average dti ---
select AVG(dti)*100 as AVG_DTI from [Bank Loan];

 --- Month to Date Average dti ---
select AVG(dti)*100 as MTD_AVG_DTI from [Bank Loan]
WHERE MONTH(ISSUE_DATE) = 12;

 --- Previous Month to Date Average dti --- 
select AVG(dti)*100 as PMTD_AVG_DTI from [Bank Loan]
WHERE MONTH(ISSUE_DATE) = 11;

 --- Good Loan Percentage ---
SELECT (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
COUNT(id) AS Good_Loan_Percentage
FROM [Bank Loan];

 --- Good Loan Total Applications ---
SELECT COUNT(id) AS Good_Loan_Applications FROM [Bank Loan]
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

 --- Good Loan Total Funded Amount ---
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM [Bank Loan]
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

--- Good Loan Amount Total Received ---
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM [Bank Loan]
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

--- Bad Loan Amount ---
SELECT (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
COUNT(id) AS Bad_Loan_Percentage FROM [Bank Loan];

--- Bad Loan Total Applications ---
SELECT COUNT(id) AS Bad_Loan_Applications FROM [Bank Loan]
WHERE loan_status = 'Charged Off';

 --- Bad Loan Total Funded Amount ---
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM [Bank Loan]
WHERE loan_status = 'Charged Off';

 --- Bad Loan Amount Received ---
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM [Bank Loan]
WHERE loan_status = 'Charged Off';

--- Current Loan status ---
select loan_status, COUNT(id) as loan_count, sum(total_payment) as Total_Amount_Received,
SUM(loan_amount) as Total_Amount_Funded, AVG(int_rate*100) as INT_RATE,
AVG(dti) as DTI from [Bank Loan] group by loan_status;

 --- MTD Loan Status ---
select loan_status, sum(total_payment) as MTD_Total_Amount_Received,
SUM(loan_amount) as MTD_Total_Amount_Funded from [Bank Loan] WHERE MONTH(ISSUE_DATE) = 12 group by loan_status;

--- Bank Loan Report Overview ---
SELECT MONTH(issue_date) AS Month_Munber, DATENAME(MONTH, issue_date) AS Month_name, 
COUNT(id) AS Total_Loan_Applications,SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received FROM [Bank Loan]
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date);

 --- State Wise Bank Loan Data ---
SELECT address_state AS State, COUNT(id) AS Total_Loan_Applications,SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received FROM [Bank Loan] GROUP BY address_state
ORDER BY address_state;

 --- Term wise Bank Loan Data ---
SELECT term AS Term, COUNT(id) AS Total_Loan_Applications, SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received FROM [Bank Loan] GROUP BY term
ORDER BY term;

 --- Employee Length ---
SELECT emp_length AS Employee_Length, COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount, SUM(total_payment) AS Total_Amount_Received
FROM [Bank Loan] GROUP BY emp_length ORDER BY emp_length;

 --- Loan Purpose ---
 SELECT purpose AS PURPOSE, COUNT(id) AS Total_Loan_Applications, SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received FROM [Bank Loan] GROUP BY purpose ORDER BY purpose;

--- Home Ownership ---
SELECT home_ownership AS Home_Ownership, COUNT(id) AS Total_Loan_Applications, SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received FROM [Bank Loan] GROUP BY home_ownership
ORDER BY home_ownership;

SELECT purpose AS PURPOSE, COUNT(id) AS Total_Loan_Applications,SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received from [Bank Loan] where grade = 'A'
GROUP BY purpose ORDER BY purpose
