SELECT sum(MONTHS_BETWEEN(ph.actual_start_date, ph.dob )/12)
              ,COUNT(*)
              ,count(ph.policyid)
              ,Round(sum(MONTHS_BETWEEN(ph.actual_start_date, ph.dob )/12) / count(ph.policyid) , 2) Avg_Inforce_Age
FROM dwadmin.dw_policy_header ph
           ,dwadmin.dw_data_inforce i
WHERE ph.policyid = i.policyid 
      AND i.reportperiod = to_date('12/31/2014', 'MM/dd/yyyy')
