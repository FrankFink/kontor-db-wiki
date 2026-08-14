---
type: Entität
title: _FIRMA
description: Firmenstammtabelle — Stammdaten des Anwenderunternehmens selbst (Firmenname, Adresse, Steuernummer, USt-ID, IK-Nummer, MwSt-Sätze).
tags: [tabelle, firma, stammdaten]
timestamp: 2026-08-14
---

Tabelle `dbo._FIRMA` — die Firmenstammtabelle. Enthält die Stammdaten des Anwenders
bzw. Unternehmens selbst (nicht eines Kunden), u. a. Firmenname, Firmenadresse,
Steuernummer, Umsatzsteuer-ID und IK-Nummer der Firma. Der `int`-Primärschlüssel
und das führende `_` im Namen deuten auf eine Systemtabelle mit vermutlich genau
einem Datensatz hin (Konfigurationscharakter), das ist aber nicht belegt.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Id` (`int`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Id | int | no | PK |
| Finame1 | nvarchar(50) | yes | Firmenname (Zeile 1) |
| Finame2 | nvarchar(50) | yes | Firmenname (Zeile 2) |
| Str | nvarchar(50) | yes | Straße |
| Plz | nvarchar(5) | yes | Postleitzahl |
| Ort | nvarchar(50) | yes | |
| Tel | nvarchar(50) | yes | Telefon |
| Email | nvarchar(50) | yes | |
| Homepage | nvarchar(50) | yes | |
| Mwst | decimal | yes | Standard-Mehrwertsteuersatz für Schlüssel „voll" — aktuell 19 % |
| Ustid | nvarchar(20) | yes | Umsatzsteuer-ID |
| Steuernr | nvarchar(30) | yes | Steuernummer |
| Iknummer | nvarchar(15) | yes | IK-Nummer der Firma |
| Mwst2 | decimal | yes | Standard-Mehrwertsteuersatz für Schlüssel „ermäßigt" — aktuell 7 % |

# Mehrwertsteuersätze

`Mwst` und `Mwst2` sind laut Fachquelle die beiden Standardsätze, mit denen die
Mehrwertsteuerschlüssel **voll** (19 %) bzw. **ermäßigt** (7 %) erfasst werden.
Diese Zuordnung ist konfigurierbar — die genannten Prozentsätze sind der aktuelle
Stand, kein fester Programmwert.

# Beziehungen

In der Registry sind an dieser Tabelle **keine Beziehungen** deklariert.

# Citations

- `../../raw/dab_registry.md`
- `../../raw/Firmenstammdaten.md`
