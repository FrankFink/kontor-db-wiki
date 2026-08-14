---
type: Referenz
title: Datenbank-Überblick
description: Kurzüberblick zur Kontor Datenbank, aktuell im Wiki dokumentierter Ausschnitt.
tags: [datenbank, ueberblick]
timestamp: 2026-08-14
---

Die **Kontor Datenbank** ist die SQL-Datenbank hinter dem ERP **Kontor.MED**
(codegarden software GmbH). Sie liegt im Standard-Schema `dbo` einer
SQL-Server-Instanz.

# Aktueller Wiki-Ausschnitt

Dokumentiert sind bislang 24 fachliche Tabellen sowie zwei Objekte der
API-Infrastruktur selbst (`SYS_DAB_METADATA`, `kon_dab_checkentityvalue`) — zusammen
26 über den [Kontor API Service](<kontor-api-service.md>) freigegebene Entitäten
(zzgl. `CRM_LEAD_CONFIG` als nicht mehr registrierte Altseite). Die Datenbank
enthält darüber hinaus zahlreiche weitere Tabellen und Views; sie werden hier
aufgenommen, sobald Quellen dazu vorliegen.

## Kernentitäten

| Tabelle | Zweck (Kurz) |
|---------|--------------|
| [ADRESSEN](../10-Tabellen/ADRESSEN.md) | Adressdatensätze (Rechnungs-, Liefer-, Ansprechpartner), gruppiert über `Firmenadressid` |
| [ARTIK](../10-Tabellen/ARTIK.md) | Artikelstamm |
| [BUCH_UMSATZ](../10-Tabellen/BUCH_UMSATZ.md) | Umsatzbuchungen je Belegposition |
| [KUNDE](../10-Tabellen/KUNDE.md) | Kundenstamm |
| [PROJEKT](../10-Tabellen/PROJEKT.md) | Projektstamm mit Kundenbezug |
| [_FIRMA](../10-Tabellen/_FIRMA.md) | Firmenstammtabelle des Anwenderunternehmens |

## Codetabellen und Klassifikationen

| Tabelle | Zweck (Kurz) |
|---------|--------------|
| [ARTIK_WG1](../10-Tabellen/ARTIK_WG1.md), [ARTIK_WG2](../10-Tabellen/ARTIK_WG2.md) | Warengruppen Ebene 1/2 (WG2 → WG1 über `RefWg1`) |
| [ARTIK_KATWERTE](../10-Tabellen/ARTIK_KATWERTE.md) | Hierarchische Kategoriewerte (Katalog/Shop) |
| [KUNDE_GRP1](../10-Tabellen/KUNDE_GRP1.md), [KUNDE_GRP2](../10-Tabellen/KUNDE_GRP2.md) | Kundengruppen Ebene 1/2 (voneinander unabhängig) |
| [VERTR](../10-Tabellen/VERTR.md) | Vertreterstamm |

## CRM

| Tabelle | Zweck (Kurz) |
|---------|--------------|
| [CRM_LEAD](../10-Tabellen/CRM_LEAD.md) | Lead-/Interessentendatensatz (2026-08-14 stark verschlankt) |
| [CRM_ACTIVITIES](../10-Tabellen/CRM_ACTIVITIES.md) | Aktivitäten-/Verlaufsprotokoll, polymorph verknüpft |
| [CRM_PROMPT_TEMPLATE](../10-Tabellen/CRM_PROMPT_TEMPLATE.md) | Prompt-Vorlagen je Profil |

Der CRM-Bereich schließt fachlich nicht an die übrigen Tabellen an — in der
Registry sind keine Beziehungen dorthin deklariert, weder zu `ADRESSEN`/`KUNDE`
noch untereinander. [CRM_LEAD_CONFIG](../10-Tabellen/CRM_LEAD_CONFIG.md) ist seit
2026-08-14 nicht mehr registriert (siehe dort).

## Notizen

| Tabelle | Zweck (Kurz) |
|---------|--------------|
| [KONTAKTE](../10-Tabellen/KONTAKTE.md) | Zentrale Notizsammlung, polymorph über `Src`/`Srcvalue` verknüpft |

Verwendet das gleiche Diskriminator-Muster wie `CRM_ACTIVITIES`
(`ParentType`/`ParentId`) — beide ohne registrierte Beziehungen.

## Aufgabenverwaltung

| Tabelle | Zweck (Kurz) |
|---------|--------------|
| [WFLOW](../10-Tabellen/WFLOW.md) | Aufgaben der Nutzer, zugeordnet über `PROJEKT` |
| [WFLOW_FOLDERS](../10-Tabellen/WFLOW_FOLDERS.md) | Ordner zur Strukturierung von Aufgaben |
| [WFLOW_INVOICINGUNIT](../10-Tabellen/WFLOW_INVOICINGUNIT.md) | Code-Tabelle für Abrechnungseinheiten-Arten |

Einzige der neueren Gruppen mit registriertem Anschluss an bestehende
Kernentitäten: Aufgabe → `PROJEKT` → `KUNDE` (siehe unten), beide Schritte als
DAB-Relation deklariert.

## Rezeptabrechnung

| Tabelle | Zweck (Kurz) |
|---------|--------------|
| [REZ](../10-Tabellen/REZ.md) | Erfasstes Rezept |
| [REZ_POS](../10-Tabellen/REZ_POS.md) | Einzelne Rezeptposition |
| [REZ_ABRECH](../10-Tabellen/REZ_ABRECH.md) | Erzeugte Abrechnung |
| [REZ_ABRECH_POS](../10-Tabellen/REZ_ABRECH_POS.md) | Zuordnung Abrechnung ↔ Position |
| [KUNDE_UNTERKONTO](../10-Tabellen/KUNDE_UNTERKONTO.md) | Unterkonten für Praxen mit mehreren Ärzten |

Tabellen des Plugins „Rezeptabrechnung". **Update 2026-08-14:** Diese Domäne,
ursprünglich um 10:06 ohne jede registrierte Beziehung dokumentiert, ist bis 10:52
vollständig angebunden worden — zu `KUNDE`, `ARTIK` und untereinander (siehe
Beziehungsgrafik unten).

# Beziehungen im dokumentierten Ausschnitt

`BUCH_UMSATZ` liegt im Zentrum der Bewegungsdaten und verweist auf `ARTIK` und
`KUNDE`. `KUNDE` verweist seinerseits auf zwei Adressen in `ADRESSEN`
(Rechnungs- und Lieferadresse) sowie auf `VERTR` und die beiden Kundengruppen.
`ARTIK` verweist auf seine Warengruppen.

```
       ARTIK_WG1 ─── ARTIK_WG2 (RefWg1, fachlich)
            ▲             ▲
            │             │
            └──── ARTIK ──┘
                    │  │
                    │  └──▶ ARTIK_KATWERTE (Selbstref. über Katidparent, fachlich)
                    ▼
               BUCH_UMSATZ  ◀── KUNDE ──▶ ADRESSEN (Rg + Liefer)
                                  │
                                  ├──▶ VERTR
                                  ├──▶ KUNDE_GRP1
                                  └──▶ KUNDE_GRP2
```

`BUCH_UMSATZ.Vertreter` verweist fachlich auf `VERTR`, ist aber nicht als DAB-Relation
registriert. `PROJEKT.Kundennr` → `KUNDE` ist inzwischen als DAB-Relation registriert;
`PROJEKT.Rgadrid`/`Lieferadrid` bleiben auffällig als `bigint` typisiert statt
`uniqueidentifier` wie in `ADRESSEN`/`KUNDE` (siehe [PROJEKT](../10-Tabellen/PROJEKT.md)).

Der CRM-Bereich (`CRM_LEAD`, `CRM_ACTIVITIES`, `CRM_PROMPT_TEMPLATE`) steht separat
und ohne registrierte Verbindung zum übrigen Schema.

Die Rezeptabrechnungs-Domäne ist seit 2026-08-14 (10:52) vollständig angebunden:

```
                    ┌──▶ KUNDE  ◀── REZ_ABRECH.Kundennrkk
                    │            (bestätigt: Krankenkassen als KUNDE-Datensätze)
ARTIK ◀── REZ_POS ──┼──▶ REZ ──▶ KUNDE
             │       └──▶ REZ_ABRECH ──▶ KUNDE (Kundennr + Kundennrkk)
             │
             └──◀── REZ_ABRECH_POS ──▶ REZ_ABRECH

KUNDE_UNTERKONTO ──▶ KUNDE   (Id jetzt als PK registriert)
```

Alle Pfeile sind registrierte DAB-Relationen. `KUNDE_UNTERKONTO` hat weiterhin 5
von der Fachquelle beschriebene Felder, die in der Registry fehlen (`Verwendung`,
`Adressid`, `Kundennrkk`, `Deaktiviert`, `Info`), siehe
[KUNDE_UNTERKONTO](../10-Tabellen/KUNDE_UNTERKONTO.md).

`WFLOW.Projektnr` → `PROJEKT.Projektnr` → `PROJEKT.Kundennr` → `KUNDE` ist
durchgehend als DAB-Relation registriert:

```
WFLOW ──▶ PROJEKT ──▶ KUNDE   (beide Pfeile registriert)
  │
  ├──▶ WFLOW_FOLDERS (Folder, registriert)
  └──▶ WFLOW_INVOICINGUNIT (Invoicingunit → Unit, registriert)
```

## API-Infrastruktur

Seit 2026-08-10 zwei weitere registrierte Objekte, die keine Fachdaten sind, sondern
zum [Kontor API Service](<kontor-api-service.md>) selbst gehören:
[SYS_DAB_METADATA](<SYS_DAB_METADATA.md>) (Feld-Metadaten anderer Entitäten) und
[kon_dab_checkentityvalue](<kon_dab_checkentityvalue.md>) (gespeicherte Prozedur,
erstes registriertes Nicht-Tabellen-Objekt). Beide stehen fachlich isoliert, ihr
vermuteter Zusammenhang (`SYS_DAB_METADATA.Hasproccheck` → Aufruf der Prozedur) ist
nicht in der Registry belegt.

# Citations

- `../../raw/dab_registry.md` — DAB-Registry-Export vom 2026-08-14, 10:52 Uhr (26 Entitäten)
- `../../raw/Informationen_Tabelle_Kontakte.md`
- `../../raw/# Tabellen der Aufgabenverwaltung W.md`
- `../../raw/# Wichtige Datenbanktabellen rezeptabrechnungs-plugin.md`
- `../../raw/Firmenstammdaten.md`
