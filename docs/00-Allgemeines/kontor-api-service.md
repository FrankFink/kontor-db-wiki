---
type: Integration
title: Kontor API Service
description: Zugriff auf die Kontor Datenbank über eine DAB-Instanz (REST + GraphQL).
tags: [api, dab, integration]
timestamp: 2026-08-01
---

Der **Kontor API Service** stellt lesenden und schreibenden Zugriff auf ausgewählte
Objekte der [Kontor Datenbank](<datenbank-ueberblick.md>) über HTTP bereit. Er ist auf
Basis des Microsoft **Data API Builder** (DAB) umgesetzt.

# Schema

## Registrierte Entitäten

Welche Tabellen und Views durch den Service exponiert werden, steht in der
DAB-Registry. Aktuell registriert sind 15 Tabellen aus dem Schema `dbo`:
Kernentitäten (`ADRESSEN`, `ARTIK`, `BUCH_UMSATZ`, `KUNDE`, `PROJEKT`), Codetabellen
(`ARTIK_WG1`, `ARTIK_WG2`, `ARTIK_KATWERTE`, `KUNDE_GRP1`, `KUNDE_GRP2`, `VERTR`)
und ein CRM-Bereich (`CRM_LEAD`, `CRM_ACTIVITIES`, `CRM_LEAD_CONFIG`,
`CRM_PROMPT_TEMPLATE`). Der aktuelle Stand liegt als Rohquelle unter
`../../raw/dab_registry.md`.

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
