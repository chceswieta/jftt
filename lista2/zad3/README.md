# Zadanie 3

Zakładamy poprawny kod C++, w szczególności w kwestii escape sequences. Pod ich względem analiza działa poprawnie dla każdego kompilującego się kodu, na przykład
```cpp
cout << "Komentarz\j /* ala */" << endl;
```
daje nam warning, ale się kompiluje i drukuje 
```
Komentarz\j /* ala */
```
Podczas analizy nie jest usuwany fragment `/* ala */`. Natomiast dla
```cpp
cout << "Komentarz\x /* ala */" << endl;
```
program się nie kompiluje, zatem fragment `Komentarz\x /* ala */` nie jest podczas analizy rozpatrywany jako string, dlatego usuwamy `/* ala */`.

Nie wiedziałem tylko co zrobić z przykładem
```cpp
cout << "Pulapka \" \\
        // ma \
        /* ma */ \
        " << endl;
```
który jest przepuszczany przez kompilator z ostrzeżeniem i drukuje podany tekst tak jak trzeba 
(podobnie nieparzysta liczba `\` w pierwszej linijce, ale ze spacją przed końcem linii). 
W tym wypadku nie byłem pewny w jakim stopniu poluzować zasady, dlatego też są surowe:
string musi kończyć się w tej samej linii albo zawierać poprawny znak kontynuacji.

### Użycie:  
Usuwanie wszystkich komentarzy:
```bash
$ ./zad3 < plik_testowy
```
Usuwanie tylko komentarzy niedokumentacyjnych:
```bash
$ ./zad3 -d < plik_testowy
```