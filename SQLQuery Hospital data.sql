select * from [dbo].[Copy of hospital_data_sampleee]

--Does the patient type affect the waiting time?
select count (distinct Patient_Type) from [dbo].[Copy of hospital_data_sampleee]

select date, Financial_Class, Doctor_Type, Entry_Time, Completion_Time, 
DATEDIFF(MINUTE, Entry_Time, Completion_Time) as minutes_spent
into [Hospital data].[dbo].[ Time spent]
from [dbo].[Copy of hospital_data_sampleee]

select * from [Hospital data].[dbo].[ Time spent]

select Financial_Class, Avg(minutes_spent)as Waiting_time
from [Hospital data].[dbo].[ Time spent]
group by Financial_class