SELECT Imie, Nazwisko, Nazwa_stanowiska, Opis_Stanowiska
FROM bank.pracownicy p
INNER JOIN bank.stanowiska s ON p.id_stanowiska = s.id_stanowiska;