SELECT Imie, Nazwisko, SUM(Kwota_transakcji)
FROM bank.transakcje_przychodzace t
INNER JOIN bank.pracownicy p ON p.id_pracownika = t.id_pracownika_nadzorujacego
GROUP BY Imie, Nazwisko;