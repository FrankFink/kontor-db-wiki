---
type: Entität
title: REZ_ABRECH
description: Erzeugte Abrechnungen der Rezeptabrechnung — ein Datensatz je Abrechnung.
tags: [tabelle, rezeptabrechnung, plugin]
timestamp: 2026-08-14
---

Tabelle `dbo.REZ_ABRECH` — enthält die erzeugten Abrechnungen. Für jede Abrechnung
wird ein eigener Datensatz mit eindeutiger `Abrechnungsid` angelegt.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Abrechnungsid` (`uniqueidentifier`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Abrechnungsid | uniqueidentifier | no | PK; Default vermutlich `newid()` |
| Kundennr | nvarchar(15) | yes | FK auf [KUNDE](<KUNDE.md>).`Kundennr` — Kunde, für den abgerechnet wurde (registriert) |
| Kundennrkk | nvarchar(15) | yes | FK auf [KUNDE](<KUNDE.md>).`Kundennr` — Krankenkasse (registriert). **Bestätigt** damit, dass Krankenkassen als eigene `KUNDE`-Datensätze geführt werden, vgl. [REZ](<REZ.md>).`Kundennrkk` (dort nicht registriert) |
| Datum | datetime | yes | Erstellungsdatum der Abrechnung |
| Userid | nvarchar(3) | yes | Benutzer-ID des Erstellers |
| Abrechnungsstelle | nvarchar(50) | yes | Kennung der Abrechnungsstelle, über die abgewickelt wird |

# Beziehungen

| Name | Kardinalität | Ziel | Mapping |
|------|--------------|------|---------|
| REZ_ABRECH_KUNDE_Kundennr | one | [KUNDE](<KUNDE.md>) | `Kundennr : Kundennr` |
| REZ_ABRECH_KUNDE_Kundennrkk | one | [KUNDE](<KUNDE.md>) | `Kundennrkk : Kundennr` |

Beide seit dem Registry-Export vom 2026-08-14 (10:46) registriert.

[REZ_POS](<REZ_POS.md>) referenziert diese Tabelle über die registrierte Relation
`REZ_POS_REZ_ABRECH_Abrechungsid` (`Abrechungsid : Abrechnungsid`).
[REZ_ABRECH_POS](<REZ_ABRECH_POS.md>) referenziert diese Tabelle ebenfalls über
eine registrierte Relation (`Abrechungsid : Abrechnungsid`, seit 10:52).

# Citations

- `../../raw/dab_registry.md`
- `../../raw/# Wichtige Datenbanktabellen rezeptabrechnungs-plugin.md`
