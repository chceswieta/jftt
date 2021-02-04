# Zadanie 4

- Wejście podajemy w postaci pliku, gdzie jedna linijka = jedno wyrażenie do obliczenia. 
- W przypadku działań nieprzemiennych zastosowana konwencja jak na przykładzie z listy, tzn. A B ^ przyjmuje wartość A^B.
- Operujemy zasadniczo na liczbach całkowitych, co powoduje dziwne sytuacje w przypadku potęgowania.
W zadaniu przyjmujemy więc, że A^B ma wartość rzutowaną do liczby całkowitej, np. 2^-3 = 0.
- Pewnie trzeba uważać z potęgowaniem większych liczb, ale to chyba nie takie ważne.

### Użycie:
```bash
$ ./zad4 < plik_testowy
```

### Przykład:

Input:  
```
2 3+4*  
1 2 3 4 + * -  
```

Output:  
```
2 3+4*  
= 20  

1 2 3 4 + * -  
= -13  
```