---
type: Entität
title: ARTIK_KATWERTE
description: Hierarchische Kategoriewerte für Artikel (Katalog- oder Shopstruktur); referenziert von ARTIK.Katid.
tags: [tabelle, artikel, kategorie, hierarchie]
timestamp: 2026-07-31
---

Tabelle `dbo.ARTIK_KATWERTE` — hierarchisch strukturierte Kategoriewerte, vermutlich
für die Artikelklassifikation im (Web-)Shop. Ein Datensatz pro Kategorieknoten;
`Katidparent` bildet die Baumstruktur, `Pathname` dürfte den vollen Pfad zwischenspeichern.
Drei Shop-IDs (`Katid_shop`, `Katid_shop2`, `Katid_shop3`) deuten auf die Anbindung an
externe Shop-Systeme hin.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Katid` (`nvarchar(50)`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Katid | nvarchar(50) | no | Kategorie-ID, PK |
| Katname | nvarchar(200) | yes | Bezeichnung |
| Katidparent | nvarchar(50) | yes | Verweist fachlich auf `Katid` (Selbstreferenz) |
| Pathname | nvarchar(1000) | yes | Voller Pfad, vermutlich denormalisiert |
| Useshop | bit | yes | Freigabe für Shop |
| Katid_shop | nvarchar(50) | yes | Kategorie-ID im Zielsystem 1 |
| Katid_shop2 | nvarchar(50) | yes | Kategorie-ID im Zielsystem 2 |
| Katid_shop3 | nvarchar(50) | yes | Kategorie-ID im Zielsystem 3 |

# Beziehungen

In der Registry sind an dieser Tabelle **keine ausgehenden Beziehungen** deklariert.
Die Selbstreferenz über `Katidparent` ist fachlich vorhanden, aber nicht als
DAB-Relation registriert.

[ARTIK](<ARTIK.md>) verweist eingehend über `Katid : Katid` hierher (Relation
`ARTIK_ARTIK_KATWERTE_Katid`). Jeder Artikel ist damit genau **einer** Kategorie
zugeordnet.

# Citations

- `../../raw/dab_registry.md`
