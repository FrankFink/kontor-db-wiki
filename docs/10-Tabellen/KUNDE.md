---
type: Entität
title: KUNDE
description: Kundenstamm — je Kundennummer ein Datensatz mit Verweisen auf Rechnungs- und Lieferadresse.
tags: [tabelle, kunde, stammdaten]
timestamp: 2026-07-30
---

Tabelle `dbo.KUNDE` — Kundenstamm. Ein Datensatz pro Kundennummer. Verweist über zwei
Fremdschlüssel auf [ADRESSEN](<ADRESSEN.md>) (Rechnungs- und Lieferadresse).

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Kundennr` (`nvarchar(15)`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Kundennr | nvarchar(15) | no | Kundennummer, PK |
| Suchbegriff | nvarchar(150) | yes | |
| Name1 | nvarchar(200) | yes | Kundenname |
| Grp1 | nvarchar(3) | yes | Kundengruppe (Ebene 1) |
| Grp2 | nvarchar(9) | yes | Kundengruppe (Ebene 2) |
| Rgadrid | uniqueidentifier | yes | FK auf `ADRESSEN.Id` — Rechnungsadresse |
| Lieferadrid | uniqueidentifier | yes | FK auf `ADRESSEN.Id` — Lieferadresse |
| Bestland | nvarchar(3) | yes | |

**Anmerkung:** Die Anmerkungsspalte enthält Interpretationen aus den Feldnamen und ist
zu bestätigen.

# Beziehungen

| Name | Kardinalität | Ziel | Mapping |
|------|--------------|------|---------|
| KUNDE_BUCH_UMSATZ_Kundennr | many | [BUCH_UMSATZ](<BUCH_UMSATZ.md>) | `Kundennr : Kundennr` |
| KUNDE_ADRESSEN_Rgadrid | one | [ADRESSEN](<ADRESSEN.md>) | `Rgadrid : Id` |
| KUNDE_ADRESSEN_Lieferadrid | one | [ADRESSEN](<ADRESSEN.md>) | `Lieferadrid : Id` |

# Citations

- `../../raw/dab_registry.md`
