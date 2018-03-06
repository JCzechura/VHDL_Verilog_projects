# Advanced Encryption Standard (AES) testbench

Testbench w języku VHDL do testowania układu szyfrującego, którego kod źródłowy dostępny był na potrzeby zajęć laboratoryjnych. Testbench odczytuje sygnały pobudzające z pliku tekstowego z wykorzystaniem biblioteki std_logic_textio. Tak przetestowany układ zrealozowano następnie z wykorzystaniem układu FPGA, poprzez osadzenie go w module, który na stale generuje klucz. Zamiast 128 bitów sygnału data_i podano 8 najmłodszych bitów z przełączników SW7-SW0, pozostałe bity należy wypełnić zerami.
