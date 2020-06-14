SELECT Nazwa_instrumentu, Rodzaj_inwestycji
FROM bank.inwestycje i
INNER JOIN bank.rodzaje_inwestycji r ON r.id_rodzaj_inwestycji = i.id_rodzaj_inwestycji
ORDER BY Rodzaj_inwestycji;