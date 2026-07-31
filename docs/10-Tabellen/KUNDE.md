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
| Grp1 | nvarchar(3) | yes | Kundengruppe (Ebene 1), FK auf [KUNDE_GRP1](<KUNDE_GRP1.md>) |
| Grp2 | nvarchar(9) | yes | Kundengruppe (Ebene 2), FK auf [KUNDE_GRP2](<KUNDE_GRP2.md>) |
| Rgadrid | uniqueidentifier | yes | FK auf `ADRESSEN.Id` — Rechnungsadresse |
| Lieferadrid | uniqueidentifier | yes | FK auf `ADRESSEN.Id` — Lieferadresse |
| Bestland | nvarchar(3) | yes | |
| Vertrnr | nvarchar(13) | yes | FK auf [VERTR](<VERTR.md>).`Vertrnr` — zugeordneter Vertreter |

**Anmerkung:** Die Anmerkungsspalte enthält Interpretationen aus den Feldnamen und ist
zu bestätigen.

# Beziehungen

| Name | Kardinalität | Ziel | Mapping |
|------|--------------|------|---------|
| KUNDE_BUCH_UMSATZ_Kundennr | many | [BUCH_UMSATZ](<BUCH_UMSATZ.md>) | `Kundennr : Kundennr` |
| KUNDE_ADRESSEN_Rgadrid | one | [ADRESSEN](<ADRESSEN.md>) | `Rgadrid : Id` |
| KUNDE_ADRESSEN_Lieferadrid | one | [ADRESSEN](<ADRESSEN.md>) | `Lieferadrid : Id` |
| KUNDE_VERTR_Vertrnr | one | [VERTR](<VERTR.md>) | `Vertrnr : Vertrnr` |
| KUNDE_KUNDE_GRP1_Grp1 | one | [KUNDE_GRP1](<KUNDE_GRP1.md>) | `Grp1 : Grp1` |
| KUNDE_KUNDE_GRP2_Grp2 | one | [KUNDE_GRP2](<KUNDE_GRP2.md>) | `Grp2 : Grp2` |

# Citations

- `../../raw/dab_registry.md`
