#import "../../Daten.typ": *

// ---------------------------------------------------------------------------
// Erklärung zur Nutzung von KI-Werkzeugen
//
// TODO: Wortlaut und Umfang mit der betreuenden Person und der aktuell
// gueltigen Pruefungsordnung abgleichen. Einige Fakultaeten geben ein eigenes
// Formular vor, das dann anstelle dieser Seite verwendet wird.
//
// Die gesamte Erklaerung laesst sich in main.typ ueber die zugehoerige
// #include-Zeile ein- und ausblenden.
// ---------------------------------------------------------------------------

// --- Schalter -------------------------------------------------------------
// true  = die Tabelle der eingesetzten Werkzeuge wird gezeigt
// false = die Tabelle entfaellt ersatzlos
// Manche Betreuende verlangen die Tabelle, andere nicht.
#let zeige-werkzeugtabelle = true

// --- Hilfsfunktionen ------------------------------------------------------
// Ankreuzfeld fuer die Liste weiter unten. Der Schalter an: steuert, ob das
// Kaestchen bereits im PDF angekreuzt wird:
//   #ankreuzfeld(an: true)[...]   Kaestchen mit Kreuz
//   #ankreuzfeld(an: false)[...]  leeres Kaestchen, per Hand anzukreuzen
#let kasten(an: false) = box(
  width: 3mm,
  height: 3mm,
  baseline: 0.3mm,
  stroke: 0.6pt,
  inset: 0pt,
)[
  #if an [#align(center + horizon, text(size: 10pt, weight: "bold")[#sym.times])]
]

#let ankreuzfeld(inhalt, an: false) = [
  #kasten(an: an) #h(2mm) #inhalt
]

// Ausfuellbare Linie fuer handschriftliche Eintraege
#let linie(breite) = box(
  width: breite,
  baseline: 0pt,
  stroke: (bottom: 0.5pt),
  outset: (bottom: 3pt),
)[]

// --- Erklärung ------------------------------------------------------------
#text(size: 18pt, weight: "bold")[Erklärung zur Nutzung von KI-Werkzeugen]

#v(0.8em)

Ich versichere, dass ich die vorliegende Arbeit selbstständig verfasst und alle Stellen, die wörtlich oder sinngemäß aus fremden Quellen übernommen wurden, als solche kenntlich gemacht habe. Sofern ich KI-basierte Werkzeuge genutzt habe, wurde deren Umfang vorab mit meiner Betreuerin oder meinem Betreuer abgestimmt. Die Verantwortung für Auswahl, Prüfung und inhaltliche Korrektheit aller übernommenen Ergebnisse trage ich vollständig selbst.

#v(0.8em)

Ich habe KI-Werkzeuge für folgende Zwecke eingesetzt (Zutreffendes ankreuzen):

#v(0.4em)

// TODO: Zutreffende Felder auf an: true setzen. Wer die Erklaerung lieber
// handschriftlich ausfuellt, laesst ueberall an: false stehen.
#block(inset: (left: 2mm))[
  #set par(justify: false, leading: 0.65em)
  #ankreuzfeld(an: true)[Keine Nutzung von KI-Werkzeugen]

  #ankreuzfeld(an: false)[Rechtschreibung, Grammatik und sprachliche Überarbeitung]

  #ankreuzfeld(an: false)[Übersetzung von Texten]

  #ankreuzfeld(an: false)[Literaturrecherche und Recherche-Unterstützung]

  #ankreuzfeld(an: false)[Ideenfindung, Gliederung, Strukturierung]

  #ankreuzfeld(an: false)[Unterstützung bei der Softwareentwicklung (Code-Generierung, Debugging)]

  #ankreuzfeld(an: false)[Erstellung von Abbildungen, Diagrammen oder Datenvisualisierungen]

  #ankreuzfeld(an: false)[Generierung von Textpassagen]

  #ankreuzfeld(an: false)[Sonstiges: #linie(8cm)]
]

#v(1em)

#if zeige-werkzeugtabelle [
  Verwendete Werkzeuge:

  #v(0.4em)

  // TODO: Beispielzeile durch die tatsaechlich eingesetzten Werkzeuge
  // ersetzen und nicht benoetigte Leerzeilen entfernen.
  #table(
    columns: (auto, auto, 1fr, auto),
    align: (left, left, left, left),
    inset: 6pt,
    stroke: 0.5pt + luma(60%),

    table.header(
      [*Werkzeug*], [*Version/Stand*], [*Zweck*], [*Eingesetzt in*],
    ),

    [z. B. ChatGPT], [GPT-5, 09/2026], [Debugging von Python-Code], [Kap. 4],
    [], [], [], [],
    [], [], [], [],
    [], [], [], [],
  )
]

#v(2.5em)

// Im Blocksatz wuerde die Zeile auseinandergezogen, daher als Raster gesetzt.
#grid(
  columns: (1fr, 1fr),
  gutter: 1cm,
  [Ort, Datum: #linie(4.5cm)],
  [Unterschrift: #linie(4.5cm)],
)
