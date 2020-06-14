SELECT Imie, Nazwisko, Kwota_lokaty, lokaty.Numer_konta
FROM bank.klienci
JOIN bank.konta ON klienci.id_klienta = konta.id_klienta
JOIN bank.lokaty ON lokaty.Numer_konta = konta.Numer_konta
WHERE Data_zakonczenia > '2020-01-01';