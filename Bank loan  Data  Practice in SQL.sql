Select * from Bank_Loan_Data;
Select COUNT(id) as Total_Loan_Applications
  FROM Bank_Loan_Data

  Select SUM(loan_amount) as MTD_Total_Funded_Amount 
  from Bank_Loan_Data
  Where MONTH(issue_date)=12 AND YEAR(issue_date)=2021

  Select SUM(loan_amount) as PMTD_Total_Funded_Amount 
  from Bank_Loan_Data
  Where MONTH(issue_date)=11 AND YEAR(issue_date)=2021

  Select SUM(total_payment) as MTD_Total_Amount_Received
  from Bank_Loan_Data
  where MONTH(issue_date)=12 and YEAR(issue_Date)=2021

  Select SUM(total_payment) as PMTD_Total_Amount_Received
  from Bank_Loan_Data
  where MONTH(issue_date)=11 and YEAR(issue_Date)=2021  

  Select AVG(int_rate)*100 as Avg_Interest_Rate 
  From Bank_Loan_Data

   Select Round(AVG(int_rate),4)*100 as MTD_Avg_Interest_Rate 
   From Bank_Loan_Data
   Where MONTH(issue_date)=12 and  YEAR(issue_date)=2021

    Select Round(AVG(int_rate),4)*100 as PMTD_Avg_Interest_Rate 
   From Bank_Loan_Data
   Where MONTH(issue_date)=11 and  YEAR(issue_date)=2021

   Select AVG(dti)*100 as AVG_DTI from Bank_Loan_Data

   Select Round(AVG(dti),4)*100 as MTD_AVG_DTI from Bank_Loan_Data
   Where MONTH(issue_date)=12 and YEAR(issue_date)=2021

   Select Round(AVG(dti),4)*100 as PMTD_AVG_DTI from Bank_Loan_Data
   Where MONTH(issue_date)=11 and YEAR(issue_date)=2021

Select loan_Status From Bank_Loan_Data

Select(COUNT(case when loan_status='Fully Paid' OR loan_status = 'Current' then id END)*100)
/
COUNT(id) as Good_loan_Percentage from Bank_Loan_Data

Select COUNT(id) as Good_Loan_Applications from Bank_Loan_Data
Where loan_status = 'Fully Paid' or loan_status = 'Current'

Select SUM(loan_amount) as Good_Loan_Funded_Amount 
FROM  Bank_Loan_Data
Where loan_status ='Fully Paid' or loan_status = 'Current'

Select (COUNT(Case when loan_status = 'Charged off' then id END)*100.0)/
COUNT(id)  as Bad_Loan_Percentage
from Bank_Loan_Data

Select COUNT(id) as Bad_Loan_Applications from Bank_Loan_Data 
where loan_status = 'Charged off'

Select SUM(loan_amount) as Bad_Loan_Funded_Amount from Bank_Loan_Data
Where loan_status = 'Charged off'

Select SUM(total_payment) as Bad_Loan_Amount_Received from Bank_Loan_Data
Where loan_status = 'Charged off'

Select COUNT(id) as Good_Loan_Applications from Bank_Loan_Data
Where loan_status = 'Fully Paid' or loan_status = 'Current'

Select (COUNT(Case when loan_status = 'Charged off' then id end)*100.0)/
COUNT(id) as Bad_Loan_Percentage from Bank_Loan_Data

Select COUNT(id) as Bad_loan_Applications from Bank_Loan_Data
Where loan_status = 'Charged off'

Select loan_status,
COUNT(id) as Total_Loan_Applications,
SUM(total_payment) as Total_Amount_Received,
SUM(loan_amount) as Total_Funded_Amount,
Avg(int_rate  * 100) as Interest_Rate,
Avg(dti  * 100) as DTI
From Bank_Loan_Data
Group by loan_status;

Select loan_status,
SUM(total_payment) as MTD_Total_Amount_Received,
SUM(loan_amount) as MTD_Total_Funded_Amount 
from Bank_Loan_Data
Where MONTH(issue_date)=12
Group by loan_status

Select * from Bank_Loan_Data

Select
MONTH(issue_date) as Month_Number,
DATENAME(MONTH, issue_date) as Month_Name,
COUNT(id) as Total_loan_Applications,
SUM(loan_amount) as Total_Funded_Amount,
SUM(total_payment) as Total_Received_Amount
from Bank_Loan_Data
Group by MONTH(issue_date),DATENAME(MONTH, issue_date)
order by MONTH(issue_date)

Select
address_state,
COUNT(id) as Total_Loan_applications,
SUM(loan_amount) as Total_Funded_Amount,
SUM(total_payment) as Total_Received_Amount
from Bank_Loan_Data
Group by address_state
Order by COUNT(id) desc;

Select 
   term,
   COUNT(id) as Total_Loan_Applications,
   SUM(loan_amount) as Total_Funded_Amount,
   SUM(Total_Payment) as Total_Received_Amount
   From Bank_Loan_Data
   Group by term
   Order by term

Select 
   emp_length,
   COUNT(id) as Total_Loan_Applications,
   SUM(loan_amount) as Total_Funded_Amount,
   SUM(Total_Payment) as Total_Received_Amount
   From Bank_Loan_Data
   Group by emp_length
   Order by COUNT(id) desc

   Select 
   purpose,
   COUNT(id) as Total_Loan_Applications,
   SUM(loan_amount) as Total_Funded_Amount,
   SUM(Total_Payment) as Total_Received_Amount
   From Bank_Loan_Data
   Group by purpose
   Order by COUNT(id) desc

   Select 
   home_ownership,
   COUNT(id) as Total_Loan_Applications,
   SUM(loan_amount) as Total_Funded_Amount,
   SUM(Total_Payment) as Total_Received_Amount
   From Bank_Loan_Data
   where grade = 'A' and address_state = 'CA'
   Group by home_ownership
   Order by COUNT(id) desc





 

