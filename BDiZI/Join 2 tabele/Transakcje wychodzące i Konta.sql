SELECT *
FROM bank.transakcje_wychodzace t
INNER JOIN bank.konta k ON k.Numer_konta = t.Numer_konta_platnika
ORDER BY Stan_konta DESC;