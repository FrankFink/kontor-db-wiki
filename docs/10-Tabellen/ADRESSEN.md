---
type: Entität
title: ADRESSEN
description: Adressdatensätze (Kunden, Lieferanten, Ansprechpartner), gruppiert über Firmenadressid; referenziert von KUNDE.
tags: [tabelle, adressen, stammdaten]
timestamp: 2026-08-10
---

Tabelle `dbo.ADRESSEN` — Adressdatensätze von Kunden, Lieferanten und davon
unabhängigen Adressen. Jede Adresse hat eine eindeutige `Id`. Wird von
[KUNDE](<KUNDE.md>) über `Rgadrid` (Rechnungsadresse) und `Lieferadrid`
(Lieferadresse) referenziert.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Id` (`uniqueidentifier`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Id | uniqueidentifier | no | PK |
| Kdliefnr | nvarchar(15) | yes | Kunden-/Lieferantennummer; nachrangiges Zuordnungskriterium, siehe unten |
| Adresstyp | nvarchar(3) | yes | Bedeutung ungeklärt |
| Gruppe | nvarchar(3) | yes | Bedeutung ungeklärt |
| Anrede | nvarchar(200) | yes | |
| Vorname | nvarchar(200) | yes | |
| Name1 | nvarchar(200) | yes | |
| Name2 | nvarchar(200) | yes | |
| Name3 | nvarchar(200) | yes | |
| Str | nvarchar(200) | yes | |
| Plz | nvarchar(15) | yes | |
| Ort1 | nvarchar(200) | yes | |
| Ort2 | nvarchar(200) | yes | |
| Telefon | nvarchar(100) | yes | |
| Fax | nvarchar(100) | yes | |
| Email | nvarchar(400) | yes | |
| Homepage | nvarchar(500) | yes | |
| Bemerkungen | nvarchar | yes | |
| Bestland | nvarchar(5) | yes | Bedeutung ungeklärt |
| Abteilung | nvarchar(500) | yes | |
| Mobil | nvarchar(100) | yes | |
| Isansprechpartner | bit | yes | Kennzeichnet Datensatz als Ansprechpartner statt Lieferadresse |
| Firmenadressid | uniqueidentifier | yes | Vorrangiges Zuordnungskriterium: gleicher Wert = gleiche Firma |
| Hauptansprechpartner | bit | yes | Hauptansprechpartner innerhalb der Firma |
| Entscheider | bit | yes | Ansprechpartner mit Entscheidungsbefugnis |
| Aktiv | bit | yes | Adresse aktiv/deaktiviert |
| Geocode_lat | decimal | yes | Breitengrad, vermutlich aus Geocoding von `Str`/`Plz`/`Ort1` |
| Geocode_lng | decimal | yes | Längengrad, vermutlich aus Geocoding von `Str`/`Plz`/`Ort1` |

**Ungeklärt:** genaue Bedeutung von `Adresstyp`, `Gruppe`, `Bestland`; wodurch/wann
`Geocode_lat`/`Geocode_lng` befüllt werden (z. B. bei Speicherung automatisch, oder
über einen separaten Geocoding-Lauf).

# Aufbau und Zuordnung von Adressen

Zusammenfassung aus `../../raw/# Aufbau und Zuordnung von Adressen.md`.

**Zuordnung zu Kunden/Lieferanten.** Im Kunden- bzw. Lieferantenstamm wird die
Rechnungsadresse über `Rgadrid` referenziert („Rechnungsadresse-ID"); im Kundenstamm
zusätzlich optional eine feste Lieferadresse über `Lieferadrid`. Die im Kundenstamm
hinterlegte Rechnungsadresse-ID wird zugleich als `Firmenadressid` verwendet: **alle
Datensätze in `ADRESSEN` mit derselben `Firmenadressid` gehören zur selben Firma**
(Kunde oder Lieferant). `Firmenadressid` ist damit das **vorrangige**
Zuordnungskriterium — `Kdliefnr` (Kunden-/Lieferantennummer im Adressdatensatz) ist
nur ein nachrangiges, zusätzliches Kennzeichen.

**Ansprechpartner.** `Isansprechpartner` markiert einen Datensatz als
Ansprechperson statt als eigenständige Lieferadresse — er enthält dann nur Kontakt-
und Adressdaten dieser Person. `Hauptansprechpartner` und `Entscheider` verfeinern
diese Kennzeichnung.

**Aktivierung.** `Aktiv` schaltet eine Adresse für den regulären Betrieb frei;
deaktivierte Adressen werden je nach Einstellung im aktiven Betrieb nicht mehr
verwendet.

```
KUNDE.Rgadrid ──▶ ADRESSEN.Id  (= Firmenadresse, Firmenadressid dieser Firma)
KUNDE.Lieferadrid ──▶ ADRESSEN.Id  (optionale feste Lieferadresse)

ADRESSEN (weitere Datensätze mit gleicher Firmenadressid)
  ├─ Isansprechpartner = 1  → Ansprechperson (ggf. Hauptansprechpartner/Entscheider)
  └─ Isansprechpartner = 0  → weitere Lieferadresse der Firma
```

# Beziehungen

| Name | Kardinalität | Ziel | Mapping |
|------|--------------|------|---------|
| ADRESSEN_KUNDE_Id | many | [KUNDE](<KUNDE.md>) | `Id : Lieferadrid` |

Zusätzlich referenziert `KUNDE` diese Tabelle über `Rgadrid : Id` — siehe
[KUNDE](<KUNDE.md>). Die Gruppierung über `Firmenadressid` (siehe oben) ist keine
in der DAB-Registry deklarierte Relation, da sie innerhalb derselben Tabelle
(Selbstreferenz auf `ADRESSEN.Id`) verläuft.

# Citations

- `../../raw/dab_registry.md`
- `../../raw/# Aufbau und Zuordnung von Adressen.md`
