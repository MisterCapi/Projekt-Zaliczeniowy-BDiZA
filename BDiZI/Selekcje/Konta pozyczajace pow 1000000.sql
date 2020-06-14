SELECT Numer_konta, id_pracownika_obslugujacego
FROM bank.kredyty
WHERE Kwota_pozyczona > 1000000;