---
type: Entität
title: ADRESSEN
description: Adressdatensätze (Rechnungs-, Liefer- und weitere Adressen), referenziert von KUNDE.
tags: [tabelle, adressen, stammdaten]
timestamp: 2026-07-30
---

Tabelle `dbo.ADRESSEN` — Adressdatensätze. Wird von [KUNDE](<KUNDE.md>) über
`Rgadrid` (Rechnungsadresse) und `Lieferadrid` (Lieferadresse) referenziert; weitere
Adresstypen sind über `Adresstyp` und `Gruppe` differenzierbar.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Id` (`uniqueidentifier`)

| Feld | Typ | Nullable |
|------|-----|----------|
| Id | uniqueidentifier | no |
| Kdliefnr | nvarchar(15) | yes |
| Adresstyp | nvarchar(3) | yes |
| Gruppe | nvarchar(3) | yes |
| Anrede | nvarchar(200) | yes |
| Vorname | nvarchar(200) | yes |
| Name1 | nvarchar(200) | yes |
| Name2 | nvarchar(200) | yes |
| Name3 | nvarchar(200) | yes |
| Str | nvarchar(200) | yes |
| Plz | nvarchar(15) | yes |
| Ort1 | nvarchar(200) | yes |
| Ort2 | nvarchar(200) | yes |
| Telefon | nvarchar(100) | yes |
| Fax | nvarchar(100) | yes |
| Email | nvarchar(400) | yes |
| Homepage | nvarchar(500) | yes |
| Bemerkungen | nvarchar | yes |
| Bestland | nvarchar(5) | yes |
| Abteilung | nvarchar(500) | yes |
| Mobil | nvarchar(100) | yes |

**Ungeklärt:** genaue Bedeutung von `Kdliefnr`, `Adresstyp`, `Gruppe`, `Bestland`.

# Beziehungen

| Name | Kardinalität | Ziel | Mapping |
|------|--------------|------|---------|
| ADRESSEN_KUNDE_Id | many | [KUNDE](<KUNDE.md>) | `Id : Lieferadrid` |

Zusätzlich referenziert `KUNDE` diese Tabelle über `Rgadrid : Id` — siehe
[KUNDE](<KUNDE.md>).

# Citations

- `../../raw/dab_registry.md`
