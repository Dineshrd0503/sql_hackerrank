use pratice

/*
Risk is calculated by the addition of CBC, RBH, and LBH. If the sum is more than 20, "High", between 16-20 then "Medium", else "Low"
*/

-- 𝐓𝐚𝐛𝐥𝐞 -𝟏 
CREATE TABLE insurance (
 Patient_id INT PRIMARY KEY,
 Insurance_id INT,
 Insurance_Name VARCHAR(50)
);

-- 𝐈𝐧𝐬𝐞𝐫𝐭 𝐭𝐡𝐞 𝐝𝐚𝐭𝐚 
INSERT INTO insurance (Patient_id, Insurance_id, Insurance_Name)
VALUES 
 (1, 1001, 'India Insurance'),(2, 1002, 'ICICI Lombard'),
 (3, 1001, 'India Insurance'),(4, 1003, 'Star Health'),
 (5, 1003, 'Star Health');

-- 𝐓𝐚𝐛𝐥𝐞 - 𝟐
CREATE TABLE test (
 Patient_id INT,
 Test_type VARCHAR(10),
 Test_score INT,
 FOREIGN KEY (Patient_id) REFERENCES insurance(Patient_id)
);


select * from insurance i
join test t on
i.Patient_id=t.Patient_id

 -- 𝐈𝐧𝐬𝐞𝐫𝐭 𝐭𝐡𝐞 𝐝𝐚𝐭𝐚 
INSERT INTO test (Patient_id, Test_type, Test_score)
VALUES 
(1, 'CBC', 7),(1, 'RBC', 6),(1, 'LBH', 6),(2, 'CBC', 7),(2, 'RBC', 8),(2, 'LBH', 8),
(3, 'CBC', 5),(3, 'RBC', 4),(3, 'LBH', 4),(4, 'CBC', 4),(4, 'RBC', 6),(4, 'LBH', 6),
(5, 'CBC', 5),(5, 'RBC', 6),(5, 'LBH', 7);

/*
Risk is calculated by the addition of CBC, RBH, and LBH. If the sum is more than 20, "High", between 16-20 then "Medium", else "Low"
*/
select i.patient_id,i.insurance_id,i.insurance_name,
case when(
sum(case when t.test_type='cbc' then t.Test_score else 0 end)+
sum(case when t.test_type='rbc' then t.Test_score else 0 end)+
sum(case when t.test_type='lbh' then t.Test_score else 0 end))
>20
then 'High'
when(
sum(case when t.test_type='cbc' then t.Test_score else 0 end)+
sum(case when t.test_type='rbc' then t.Test_score else 0 end)+
sum(case when t.test_type='lbh' then t.Test_score else 0 end))
between 16 and 20 then 'Medium'
else 'Low'
end as risk_level
from insurance i
join test t
on i.Patient_id=t.Patient_id
group by
i.patient_id,i.insurance_id,i.insurance_name