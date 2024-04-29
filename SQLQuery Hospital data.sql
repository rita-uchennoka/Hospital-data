select * from [dbo].[Copy of hospital_data_sampleee]

--Does the patient type affect the waiting time?
select count (distinct Patient_Type) from [dbo].[Copy of hospital_data_sampleee]

select date, Financial_Class, Doctor_Type, Entry_Time, Post_Consultation_Time, 
DATEDIFF(MINUTE, Entry_Time, Post_Consultation_Time) as minutes_spent
into [Hospital data].[dbo].[ Time spent]
from [dbo].[Copy of hospital_data_sampleee]

drop table [Hospital data].[dbo].[ Time spent]

select * from [Hospital data].[dbo].[ Time spent]

select Financial_Class, Avg(minutes_spent)as Waiting_time
from [Hospital data].[dbo].[ Time spent]
group by Financial_class

select Doctor_Type, Avg(minutes_spent)as Waiting_time
from [Hospital data].[dbo].[ Time spent]
group by doctor_type

--Are we too busy?
select date, count (Patient_ID) Total_Pat
from  [dbo].[Copy of hospital_data_sampleee]
where date = '2019-11-01'
group by Date
order by Total_Pat


-- Analysis date -2019-11-01 to 2019-11-13
Select min(Date) first_day, max(Date) last_date
from [dbo].[Copy of hospital_data_sampleee]

--Total patient seen within the period-29998
select count(distinct Patient_ID)
from [dbo].[Copy of hospital_data_sampleee]

select count(Patient_ID) Total_Patient, DATEDIFF(day, 2019-11-13, 2019-11-01) Period
into [Hospital data].[dbo].[Daily_Ave]
from [dbo].[Copy of hospital_data_sampleee]

select * from [Hospital data].[dbo].[Daily_Ave]


select Total_Patient, Period, Total_Patient/Period as Ave_Patient
from [Hospital data].[dbo].[Daily_Ave]


select * 
from [dbo].[Copy of hospital_data_sampleee]

-- Finding-Do we have staffing issues?,What type of staff do we need or where do we need them?

select Doctor_type, count(Patient_ID)Total_Patient
from [dbo].[Copy of hospital_data_sampleee]
group by Doctor_Type
order by Total_Patient desc



select date, Financial_Class, Patient_ID, Doctor_Type, Entry_Time, Post_Consultation_Time, 
DATEDIFF(MINUTE, Entry_Time, Post_Consultation_Time) as minutes_spent
into [Hospital data].[dbo].[ Time spent]
from [dbo].[Copy of hospital_data_sampleee]

select * from [Hospital data].[dbo].[ Time spent]


-- Finding How much patients wait before the doctor can see them?
select Doctor_Type,count(Patient_ID)Total_Patient, Avg(minutes_spent)as Waiting_time
from [Hospital data].[dbo].[ Time spent]
group by doctor_type
order by Total_Patient desc


--What days of the week are affected?

select * from [dbo].[Copy of hospital_data_sampleee]

SELECT Date,DATENAME(weekday, Date) AS DayOfWeek, Doctor_Type, COUNT(Patient_ID) AS Total_Patients
FROM [dbo].[Copy of hospital_data_sampleee]
GROUP BY Date, Doctor_Type, DATENAME(weekday, Date)
ORDER BY Total_Patients DESC;

--What day of the week are affected?

SELECT Date, COUNT(Patient_ID) AS Total_Patients
FROM [dbo].[Copy of hospital_data_sampleee]
GROUP BY Date
ORDER BY Total_Patients DESC;

SELECT Date, DATENAME(weekday, Date) AS DayOfWeek, COUNT(Patient_ID) AS Total_Patients
FROM [dbo].[Copy of hospital_data_sampleee]
GROUP BY Date, DATENAME(weekday, Date)
ORDER BY Total_Patients DESC;

