SELECT ko.Numer_konta, Stan_konta, Kwota_do_oddania
FROM bank.konta ko
INNER JOIN bank.kredyty kr ON ko.Numer_konta = kr.Numer_konta
WHERE Kwota_do_oddania > 10000 OR Stan_konta < 5000;