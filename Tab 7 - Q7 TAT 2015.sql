-- DW - Claims Turnaround Time by Claim Closed Year for Rev 0 Claims (Treatment to Close)
SELECT
    to_char(cr.claim_revision_close_date, 'YYYY') AS "Close Year",
    COUNT(*) AS "Total Closed Claims (Rev 0)",
    SUM(TRUNC(cr.claim_revision_close_date) - TRUNC(ch.claim_1st_treatment) + 1) AS "Total Turnaround Time",
    ROUND(AVG(TRUNC(cr.claim_revision_close_date) - TRUNC(ch.claim_1st_treatment) + 1),1) AS "TAT - Tx to Close"
FROM
    dwadmin.dw_claim_header ch JOIN dwadmin.dw_claim_revision cr ON (ch.claim_id = cr.claim_id)
WHERE
    cr.claim_revision_no = 0 AND
    cr.claim_revision_status IN ('Claim Complete','Reopened') AND
    to_char(cr.claim_revision_close_date, 'YYYY') = '2015'
GROUP BY
    to_char(cr.claim_revision_close_date, 'YYYY')
ORDER BY
    to_char(cr.claim_revision_close_date, 'YYYY')




-- DW - Claims Turnaround Time by Claim Closed Month for Rev 0 Claims (Treatment to Close)
SELECT
    TRUNC(cr.claim_revision_close_date,'MM') AS "Close Month",
    COUNT(*) AS "Total Closed Claims (Rev 0)",
    SUM(TRUNC(cr.claim_revision_close_date) - TRUNC(ch.claim_1st_treatment) + 1) AS "Total Turnaround Time",
    ROUND(AVG(TRUNC(cr.claim_revision_close_date) - TRUNC(ch.claim_1st_treatment) + 1),1) AS "TAT - Tx to Close"
FROM
    dwadmin.dw_claim_header ch JOIN dwadmin.dw_claim_revision cr ON (ch.claim_id = cr.claim_id)
WHERE
    cr.claim_revision_no = 0 AND
    cr.claim_revision_status IN ('Claim Complete','Reopened') AND
    cr.claim_revision_close_date > to_date('12/31/2014', 'MM/DD/YYYY')
GROUP BY
    TRUNC(cr.claim_revision_close_date,'MM')
ORDER BY
    TRUNC(cr.claim_revision_close_date,'MM')


-- Claims Turnaround Time by Claim Closed Year for Rev 0 Claims (Claims Receipt to Close)

SELECT
    to_char(cr.claim_revision_close_date, 'YYYY') AS "Close Year",
    COUNT(*) AS "Total Closed Claims (Rev 0)",
    SUM(TRUNC(cr.claim_revision_close_date) - TRUNC(ch.CLAIM_DATE_RECEIVED) + 1) AS "Total Turnaround Time",
    ROUND(AVG(TRUNC(cr.claim_revision_close_date) - TRUNC(ch.CLAIM_DATE_RECEIVED) + 1),1) AS "TAT - Tx to Close"
FROM
    dwadmin.dw_claim_header ch JOIN dwadmin.dw_claim_revision cr ON (ch.claim_id = cr.claim_id)
WHERE
    cr.claim_revision_no = 0 AND
    cr.claim_revision_status IN ('Claim Complete','Reopened') AND
    to_char(cr.claim_revision_close_date, 'YYYY') = '2015'
GROUP BY
    to_char(cr.claim_revision_close_date, 'YYYY')
ORDER BY
    to_char(cr.claim_revision_close_date, 'YYYY')
