# README

Niniejszy projekt jest przykładowym system zarządzania szkołą.

## Uruchomienie

    Serwer można łatwo uruchomić i przygotować poprzez wkoananie polecenia
    `bin/setup`

## Możliwości systemu

    - Zarządzanie użytkowników
    - Logowanie i autoryzacja użytkowników
    - Zarządzenie różnymi klasami, przedmiotami, i zajęciami
    - Tworzenie egzaminów i informowanie o nadchodących egzaminach
    - Obliczanie średniej z przedmiotów

## Użytkownicy

System obsługuje trzy typy użytkowników:
    - studentów
    - nauczycieli
    - administratorów

Użytkownicy mają własne widoki oraz odrębne pozwolenia odnośnie systemu.

Administrator posiada pełne zezwolenia.
    Może on między innymi tworzyć i usuwać użytkownicy, przedmioty, i klasy (roki).

Nauczyciel posiada zezwolenia zawęrzone do swoich klas i uczniów.
    Może on ogłaszać egzaminy oraz dawać uczniom oceny.

Student ma jedynie wgląd do danych.
    Może on zobaczyć jakie są przyszłe egzaminy, jaką ma średnią, oraz na jakie przedmioty jest zapisany.

Przykładowe dane logowania:
    Student:
        Email: adrian1@school.com
    Nauczyciel:
        Email: sandra6@school.com
    Administrator:
        Email: marcin8@school.com
    
    Wszystkie hasła to 1234

    Dane logowania innych użytkowników można znaleźć w pliku seeds.rb

## Tabele

    Users - Użytkownicy
    User_types - Typy użytkowników
    Grades - Klasy (grupy użytkowniów)
    Subjects - Lista przedmioty
    Courses - Zajęcia (Klasa + przedmiot + nauczyciel)
    Marks - Oceny
    Exams - Egzaminy

## Ładowanie bazy danych

Dane testowe znajdują się w seeds.rb
Żeby je należy wykonać polecenie
`rails db:seed`