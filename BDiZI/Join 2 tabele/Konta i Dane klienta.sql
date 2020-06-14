SELECT Numer_konta, Imie, Nazwisko, Stan_konta, Nr_telefonu
FROM bank.konta kon
INNER JOIN bank.klienci kli ON kon.id_klienta = kli.id_klienta
ORDER BY Nazwisko;