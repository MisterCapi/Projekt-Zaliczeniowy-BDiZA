SELECT Imie, Nazwisko, Nazwa_stanowiska, Opis_Stanowiska
FROM bank.pracownicy p
JOIN bank.stanowiska s ON s.id_stanowiska = p.id_stanowiska
JOIN bank.kredyty k ON k.id_pracownika_obslugujacego = p.id_pracownika
GROUP BY Imie, Nazwisko;