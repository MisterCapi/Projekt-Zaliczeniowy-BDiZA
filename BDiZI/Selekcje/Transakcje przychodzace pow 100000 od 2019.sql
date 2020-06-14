SELECT Numer_konta_platnika, Numer_konta_beneficjenta, Data_realizacji, Kwota_transakcji
FROM bank.transakcje_wychodzace
WHERE Data_realizacji >= '2019-01-01' AND Kwota_transakcji > 100000
ORDER BY Kwota_transakcji;