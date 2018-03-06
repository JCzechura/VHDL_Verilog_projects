# Simple time measurement 


Układ stopera mierzy czas z dokładnością do setnych części sekundy. Kolejne naciśnięcia przycisku BTN0 wywołują następujące działanie: 

...START->STOP->RESET->START...

Czas wyświelany jest na wyświetlaczu LED w postaci: SS.DD, gdzie: SS=sekundy, DD=setne części sekundy. Przekroczenie czasu 59.99 sekund zasygnalizowano wyświetleniem specjalnego symbolu oznaczającego przepełnienie, np. ("--.--").

Przycisk BTN3 to dodatkowy reset asynchroniczny.

Układ zabezpieczono przed drganiami przycisku, przy założeniu, że po naciśnięciu przycisku, styki przycisku mogą drgać przez czas aż do 50 ms.
