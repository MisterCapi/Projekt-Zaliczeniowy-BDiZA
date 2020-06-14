SELECT Imie, Nazwisko, Miasto, Ulica, Nr_budynku, Nr_lokalu
FROM bank.pracownicy pr
INNER JOIN bank.placowki pl ON pr.id_placowki = pl.id_placowki;