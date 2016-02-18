SELECT '1 Month',
       COUNT(PH.POLICYID) EFF_CNT,
       SUM(CASE
             WHEN ADD_MONTHS(PH.EFFECTIVE_DATE, 1) <= PH.ACTUAL_END_DATE THEN
              1
             ELSE
              0
           END) INF_CNT,
       SUM(CASE
             WHEN ADD_MONTHS(PH.EFFECTIVE_DATE, 1) <= PH.ACTUAL_END_DATE THEN
              1
             ELSE
              0
           END) / COUNT(PH.POLICYID) PCT
  FROM DWADMIN.DW_POLICY_HEADER PH
 WHERE PH.EFFECTIVE_DATE >= TO_DATE('01/01/2013', 'MM/DD/YYYY')
   AND PH.EFFECTIVE_DATE <= ADD_MONTHS(TO_DATE('12/31/2015','MM/DD/YYYY'),-1)
   AND PH.POLICY_RENEW_NO = 0

UNION ALL

SELECT '12 Month',
       COUNT(PH.POLICYID) EFF_CNT,
       SUM(CASE
             WHEN PH.EXPIRE_DATE <= PH.ACTUAL_END_DATE THEN
              1
             ELSE
              0
           END) INF_CNT,
       SUM(CASE
             WHEN PH.EXPIRE_DATE <= PH.ACTUAL_END_DATE THEN
              1
             ELSE
              0
           END) / COUNT(PH.POLICYID) PCT
  FROM DWADMIN.DW_POLICY_HEADER PH
 WHERE PH.EFFECTIVE_DATE >= TO_DATE('01/01/2013', 'MM/DD/YYYY')
   AND PH.EFFECTIVE_DATE <= ADD_MONTHS(TO_DATE('12/31/2015','MM/DD/YYYY'),-12)
   AND PH.POLICY_RENEW_NO = 0
   
UNION ALL

SELECT '13 Months',
       COUNT(PH1.POLICY_NO) EFF_CNT,
       COUNT(PHD.POLICY_NO) INF_CNT,
       COUNT(PHD.POLICY_NO)/COUNT(PH1.POLICY_NO) PCT
  FROM (SELECT PH.POLICY_NO
          FROM DWADMIN.DW_POLICY_HEADER PH
         WHERE PH.EFFECTIVE_DATE >= TO_DATE('01/01/2013', 'MM/DD/YYYY')
           AND PH.EFFECTIVE_DATE <= ADD_MONTHS(TO_DATE('12/31/2015','MM/DD/YYYY'),-13)
           AND PH.POLICY_RENEW_NO = 0) PH1
  LEFT JOIN (SELECT PH2.POLICY_NO
               FROM DWADMIN.DW_POLICY_HEADER PH2
              WHERE PH2.POLICY_RENEW_NO = 1
                AND ADD_MONTHS(PH2.EFFECTIVE_DATE, 1) <=
                    PH2.ACTUAL_END_DATE) PHD
    ON PH1.POLICY_NO = PHD.POLICY_NO
    
UNION ALL    
   
SELECT '24 Months',
       COUNT(PH1.POLICY_NO) EFF_CNT,
       COUNT(PHD.POLICY_NO) INF_CNT,
       COUNT(PHD.POLICY_NO)/COUNT(PH1.POLICY_NO) PCT
  FROM (SELECT PH.POLICY_NO
          FROM DWADMIN.DW_POLICY_HEADER PH
         WHERE PH.EFFECTIVE_DATE >= TO_DATE('01/01/2013', 'MM/DD/YYYY')
           AND PH.EFFECTIVE_DATE <= ADD_MONTHS(TO_DATE('12/31/2015','MM/DD/YYYY'),-24)
           AND PH.POLICY_RENEW_NO = 0) PH1
  LEFT JOIN (SELECT PH2.POLICY_NO
               FROM DWADMIN.DW_POLICY_HEADER PH2
              WHERE PH2.POLICY_RENEW_NO = 1
                    AND PH2.EXPIRE_DATE <= PH2.ACTUAL_END_DATE
                ) PHD
    ON PH1.POLICY_NO = PHD.POLICY_NO

UNION ALL 

SELECT '25 Months',
       COUNT(PH1.POLICY_NO) EFF_CNT,
       COUNT(PHD.POLICY_NO) INF_CNT,
       COUNT(PHD.POLICY_NO)/COUNT(PH1.POLICY_NO) PCT
  FROM (SELECT PH.POLICY_NO
          FROM DWADMIN.DW_POLICY_HEADER PH
         WHERE PH.EFFECTIVE_DATE >= TO_DATE('01/01/2013', 'MM/DD/YYYY')
           AND PH.EFFECTIVE_DATE <= ADD_MONTHS(TO_DATE('12/31/2015','MM/DD/YYYY'),-25)
           AND PH.POLICY_RENEW_NO = 0) PH1
  LEFT JOIN (SELECT PH2.POLICY_NO
               FROM DWADMIN.DW_POLICY_HEADER PH2
              WHERE PH2.POLICY_RENEW_NO = 2
                AND ADD_MONTHS(PH2.EFFECTIVE_DATE, 1) <=
                    PH2.ACTUAL_END_DATE) PHD
    ON PH1.POLICY_NO = PHD.POLICY_NO
    
UNION ALL

SELECT '36 Months',
       COUNT(PH1.POLICY_NO) EFF_CNT,
       COUNT(PHD.POLICY_NO) INF_CNT,
       COUNT(PHD.POLICY_NO) / COUNT(PH1.POLICY_NO) PCT
  FROM (SELECT PH.POLICY_NO
          FROM DWADMIN.DW_POLICY_HEADER PH
         WHERE --PH.EFFECTIVE_DATE >= TO_DATE('01/01/2010', 'MM/DD/YYYY') AND
               --PH.EFFECTIVE_DATE <= TO_DATE('01/31/2010', 'MM/DD/YYYY')
               TO_CHAR(PH.EFFECTIVE_DATE, 'YYYY-MM') = '2013-01'
           AND PH.POLICY_RENEW_NO = 0) PH1
  LEFT JOIN (SELECT PH2.POLICY_NO
               FROM DWADMIN.DW_POLICY_HEADER PH2
              WHERE PH2.POLICY_RENEW_NO = 2
                AND PH2.EXPIRE_DATE <= PH2.ACTUAL_END_DATE) PHD
    ON PH1.POLICY_NO = PHD.POLICY_NO


------------
SELECT
    SYSDATE,
    TO_CHAR(SYSDATE, 'YYYY-MM'),
    TRUNC(SYSDATE, 'MM')

FROM
    DUAL





SELECT
    '36 Months',
    PH1.POLICY_NO,
    PH1.EFFECTIVE_DATE,
    PH1.ACTUAL_START_DATE,
    PHD.POLICY_NO,
    PHD.EXPIRE_DATE,
    PHD.ACTUAL_END_DATE

FROM

    (SELECT
        PH.POLICY_NO,
        PH.EFFECTIVE_DATE,
        PH.ACTUAL_START_DATE
    FROM
        DWADMIN.DW_POLICY_HEADER PH
    WHERE
        TO_CHAR(PH.EFFECTIVE_DATE, 'YYYY-MM') = '2010-01' AND
        PH.POLICY_RENEW_NO = 0) PH1
  
LEFT JOIN

    (SELECT
        PH2.POLICY_NO,
        PH2.EXPIRE_DATE,
        PH2.ACTUAL_END_DATE
    FROM
        DWADMIN.DW_POLICY_HEADER PH2
    WHERE
        PH2.POLICY_RENEW_NO = 2 AND
        PH2.EXPIRE_DATE <= PH2.ACTUAL_END_DATE) PHD

ON PH1.POLICY_NO = PHD.POLICY_NO