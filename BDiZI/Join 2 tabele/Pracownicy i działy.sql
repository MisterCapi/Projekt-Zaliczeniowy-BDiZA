SELECT Imie, Nazwisko, Nazwa_dzialu
FROM bank.pracownicy p
INNER JOIN bank.dzialy d ON p.id_dzialu = d.id_dzialu
ORDER BY Nazwa_dzialu;