---
type: Integration
title: Kontor API Service
description: Zugriff auf die Kontor Datenbank über eine DAB-Instanz (REST + GraphQL).
tags: [api, dab, integration]
timestamp: 2026-08-15
---

Der **Kontor API Service** stellt lesenden und schreibenden Zugriff auf ausgewählte
Objekte der [Kontor Datenbank](<datenbank-ueberblick.md>) über HTTP bereit. Er ist auf
Basis des Microsoft **Data API Builder** (DAB) umgesetzt.

# Schema

## Registrierte Entitäten

Welche Tabellen, Views und Prozeduren durch den Service exponiert werden, steht in
der DAB-Registry. Aktuell registriert sind 27 Objekte aus dem Schema `dbo`:
Kernentitäten (`ADRESSEN`, `ARTIK`, `BUCH_UMSATZ`, `KUNDE`, `PROJEKT`, `_FIRMA`),
Codetabellen (`ARTIK_WG1`, `ARTIK_WG2`, `ARTIK_KATWERTE`, `KUNDE_GRP1`,
`KUNDE_GRP2`, `VERTR`), ein CRM-Bereich (`CRM_LEAD`, `CRM_ACTIVITIES`,
`CRM_PROMPT_TEMPLATE`), `KONTAKTE`, die Aufgabenverwaltung (`WFLOW`,
`WFLOW_FOLDERS`, `WFLOW_INVOICINGUNIT`), die Rezeptabrechnung (`REZ`, `REZ_POS`,
`REZ_ABRECH`, `REZ_ABRECH_POS`, `REZ_ABRECHNUNGSSTELLE`, `KUNDE_UNTERKONTO`)
sowie zwei Objekte der API-Infrastruktur selbst: die Metadaten-Tabelle
[SYS_DAB_METADATA](<SYS_DAB_METADATA.md>) und die gespeicherte Prozedur
[kon_dab_checkentityvalue](<kon_dab_checkentityvalue.md>). Der aktuelle Stand
liegt als Rohquelle unter `../../raw/dab_registry.md`.

Die Rezeptabrechnungs-Tabellen wurden zwischen dem 2026-08-14 und 2026-08-15
mehrfach nachexportiert, mit teils erheblichen Schema-Erweiterungen und
zwischenzeitlich einer schwankenden Beziehung (registriert → verschwunden →
wieder registriert). Seit dem Export vom 2026-08-15 (15:41) ist der Stand
stabil und vollständig verknüpft — siehe [10-Tabellen](<../10-Tabellen/index.md>),
Abschnitt „Rezeptabrechnung", für die Entwicklungshistorie.

`CRM_LEAD_CONFIG` war bis zum Export vom 2026-08-02 registriert und fehlt seit
2026-08-14 — die Registry ist damit nicht monoton wachsend, Entitäten können auch
wieder verschwinden. Die Wiki-Seite bleibt als historische Referenz erhalten
(siehe [CRM_LEAD_CONFIG](<../10-Tabellen/CRM_LEAD_CONFIG.md>)).

## Nicht jede Entität ist eine Tabelle

Bislang waren alle registrierten Objekte Tabellen. Seit dem Export vom 2026-08-10
taucht mit `kon_dab_checkentityvalue` erstmals eine **gespeicherte Prozedur** in der
Registry auf — DAB kann offenbar auch Prozeduren als aufrufbare Entität exponieren,
nicht nur Datentabellen. Für Prozeduren listet die Registry weder Felder noch
Beziehungen.

## Selbstbeschreibung über SYS_DAB_METADATA

[SYS_DAB_METADATA](<SYS_DAB_METADATA.md>) beschreibt Felder anderer Entitäten
(Label, Pflichtfeld, Lookup-Ziel, Prüfroutine) und wirkt wie eine
Metadatenschicht, die vermutlich UI-Generierung und Feldvalidierung im Kontor API
Service steuert — unabhängig vom Fachschema der einzelnen Tabellen.

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
