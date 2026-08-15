---
type: Entität
title: ARTIK
description: Artikelstamm — je Artikelnummer ein Datensatz mit Bezeichnungen, Preisen, Lieferantenbezug und Klassifikationen.
tags: [tabelle, artikel, stammdaten]
timestamp: 2026-08-15
---

Tabelle `dbo.ARTIK` — Artikelstamm der Kontor Datenbank. Ein Datensatz pro
Artikelnummer.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Artnr` (`nvarchar(15)`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Artnr | nvarchar(15) | no | interne Artikelnummer, PK |
| Suchbegriff | nvarchar(30) | yes | Kurzsuchbegriff |
| Wg1 | nvarchar(15) | yes | Warengruppe (Ebene 1) |
| Wg2 | nvarchar(15) | yes | Warengruppe (Ebene 2) |
| Bez1 | nvarchar(200) | yes | Bezeichnung 1 |
| Bez2 | nvarchar(500) | yes | Bezeichnung 2 (lang) |
| Ek | money | yes | Einkaufspreis |
| Vk1 | money | yes | Verkaufspreis 1 |
| Vk2 | money | yes | Verkaufspreis 2 |
| Vk3 | money | yes | Verkaufspreis 3 |
| Liefnr | nvarchar(15) | yes | Lieferantennummer |
| Bestellnr | nvarchar(50) | yes | Bestellnummer beim Lieferanten |
| Mindestbestand | bigint | yes | |
| Preiseinheit | int | yes | Bezugsmenge zum Preis |
| Lagerplatz | nvarchar(15) | yes | |
| Artean | nvarchar(15) | yes | EAN/GTIN |
| Artzentralnr | nvarchar(15) | yes | Zentralartikelnummer |
| Webshop | bit | yes | Freigabe für Webshop |
| Rabgr | nvarchar(5) | yes | Rabattgruppe |
| Herstellerartnr | nvarchar(50) | yes | Herstellerartikelnummer |
| Pzn | nvarchar(50) | yes | Pharmazentralnummer |
| HerstellerId | nvarchar(15) | yes | Hersteller-ID (Verweis vermutlich in eigene Herstellertabelle) |
| Katid | nvarchar(50) | yes | FK auf [ARTIK_KATWERTE](<ARTIK_KATWERTE.md>).`Katid` — zugeordnete Kategorie |
| Mwstklasse | nvarchar(15) | no | Mehrwertsteuerklasse, Pflichtfeld; vermutlich Schlüssel „voll"/„ermäßigt" analog zu [_FIRMA](<_FIRMA.md>).`Mwst`/`Mwst2` |
| SSB | nvarchar(50) | yes | Vermutlich Kennzeichen für Sprechstundenbedarf-Fähigkeit des Artikels (siehe Schwesterwiki `Kontor MED v1`) |
| Rezeptbez1 | nvarchar(50) | yes | Bezeichnung des Artikels für den Rezeptdruck/die Rezeptabrechnung |
| Rezeptbez2 | nvarchar(50) | yes | Zweite Bezeichnungszeile für den Rezeptdruck/die Rezeptabrechnung |
| Abda_preisfaktor | decimal | yes | Preisfaktor aus ABDA-Daten (Arzneimittel-Preisdatenbank der Apothekerverbände) |
| Aktiv | bit | yes | Artikel aktiv/deaktiviert (seit 2026-08-15) |

**Anmerkung:** Die Anmerkungsspalte enthält Interpretationen aus den Feldnamen und ist
zu bestätigen. Die fünf zuletzt genannten Felder (`Mwstklasse` bis
`Abda_preisfaktor`) gehören inhaltlich zur Rezeptabrechnungs-/Pharma-Domäne, siehe
[REZ](<REZ.md>) und Umfeld.

# Beziehungen

| Name | Kardinalität | Ziel | Mapping |
|------|--------------|------|---------|
| ARTIK_BUCH_UMSATZ_Artnr | many | [BUCH_UMSATZ](<BUCH_UMSATZ.md>) | `Artnr : Artnr` |
| ARTIK_ARTIK_WG1_Wg1 | one | [ARTIK_WG1](<ARTIK_WG1.md>) | `Wg1 : Wg1` |
| ARTIK_ARTIK_WG2_Wg2 | one | [ARTIK_WG2](<ARTIK_WG2.md>) | `Wg2 : Wg2` |
| ARTIK_ARTIK_KATWERTE_Katid | one | [ARTIK_KATWERTE](<ARTIK_KATWERTE.md>) | `Katid : Katid` |

Jeder Artikel ist damit direkt genau **einer** Kategorie zugeordnet (`Katid` in `ARTIK`).

# Citations

- `../../raw/dab_registry.md`
