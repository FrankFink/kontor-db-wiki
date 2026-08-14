---
type: Integration
title: kon_dab_checkentityvalue
description: Gespeicherte Prozedur im Kontor API Service zur serverseitigen Prüfung von Feldwerten; erster registrierte DAB-Objekttyp, der keine Tabelle ist.
tags: [dab, api, stored-procedure, validierung]
timestamp: 2026-08-10
---

`dbo.kon_dab_checkentityvalue` — eine über den [Kontor API Service](<kontor-api-service.md>)
registrierte **gespeicherte Prozedur**, nicht Tabelle. Erstes Beispiel eines
DAB-Objekts, das nicht der bisherigen Struktur „eine Seite je Tabelle" folgt.

# Schema

Die Registry listet für gespeicherte Prozeduren keine Felder (`_No fields listed in
registry._`) und keine Beziehungen. Name und Kontext legen nahe, dass sie einen
einzelnen Wert gegen eine Entität/ein Feld prüft — passend zum Feld `Hasproccheck` in
[SYS_DAB_METADATA](<SYS_DAB_METADATA.md>).

**Ungeklärt:** Parameter und Rückgabewert der Prozedur; ob sie von DAB automatisch
beim Schreiben aufgerufen wird oder vom Client explizit angestoßen werden muss;
Beziehung zu `SYS_DAB_METADATA.Hasproccheck` ist eine Vermutung, keine belegte
Tatsache.

# Beziehungen

Keine in der Registry deklariert. Der vermutete fachliche Zusammenhang mit
[SYS_DAB_METADATA](<SYS_DAB_METADATA.md>) läuft nicht über ein Feld dieser Prozedur
(sie hat keine gelisteten Felder), sondern nur über die Namensähnlichkeit und das
Feld `Hasproccheck` dort.

# Citations

- `../../raw/dab_registry.md`
