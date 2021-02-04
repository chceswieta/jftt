# Zadanie 1

### Konwencja rozpatrywania sytuacji wątpliwych:
1. Znak `\` traktujemy jako kontynuację linii wyłącznie wówczas, gdy natychmiast po nim następuje znak końca linii, to jest `\\n`. 
Oznacza to, że `\ \n` na końcu linii rozpatrujemy jako słowo `\`, a po nim koniec linii.
2. Znaki kontynuacji linii są usuwane, czyli na przykład `    xxx \\n      y   ` zmieni się na `xxx y`.
3. Końcowa informacja zawiera zliczone linie i słowa wyniku, 
tzn. odpowiedni licznik zwiększa się w momencie kiedy uznajemy coś za słowo/linię dopiero podczas analizy.   
Przykład: `    \\n   \\n \n` to 3 linie inputu, ale liczymy 0 (bo to zasadniczo pusta linia); `a\\nb` to 2 słowa inputu, ale liczymy jedno (`ab`).

### Użycie:
```bash
$ ./zad1 < plik_testowy
```