# 10 · Tabellen

Ein Konzeptdokument je Tabelle der Kontor Datenbank. Bis sich Muster zeigen, liegen
die Seiten flach in diesem Ordner.

# Kernentitäten

| Tabelle | Zweck (Kurz) | PK |
|---------|--------------|----|
| [ADRESSEN](<ADRESSEN.md>) | Adressdatensätze (Rechnungs-, Liefer-, Ansprechpartner), gruppiert über `Firmenadressid` | `Id` |
| [ARTIK](<ARTIK.md>) | Artikelstamm | `Artnr` |
| [BUCH_UMSATZ](<BUCH_UMSATZ.md>) | Umsatzbuchungen je Belegposition | `Id` |
| [KUNDE](<KUNDE.md>) | Kundenstamm | `Kundennr` |
| [PROJEKT](<PROJEKT.md>) | Projektstamm mit Kundenbezug | `Projektnr` |
| [_FIRMA](<_FIRMA.md>) | Firmenstammtabelle — Stammdaten des Anwenderunternehmens selbst | `Id` |

# Codetabellen und Klassifikationen

| Tabelle | Zweck (Kurz) | PK |
|---------|--------------|----|
| [ARTIK_WG1](<ARTIK_WG1.md>) | Warengruppe Ebene 1 (Lookup für `ARTIK.Wg1`) | `Wg1` |
| [ARTIK_WG2](<ARTIK_WG2.md>) | Warengruppe Ebene 2 (Lookup für `ARTIK.Wg2`, mit `RefWg1`) | `Wg2` |
| [ARTIK_KATWERTE](<ARTIK_KATWERTE.md>) | Hierarchische Kategoriewerte (Katalog/Shop) | `Katid` |
| [KUNDE_GRP1](<KUNDE_GRP1.md>) | Kundengruppe Ebene 1 (Lookup für `KUNDE.Grp1`) | `Grp1` |
| [KUNDE_GRP2](<KUNDE_GRP2.md>) | Kundengruppe Ebene 2 (Lookup für `KUNDE.Grp2`, kein `RefGrp1`) | `Grp2` |
| [VERTR](<VERTR.md>) | Vertreterstamm | `Vertrnr` |

# CRM

| Tabelle | Zweck (Kurz) | PK |
|---------|--------------|----|
| [CRM_LEAD](<CRM_LEAD.md>) | Lead-/Interessentendatensatz (2026-08-14 stark verschlankt) | `Leadid` |
| [CRM_ACTIVITIES](<CRM_ACTIVITIES.md>) | Aktivitäten-/Verlaufsprotokoll, polymorph verknüpft | `ActivityId` |
| [CRM_PROMPT_TEMPLATE](<CRM_PROMPT_TEMPLATE.md>) | Prompt-Vorlagen je Profil | `Name` |

Keine dieser CRM-Tabellen hat in der Registry deklarierte Beziehungen — auch nicht
untereinander. `CRM_ACTIVITIES.ParentId` → vermutlich `CRM_LEAD` bleibt eine
fachliche Vermutung, siehe die jeweiligen Seiten.

**Nicht mehr registriert:** [CRM_LEAD_CONFIG](<CRM_LEAD_CONFIG.md>) war bis
2026-08-02 Teil der Registry, fehlt seit dem Export vom 2026-08-14. Seite als
historische Referenz erhalten.

# Notizen

| Tabelle | Zweck (Kurz) | PK |
|---------|--------------|----|
| [KONTAKTE](<KONTAKTE.md>) | Zentrale Notizsammlung, polymorph über `Src`/`Srcvalue` verknüpft | `Id` |

# Aufgabenverwaltung

| Tabelle | Zweck (Kurz) | PK |
|---------|--------------|----|
| [WFLOW](<WFLOW.md>) | Aufgaben der Nutzer, zugeordnet über `PROJEKT` | `ID` |
| [WFLOW_FOLDERS](<WFLOW_FOLDERS.md>) | Ordner zur Strukturierung von Aufgaben | `Folder` |
| [WFLOW_INVOICINGUNIT](<WFLOW_INVOICINGUNIT.md>) | Code-Tabelle für Abrechnungseinheiten-Arten | `Unit` |

Eine Aufgabe (`WFLOW`) wird stets einem Projekt zugeordnet; darüber ist sie auch
einem Kunden zurechenbar (`WFLOW.Projektnr` → `PROJEKT.Projektnr` →
`PROJEKT.Kundennr` → `KUNDE.Kundennr`, beide Schritte inzwischen als DAB-Relation
registriert). Die Abrechnungsdaten selbst liegen in `WFLOW`
(`FinishedTime`/`InvoicingUnitCount`/`Invoicingunit`);
`WFLOW_INVOICINGUNIT` ist nur die Code-Tabelle für die Art.

# Rezeptabrechnung

| Tabelle | Zweck (Kurz) | PK |
|---------|--------------|----|
| [REZ](<REZ.md>) | Erfasstes Rezept; `Rezeptid` = Dokumenten-ID des Scans | `Rezeptid` |
| [REZ_POS](<REZ_POS.md>) | Einzelne Rezeptposition, über `Rezeptid` einem Rezept zugeordnet | `Id` |
| [REZ_ABRECH](<REZ_ABRECH.md>) | Erzeugte Abrechnung | `Abrechnungsid` |
| [REZ_ABRECH_POS](<REZ_ABRECH_POS.md>) | Zuordnung Abrechnung ↔ Rezeptposition | `Id` |
| [KUNDE_UNTERKONTO](<KUNDE_UNTERKONTO.md>) | Unterkonten für Praxen mit mehreren Ärzten (LANR/BSNR) | `Id` |

Tabellen des Kontor.MED-Plugins „Rezeptabrechnung". Fachliche Zuordnungskette laut
Quelle: `REZ → REZ_POS → REZ_ABRECH_POS → REZ_ABRECH`. **Update 2026-08-14:** Bei
Erstdokumentation (10:06) hatte keine dieser fünf Tabellen registrierte
Beziehungen; bis 10:52 sind alle fachlich naheliegenden Verknüpfungen zu
`KUNDE`/`ARTIK` und untereinander registriert worden — auch die letzte Lücke
(`REZ_ABRECH_POS` → `REZ_ABRECH`) ist inzwischen geschlossen. `KUNDE_UNTERKONTO`
hat weiterhin 5 von der Fachquelle beschriebene Felder, die nicht in der Registry
stehen (`Verwendung`, `Adressid`, `Kundennrkk`, `Deaktiviert`, `Info`) — `Id` als
PK ist aber seit 10:46 registriert.

Zusammenhang mit `KUNDE`: seit 2026-08-14 trägt [KUNDE](<KUNDE.md>) selbst
Krankenkassen-/Arztfelder (`KundennrKK`, `Lanr`, `Betriebsnummer`, `Kv`, …) —
vermutlich der Standardfall für Kunden mit nur einem Arzt, während
`KUNDE_UNTERKONTO` mehrere Kombinationen je Kunde abbildet. Bestätigt (über die
registrierte Relation `REZ_ABRECH_KUNDE_Kundennrkk`): Krankenkassen werden als
eigene `KUNDE`-Datensätze geführt.

Alle Tabellen sind über den [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>)
exponiert (Registry-Export in `../../raw/dab_registry.md`, Stand 2026-08-14,
26 Entitäten — davon zwei keine Fachtabellen, sondern API-Infrastruktur, siehe
[00-Allgemeines](<../00-Allgemeines/index.md>)).
