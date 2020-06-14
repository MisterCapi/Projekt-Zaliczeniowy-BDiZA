SELECT Imie, Nazwisko, Numer_konta, Kwota_lokaty
FROM bank.lokaty l
INNER JOIN bank.pracownicy p ON l.id_pracownika_nadzorujacego = p.id_pracownika
WHERE Zysk > 100
ORDER BY Zysk;