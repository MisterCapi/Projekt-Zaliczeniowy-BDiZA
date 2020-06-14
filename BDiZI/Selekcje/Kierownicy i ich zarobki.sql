SELECT Imie, Nazwisko, Zarobki
FROM bank.pracownicy
WHERE id_kierownika is NULL;
-- Tylko kierownicy