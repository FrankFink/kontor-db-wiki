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
| [CRM_LEAD](<CRM_LEAD.md>) | Lead-/Interessentendatensatz | `Leadid` |
| [CRM_ACTIVITIES](<CRM_ACTIVITIES.md>) | Aktivitäten-/Verlaufsprotokoll, polymorph verknüpft | `ActivityId` |
| [CRM_LEAD_CONFIG](<CRM_LEAD_CONFIG.md>) | Konfigurationsprofile für Lead-Verarbeitung | `Profile` |
| [CRM_PROMPT_TEMPLATE](<CRM_PROMPT_TEMPLATE.md>) | Prompt-Vorlagen je Profil | `Name` |

Keine dieser vier CRM-Tabellen hat in der Registry deklarierte Beziehungen — auch
nicht untereinander. Die naheliegenden Verweise (`CRM_LEAD.Adressid/Ansprechid` →
`ADRESSEN`, `CRM_ACTIVITIES.ParentId` → vermutlich `CRM_LEAD`,
`CRM_PROMPT_TEMPLATE.Profile` → `CRM_LEAD_CONFIG.Profile`) sind fachliche Vermutungen,
siehe die jeweiligen Seiten.

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

Alle Tabellen sind über den [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>)
exponiert (Registry-Export in `../../raw/dab_registry.md`, Stand 2026-08-02,
19 Entitäten).
