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
- **engine_controller_device**  
- **limit_switch_device**

---

### Processes

- **engine_process**  
- **engine_controller_process**  
- **limit_switch_process**

---

### Threads

- **engine_thread**  
- **engine_controller_thread**  
- **limit_switch_thread**

---

### Data Types

- **EngineState** (running, idle)  
- **EngineAction** (up, down, stop)

## Analiza

POjawi się wraz z rozwojem projektu

## Komponenty

### Brama
- Silnik
- Sterownik silnika
- Czujniki krańcowe
- zasilanie

### Terminal
- Odbiornik radiowy
- Wyświetlacz LCD do terminala
- Przysicki do terminala
- kontroler
- zasilanie

### Pilot
- Nadajnik radiowy
- przycisk
- kontroler
- bateria

## Autor
Jakub Frączek
## Adres email
 jakubfraczek@student.agh.edu.pl
