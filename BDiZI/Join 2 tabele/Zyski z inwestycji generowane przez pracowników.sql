SELECT Imie, Nazwisko, Email, SUM(Kwota_sprzedazy - Kwota_inwestycji) AS Zyski
FROM bank.inwestycje i
INNER JOIN bank.pracownicy p ON i.id_pracownik_obslugujacy = p.id_pracownika
GROUP BY Imie, Nazwisko;