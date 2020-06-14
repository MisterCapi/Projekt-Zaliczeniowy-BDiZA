SELECT Imie, Nazwisko, Kwota_do_oddania, kredyty.Numer_konta
FROM bank.klienci
JOIN bank.konta ON klienci.id_klienta = konta.id_klienta
JOIN bank.kredyty ON kredyty.Numer_konta = konta.Numer_konta
WHERE Splacony != 'TAK';