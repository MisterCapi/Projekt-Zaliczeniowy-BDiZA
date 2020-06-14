SELECT Imie, Nazwisko, Nazwa_instrumentu, Rodzaj_inwestycji, Kwota_inwestycji
FROM bank.inwestycje i
JOIN bank.rodzaje_inwestycji r ON i.id_rodzaj_inwestycji = r.id_rodzaj_inwestycji
JOIN bank.pracownicy p ON p.id_pracownika = i.id_pracownik_obslugujacy;