# Zadanie 1

**Ważna uwaga:** nie do końca wiedziałem, jak rozpracować unarny minus w drukowaniu RPN, kiedy jest stosowany na całe wyrażenie, a nie tylko liczbę.
Przyjęta została zatem konwencja:
- `-number` to w RPN odpowiednia wartość z Z<sub>p</sub>
- `-(expression)` to w RPN `expression ~`

W szczególności:
- `--1` to 1
- `-(-1)` to `1234576 ~`

czyli znak `~` oznacza operację unarnego minusa na ostatniej wartości ze stosu. Dla wyrażenia niebędącego liczbą mamy na przykład `1*(-(1+2))` przechodzące na `1 1 2 + ~ *`.

W komentarzach nie implementowałem kontynuacji linii.

### Użycie
```bash
$ ./zad1
```