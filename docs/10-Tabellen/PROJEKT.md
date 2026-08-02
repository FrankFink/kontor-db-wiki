---
type: Entität
title: PROJEKT
description: Projektstamm mit Kundenbezug, Vertrags- und Preisangaben; Rgadrid/Lieferadrid hier untypisiert als bigint.
tags: [tabelle, projekt, vertrieb]
timestamp: 2026-08-02
---

Tabelle `dbo.PROJEKT` — ein Datensatz je Projekt, mit Kundenbezug, Vertrags- und
Kalkulationsangaben.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Projektnr` (`nvarchar(50)`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Projektnr | nvarchar(50) | no | PK |
| Bearb | nvarchar(5) | yes | Kürzel des Bearbeiters |
| Projektdatum | datetime | yes | |
| Projektname | nvarchar(150) | yes | |
| Kundennr | nvarchar(15) | yes | FK auf [KUNDE](<KUNDE.md>).`Kundennr` |
| Suchbegriff | nvarchar(30) | yes | |
| Hinweistext | ntext(1073741823) | yes | |
| VertragReg | ntext(1073741823) | yes | |
| Info1 | nvarchar(80) | yes | |
| Info2 | nvarchar(80) | yes | |
| Info3 | nvarchar(80) | yes | |
| Info4 | nvarchar(80) | yes | |
| KennWaehrung | nvarchar(5) | yes | Währungskennzeichen |
| Projektreferenz | nvarchar(60) | yes | |
| LVImport | bit | yes | Vermutlich Import aus Leistungsverzeichnis |
| Rgadrid | bigint | yes | Rechnungsadresse — **Typ weicht ab**, siehe Anmerkung unten |
| Lieferadrid | bigint | yes | Lieferadresse — **Typ weicht ab**, siehe Anmerkung unten |
| Kw | nvarchar(10) | yes | Vermutlich Kalenderwoche |
| Lager | smallint | yes | |
| Preistabelle | nvarchar(3) | yes | |
| Sprcode | nvarchar(3) | yes | Sprachcode |
| Rglistmode | bit | yes | |
| Mwst | decimal | yes | |
| Posnumstep | int | yes | Schrittweite der Positionsnummerierung |
| Style | nvarchar(200) | yes | |
| Groupname | nvarchar(50) | yes | |

**Anmerkung — Typabweichung bei Rgadrid/Lieferadrid:** In [ADRESSEN](<ADRESSEN.md>)
ist `Id` ein `uniqueidentifier`, in [KUNDE](<KUNDE.md>) sind `Rgadrid`/`Lieferadrid`
entsprechend `uniqueidentifier`. In `PROJEKT` sind die gleichnamigen Felder dagegen
`bigint`. Ob sie trotz des Namens dieselbe Adresszuordnung meinen (dann wäre der
Datentyp inkonsistent oder es gibt eine zweite, ältere Adressstruktur) oder etwas
anderes referenzieren, ist ungeklärt.

# Beziehungen

| Name | Kardinalität | Ziel | Mapping |
|------|--------------|------|---------|
| PROJEKT_KUNDE_Kundennr | one | [KUNDE](<KUNDE.md>) | `Kundennr : Kundennr` |

[WFLOW](<WFLOW.md>) referenziert diese Tabelle über die registrierte Relation
`WFLOW_PROJEKT_Projektnr` (`Projektnr : Projektnr`): eine Aufgabe wird stets über
ihr Projekt einem Kunden zugeordnet (Aufgabe → Projekt → Kunde), und beide Schritte
sind jetzt als DAB-Relation deklariert.

# Citations

- `../../raw/dab_registry.md`
- `../../raw/# Tabellen der Aufgabenverwaltung W.md`
