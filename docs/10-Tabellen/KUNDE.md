---
type: Entität
title: KUNDE
description: Kundenstamm — je Kundennummer ein Datensatz mit Verweisen auf Rechnungs- und Lieferadresse; seit 2026-08-14 zusätzlich Krankenkassen-/Arztfelder für die Rezeptabrechnung.
tags: [tabelle, kunde, stammdaten]
timestamp: 2026-08-14
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
| Anlagedatum | datetime | yes | Vermutlich Erstanlage des Kunden |
| KundennrKK | nvarchar(15) | yes | Vermutlich Kundennummer der für diesen Kunden hinterlegten Standard-Krankenkasse. Dass Krankenkassen als eigene `KUNDE`-Datensätze geführt werden, ist über [REZ_ABRECH](<REZ_ABRECH.md>).`Kundennrkk` (registrierte FK auf `KUNDE`) bestätigt — dieses Feld selbst (`KUNDE.KundennrKK`) hat aber keine eigene registrierte Relation |
| Lanr | nvarchar(150) | yes | Lebenslange Arztnummer; vermutlich der Standardwert für Kunden mit nur einem Arzt/einer Betriebsstätte — bei mehreren siehe [KUNDE_UNTERKONTO](<KUNDE_UNTERKONTO.md>) |
| Kostentraegerkennung | nvarchar(150) | yes | Kennung des Kostenträgers; Verhältnis zu `KundennrKK` ungeklärt (unterschiedliche Kennungssysteme?) |
| Klinikverbund | nvarchar(50) | yes | Zugehörigkeit zu einem Klinikverbund, falls zutreffend |
| Betriebsnummer | nvarchar(150) | yes | Betriebsstättennummer (BSNR); vermutlich Standardwert analog zu `Lanr`, siehe [KUNDE_UNTERKONTO](<KUNDE_UNTERKONTO.md>) |
| Kv | nvarchar(5) | yes | Vermutlich Kürzel der zuständigen Kassenärztlichen Vereinigung |

**Anmerkung:** Die Anmerkungsspalte enthält Interpretationen aus den Feldnamen und ist
zu bestätigen. Die sechs zuletzt genannten Felder (`KundennrKK` bis `Kv`) wurden am
2026-08-14 zusammen mit der Rezeptabrechnungs-Domäne ergänzt und dort auch fachlich
eingeordnet — siehe [REZ](<REZ.md>) und [KUNDE_UNTERKONTO](<KUNDE_UNTERKONTO.md>).

# Beziehungen

| Name | Kardinalität | Ziel | Mapping |
|------|--------------|------|---------|
| KUNDE_BUCH_UMSATZ_Kundennr | many | [BUCH_UMSATZ](<BUCH_UMSATZ.md>) | `Kundennr : Kundennr` |
| KUNDE_ADRESSEN_Rgadrid | one | [ADRESSEN](<ADRESSEN.md>) | `Rgadrid : Id` |
| KUNDE_ADRESSEN_Lieferadrid | one | [ADRESSEN](<ADRESSEN.md>) | `Lieferadrid : Id` |
| KUNDE_VERTR_Vertrnr | one | [VERTR](<VERTR.md>) | `Vertrnr : Vertrnr` |
| KUNDE_KUNDE_GRP1_Grp1 | one | [KUNDE_GRP1](<KUNDE_GRP1.md>) | `Grp1 : Grp1` |
| KUNDE_KUNDE_GRP2_Grp2 | one | [KUNDE_GRP2](<KUNDE_GRP2.md>) | `Grp2 : Grp2` |

## Eingehende Beziehungen

Zahlreiche Tabellen referenzieren `KUNDE` über eine bei sich selbst registrierte
Relation (nicht in obiger Tabelle enthalten, da dort nur die von `KUNDE` aus
deklarierten Relationen stehen):

[PROJEKT](<PROJEKT.md>) (`Kundennr`), [WFLOW](<WFLOW.md>) (transitiv über
`PROJEKT`), [REZ](<REZ.md>) (`Kundennr`), [REZ_ABRECH](<REZ_ABRECH.md>)
(`Kundennr` **und** `Kundennrkk` — bestätigt, dass Krankenkassen als eigene
`KUNDE`-Datensätze geführt werden), [REZ_POS](<REZ_POS.md>) (`Kundennr`) und
[KUNDE_UNTERKONTO](<KUNDE_UNTERKONTO.md>) (`Kundennr`).

# Citations

- `../../raw/dab_registry.md`
