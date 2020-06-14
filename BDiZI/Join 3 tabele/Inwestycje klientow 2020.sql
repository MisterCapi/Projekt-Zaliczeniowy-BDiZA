SELECT Imie, Nazwisko, Nazwa_instrumentu, Kwota_inwestycji
FROM bank.klienci
JOIN bank.konta ON klienci.id_klienta = konta.id_klienta
JOIN bank.inwestycje ON inwestycje.Numer_konta = konta.Numer_konta
WHERE Data_sprzedazy > '2020-01-01';