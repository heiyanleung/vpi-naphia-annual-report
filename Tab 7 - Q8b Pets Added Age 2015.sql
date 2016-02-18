SELECT '2008', ROUND(sum(MONTHS_BETWEEN(ph.effective_date, ph.dob )/12)  / (count(wp.POLICYID)) , 2 ) Avg_Age
       ,COUNT(wp.policyid)
       ,sum(MONTHS_BETWEEN(ph.effective_date, ph.dob )/12) 
FROM
  DWADMIN.DW_POLICY_HEADER ph,
  DWADMIN.DW_WP wp
WHERE
  ( ph.POLICYID=wp.POLICYID  )
  AND  ( ph.effective_date < trunc(sysdate)  )
  AND  
  (
   to_char(wp.REPORTPERIOD,'YYYY')  =  '2008'
  AND
   to_number(ph.POLICY_RENEW_NO)  =  0
  )
  
  UNION ALL
  
  SELECT '2009', ROUND(sum(MONTHS_BETWEEN(ph.effective_date, ph.dob )/12)  / (count(wp.POLICYID)) , 2 ) Avg_Age
       ,COUNT(wp.policyid)
       ,sum(MONTHS_BETWEEN(ph.effective_date, ph.dob )/12) 
FROM
  DWADMIN.DW_POLICY_HEADER ph,
  DWADMIN.DW_WP wp
WHERE
  ( ph.POLICYID=wp.POLICYID  )
  AND  ( ph.effective_date < trunc(sysdate)  )
  AND  
  (
   to_char(wp.REPORTPERIOD,'YYYY')  =  '2009'
  AND
   to_number(ph.POLICY_RENEW_NO)  =  0
  )
  
  UNION ALL
  
  SELECT '2010', ROUND(sum(MONTHS_BETWEEN(ph.effective_date, ph.dob )/12)  / (count(wp.POLICYID)) , 2 ) Avg_Age
       ,COUNT(wp.policyid)
       ,sum(MONTHS_BETWEEN(ph.effective_date, ph.dob )/12) 
FROM
  DWADMIN.DW_POLICY_HEADER ph,
  DWADMIN.DW_WP wp
WHERE
  ( ph.POLICYID=wp.POLICYID  )
  AND  ( ph.effective_date < trunc(sysdate)  )
  AND  
  (
   to_char(wp.REPORTPERIOD,'YYYY')  =  '2010'
  AND
   to_number(ph.POLICY_RENEW_NO)  =  0
  )
  
  UNION ALL
  
  SELECT '2011', ROUND(sum(MONTHS_BETWEEN(ph.effective_date, ph.dob )/12)  / (count(wp.POLICYID)) , 2 ) Avg_Age
       ,COUNT(wp.policyid)
       ,sum(MONTHS_BETWEEN(ph.effective_date, ph.dob )/12) 
FROM
  DWADMIN.DW_POLICY_HEADER ph,
  DWADMIN.DW_WP wp
WHERE
  ( ph.POLICYID=wp.POLICYID  )
  AND  ( ph.effective_date < trunc(sysdate)  )
  AND  
  (
   to_char(wp.REPORTPERIOD,'YYYY')  =  '2011'
  AND
   to_number(ph.POLICY_RENEW_NO)  =  0
  )

  UNION ALL
  
  SELECT '2012', ROUND(sum(MONTHS_BETWEEN(ph.effective_date, ph.dob )/12)  / (count(wp.POLICYID)) , 2 ) Avg_Age
       ,COUNT(wp.policyid)
       ,sum(MONTHS_BETWEEN(ph.effective_date, ph.dob )/12) 
FROM
  DWADMIN.DW_POLICY_HEADER ph,
  DWADMIN.DW_WP wp
WHERE
  ( ph.POLICYID=wp.POLICYID  )
  AND  ( ph.effective_date < trunc(sysdate)  )
  AND  
  (
   to_char(wp.REPORTPERIOD,'YYYY')  =  '2012'
  AND
   to_number(ph.POLICY_RENEW_NO)  =  0
  )
  
    UNION ALL
  
  SELECT '2013', ROUND(sum(MONTHS_BETWEEN(ph.effective_date, ph.dob )/12)  / (count(wp.POLICYID)) , 2 ) Avg_Age
       ,COUNT(wp.policyid)
       ,sum(MONTHS_BETWEEN(ph.effective_date, ph.dob )/12) 
FROM
  DWADMIN.DW_POLICY_HEADER ph,
  DWADMIN.DW_WP wp
WHERE
  ( ph.POLICYID=wp.POLICYID  )
  AND  ( ph.effective_date < trunc(sysdate)  )
  AND  
  (
   to_char(wp.REPORTPERIOD,'YYYY')  =  '2013'
  AND
   to_number(ph.POLICY_RENEW_NO)  =  0
  )
  
    UNION ALL
  
  SELECT '2014', ROUND(sum(MONTHS_BETWEEN(ph.effective_date, ph.dob )/12)  / (count(wp.POLICYID)) , 2 ) Avg_Age
       ,COUNT(wp.policyid)
       ,sum(MONTHS_BETWEEN(ph.effective_date, ph.dob )/12) 
FROM
  DWADMIN.DW_POLICY_HEADER ph,
  DWADMIN.DW_WP wp
WHERE
  ( ph.POLICYID=wp.POLICYID  )
  AND  ( ph.effective_date < trunc(sysdate)  )
  AND  
  (
   to_char(wp.REPORTPERIOD,'YYYY')  =  '2014'
  AND
   to_number(ph.POLICY_RENEW_NO)  =  0
  )

    UNION ALL
  
  SELECT '2015', ROUND(sum(MONTHS_BETWEEN(ph.effective_date, ph.dob )/12)  / (count(wp.POLICYID)) , 2 ) Avg_Age
       ,COUNT(wp.policyid)
       ,sum(MONTHS_BETWEEN(ph.effective_date, ph.dob )/12) 
FROM
  DWADMIN.DW_POLICY_HEADER ph,
  DWADMIN.DW_WP wp
WHERE
  ( ph.POLICYID=wp.POLICYID  )
  AND  ( ph.effective_date < trunc(sysdate)  )
  AND  
  (
   to_char(wp.REPORTPERIOD,'YYYY')  =  '2015'
  AND
   to_number(ph.POLICY_RENEW_NO)  =  0
  )
