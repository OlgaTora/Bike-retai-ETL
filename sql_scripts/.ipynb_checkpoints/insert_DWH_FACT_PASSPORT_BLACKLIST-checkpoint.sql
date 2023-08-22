INSERT OR IGNORE INTO DWH_FACT_PASSPORT_BLACKLIST (passport,
                                   date
                                   )
SELECT passport as passport,
        date(date) as date
FROM   STG_PASSPORT_BLACKLIST;