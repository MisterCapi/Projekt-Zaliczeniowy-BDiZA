SELECT Numer_konta, id_pracownik_obslugujacy, Nazwa_instrumentu
FROM bank.inwestycje
ORDER BY Kwota_sprzedazy - Kwota_inwestycji;