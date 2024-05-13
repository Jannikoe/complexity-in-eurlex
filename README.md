Linguistische Komplexität in juristischen Texten - eine crosslinguistische Analyse

1. Beschreibung

Mit dem vorliegenden Projekt möchte ich einen Beitrag zur Debatte in der Linguistik darüber, dass alle Sprachen gleich komplex sind, leisten. 
Anhand einer statistischen Komplexitätsanalyse sollen englische und deutsche Texte juristischer Sprache auf typische Komplexitätsmerkmale überprüft werden.
Hier ist der Python-Code für die Verarbeitung des Korpus MultiEURLEX (https://github.com/nlpaueb/multi-eurlex) zu finden, der die veröffentlichten Verwaltungstexte der Europäischen Union (https://eur-lex.europa.eu/homepage.html) als Datensatz zur Verfügung stellt.
Außerdem ist hier der R-Code zur weiterführenden Analyse verzeichnet.

2. Installation

Zum Laden des Datensatzes ist das datasets-package und pandas notwendig. Hieraus nutze ich die load_dataset-Funktion, um aus dem Dictionary im geladenen Datensatz anschließend einen pandas-dataframe zu erstellen.

3. Nutzung

Den erstellten Datensatz speichere ich mit os durch die Iteration einer for-Schleife als eine Sammlung aus txt-Files für die anschließende Analyse mit der nlp-Pipeline CTAP (). Dies kann für die den gewünschten Sprachen entsprechenden Abschnitte wiederholt werden.

Es folgt eine R-Analyse, die die eingelesenen CSV-Dateien zu handhabbaren Datensätzen mit Columns für die Ergebnisse einzelner Features umwandelt. Nan-Werte werden entfernt und Nummern zu numerics transformiert. Für einen sinnvollen Vergleich der Ergebnisse für verschiedene Sprachen sollen die beiden Datensätze nun auf ihre gemeinsame Schnittmenge analysierbarer Features reduziert werden.

4. Credits



5. Lizenz

