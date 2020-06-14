SELECT Imie, Nazwisko, Nazwa_stanowiska, Nazwa_dzialu, Nr_telefonu
FROM bank.pracownicy p
JOIN bank.dzialy d ON p.id_dzialu = d.id_dzialu
JOIN bank.stanowiska s ON s.id_stanowiska = p.id_stanowiska;