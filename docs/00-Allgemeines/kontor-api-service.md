---
type: Integration
title: Kontor API Service
description: Zugriff auf die Kontor Datenbank über eine DAB-Instanz (REST + GraphQL).
tags: [api, dab, integration]
timestamp: 2026-07-30
---

Der **Kontor API Service** stellt lesenden und schreibenden Zugriff auf ausgewählte
Objekte der [Kontor Datenbank](<datenbank-ueberblick.md>) über HTTP bereit. Er ist auf
Basis des Microsoft **Data API Builder** (DAB) umgesetzt.

# Schema

## Registrierte Entitäten

Welche Tabellen und Views durch den Service exponiert werden, steht in der
DAB-Registry. Aktuell registriert sind vier Tabellen aus dem Schema `dbo`:
`ADRESSEN`, `ARTIK`, `BUCH_UMSATZ`, `KUNDE`. Der aktuelle Stand liegt als Rohquelle
unter `../../raw/dab_registry.md`.

## Zwei Schnittstellen: REST und GraphQL

DAB bietet je Entität sowohl einen REST- als auch einen GraphQL-Endpunkt.
Für die Praxis relevant:

- **REST** liefert immer nur die Felder *einer* Entität. Beziehungen werden nicht
  aufgelöst; verwandte Datensätze müssen in separaten Requests geholt werden.
- **GraphQL** löst die in der Registry deklarierten Beziehungen auf. Wer z. B. Kunde
  samt Rechnungsadresse in einer Abfrage braucht, muss GraphQL nutzen.

## Beziehungen sind Registry-Konfiguration, nicht DB-Fremdschlüssel

Die Kardinalitäten (`one`/`many`) und Feld-Mappings stehen in der DAB-Registry. Ob es
in der Datenbank selbst passende Fremdschlüssel-Constraints gibt, sagt die Registry
nicht aus.

# Verwendung

Der Service ist die empfohlene Zugriffsschicht für alle Integrationen, die nicht
direkt am SQL-Server hängen.

# Citations

- `../../raw/dab_registry.md`
- [Microsoft Data API Builder](https://learn.microsoft.com/azure/data-api-builder/) — Herstellerdoku (extern)
