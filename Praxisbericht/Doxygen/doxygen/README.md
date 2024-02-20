# NewTec Dokumentation

Willkommen auf der Code Dokumentationsseite für die NewTec !!

## Inhaltsverzeichnis

- [Übersicht](#übersicht)
- [Funktionen](#funktionen)
- [Konfiguration](#konfiguration)
- [Demo](#demo)

## Übersicht
Willkommen zur Code-Dokumentationsseite der NewTec GmbH!

Unser Projekt, das Code-Dokumentationstool der NewTec GmbH, ist eine Anwendung, die auf Grundlage von Doxygen weiterentwickelt wurde, um Entwicklern und Teams bei der Erstellung und Verwaltung von hochwertiger Code-Dokumentation zu helfen. Mit diesem Tool können Sie mühelos Ihre Code-Basis dokumentieren, um die Wartbarkeit, Zusammenarbeit und Nachvollziehbarkeit Ihrer Softwareprojekte zu verbessern.


## Funktionen

- Die Dokumentation ist in NewTec-Farben gestaltet
- Dark-/Lightmode verfügbar
- Sie können enthaltene Codefragmente kopieren.
- Sie können jede Klasse, Methode oder Funktion im Projekt mit der Suchleiste finden
- In der Suchleiste haben Sie die Möglichkeit zwischen diesen drei zu filtern
- Möglichkeit zur Einbindung von farblich hervorgehobenen Paragraphen

## Konfiguration

Um die Dokumentation auf Ihr persönliches Projekt zu personalisieren können Sie einfach, insofern Sie sich im entsprechenden Verzeichnis befinden, in Ihrer Kommandozeile den Befehl : 
./config.sh ausführen. Daraufhin werden Sie aufgefordert 
den Projektnamen sowie die Projektnummer einzugeben, bestätigen Sie beide Eingaben mit Enter und Ihr Projekt ist nun personalisiert. Eine weitere Möglichkeit besteht darin die enstprechenden Zeilen im Doxyfile per Hand zu ändern.

## Demo
### Kopier und Bearbeitungs Beispiel
```html
Dieser Text kann mittels der Button ganz rechts kopiert und bearbeitet werden!
```
### Besondere Hinweise 
#### 1. Notes
@note Diese Klasse wurde zu Demo Zwecken erstellt.
@code int var = 0; @endcode
Hiermit können Sie Notizen erstellen als Hinweise oder Erklärungen zu den dargestellten Funktionen.
@note

<details>
  <summary>Click to reveal source code</summary>

  ```
@note Diese Klasse wurde zu Demo Zwecken erstellt.
@code int var = 0; @endcode
Hiermit können sie Notizen erstellen als Hinweise oder Erklärungen zu den dargestellten Funktionen.
@note
  ```

#### 2. Warnings
@warning Hiermit können Sie auf potentielle Probleme und Fehler hinweisen! 

<details>
  <summary>Click to reveal source code</summary>

  ```
 @warning Hiermit können Sie auf potentielle Probleme und Fehler hinweisen!
  ```
    
#### 3. Deprecated
@deprecated Dieser Abschnitt weist auf veraltete Funktionen hin.

<details>
  <summary>Click to reveal source code</summary>

  ```
  @deprecated Dieser Abschnitt weist auf veraltete Funktionen hin.
  ```


#### 4. Bug
@bug Die ist ein Beispiel Bug.

<details>
  <summary>Click to reveal source code</summary>

  ```
  @bug Dies ist ein Beispiel Bug.
  ```


#### 5. Unveränderlich
@invariant Dies ist eine unveränderliche Größe.

<details>
  <summary>Click to reveal source code</summary>

  ```
  @invariant Dies ist eine unveränderliche Größe.
  ```


#### 6. Bedingung
@pre Dies ist eine Bedingung vor der Ausführung des Codes.

<details>
  <summary>Click to reveal source code</summary>

  ```
 @pre Dies ist eine Bedingung vor der Ausführung des Codes.
  ```

#### 7. Nachbedingung
@post Dies eine Bedinung nach der Ausführung des Codes.

<details>
  <summary>Click to reveal source code</summary>

  ```
 @post Dies eine Bedinung nach der Ausführung des Codes.
  ```

#### 8. Zu erledigen
@todo Weitere zu bearbeitende Themen.

<details>
  <summary>Click to reveal source code</summary>

  ```
 @todo Weiter zu bearbeitende Themen
  ```

#### 9. Bemerkungen
@remark Viel Spaß mit dem Theme.

<details>
  <summary>Click to reveal source code</summary>

  ```
  @remark Viel Spaß mit dem Theme
  ```

#### 10. Verzeichnis
<table>
  <tr>
    <th>Autor</th>
    <th>Versionsnummer</th>
  </tr>
  <tr>
    <td>Nicolas Pawelka, Stephan Karl, Thomas Mösl</td>
    <td>1.0</td>
  </tr>
</table>
