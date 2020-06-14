SELECT Imie, Nazwisko, Nazwa_stanowiska, Opis_Stanowiska
FROM bank.pracownicy p
JOIN bank.stanowiska s ON s.id_stanowiska = p.id_stanowiska
JOIN bank.transakcje_przychodzace t ON t.id_pracownika_nadzorujacego = p.id_pracownika
GROUP BY Imie, Nazwisko;