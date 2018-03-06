# Real-Time Clock


Projekt zegara czasu rzeczywistego, wyświetlającego czas w postaci : HH.MM. Kropka miga z częstotliwością 1 Hz.


Do zmiany ustawień użyto czterech przycisków:

- Przycisk BTN1 - ustawianie godzin.
- Przycisk BTN0 - ustawianie minut.
- Przycisk BTN2 - przycisk testowy, powodujący przyspieszone (np. 1000 razy) działanie zegara w celu sprawdzenia działania zegara.
- Przycisk BTN3 - reset asynchroniczny.

Dodatkowo układ zabezpieczono przed drganiami przycisków (nie dotyczy BTN3), przy założeniu, że po naciśnięciu przycisku, styki przycisku mogą drgać przez czas do 50 ms.
