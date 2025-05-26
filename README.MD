# Sterowanie bramą wjazdową

## Opis projektu
Tematem projektu jest system do sterowania bramą wjazdową w garażu podziemnym.
Brama wjazdowa zbudowana z segmentów podnosi się do góry po łukowatych prowadnicach i zatrzymuje na suficie,
a następnie opuszcza w dół po tym samym torze. Do sterowania bramą wykorzystywany jest
terminal umieszczony na ścianie obok oraz pilot do zdalnego sterowania.

## Opis dla użytkownika
Użytkownik posiada pilot z jednym przyciskiem. Po zbliżeniu się odpowiednio blisko do bramy,
naciska przycisk, a brama się otwiera. Użytkownik wchodzi/wjeżdża do środka, a następnie ponownie
wciska przycisk, a brama się zamyka. Alternatywnie po wejsciu/wjechaniu do garażu podchodzi do terminalu
i naciska przycisk, co również opuszcza bramę. Wciśnięcie przycisku podczas procesu opuszczania/podnoszenia
bramy skutkuje przerwaniem operacji i zatrzymaniem bramy w miejscu.

## Model

![Model](model.png)


## Spis komponentów AADL

### Devices

- **engine_device**  
  Urządzenie silnika, odbiera akcje i raportuje stan silnika.

- **engine_controller_device**  
  Kontroler silnika, odbiera status przełączników i steruje silnikiem.

- **limit_switch_device**  
  Urządzenie przełącznika krańcowego (górny i dolny).

- **button_device**  
  Urządzenie przycisku (up/down) dla terminala i pilota.

- **lcd_display_device**  
  Urządzenie wyświetlacza LCD, pokazuje stan silnika.

- **terminal_controller_device**  
  Kontroler terminala, zbiera sygnały przycisków i steruje silnikiem oraz wyświetlaczem, obsługuje komunikację radiową.

- **remote_controller_device**  
  Kontroler zdalny, obsługuje przyciski i wysyła polecenia radiowo.

---

### Processes

- **gate_process**  
  Proces bramy, łączy wątki urządzeń silnika, przełączników i kontrolera.

- **terminal_process**  
  Proces terminala, obsługuje wątki przycisków, LCD i kontrolera terminala.

- **remote_controller_process**  
  Proces pilota zdalnego, obsługuje wątki przycisków i kontrolera pilota.

---

### Threads

- **engine_thread**  
  Wątek silnika, realizuje fizyczną pracę silnika.

- **engine_controller_thread**  
  Wątek kontrolera silnika, podejmuje decyzje na podstawie przełączników i komend.

- **limit_switch_thread**  
  Wątek obsługi przełączników krańcowych.

- **button_thread**  
  Wątek obsługi przycisków (występuje w terminal i pilot).

- **lcd_display_thread**  
  Wątek obsługi wyświetlacza LCD.

- **terminal_controller_thread**  
  Wątek sterujący terminalem.

- **remote_controller_thread**  
  Wątek sterujący pilotem zdalnym.

---

### Data Types

- **EngineState** (running, idle)  
  Stan pracy silnika.

- **EngineAction** (up, down, stop)  
  Komendy sterujące silnikiem.


## Analiza

POjawi się wraz z rozwojem projektu

## Komponenty

### Brama
- Silnik
- Sterownik silnika
- Czujniki krańcowe

### Terminal
- Odbiornik radiowy
- Wyświetlacz LCD do terminala
- Przysicki do terminala
- kontroler terminala

### Pilot
- Nadajnik radiowy
- przyciski
- kontroler pilota

## Autor
Jakub Frączek
## Adres email
 jakubfraczek@student.agh.edu.pl
