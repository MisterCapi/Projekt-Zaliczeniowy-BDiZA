SELECT Imie, Nazwisko, Email, Nr_telefonu, Numer_konta
FROM bank.klienci kl
JOIN bank.konta ko ON kl.id_klienta = ko.id_klienta
JOIN bank.transakcje_przychodzace t ON ko.Numer_konta = t.Numer_konta_beneficjenta
WHERE Kwota_transakcji >= 1000000;