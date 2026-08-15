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
| [REZ_POS](<REZ_POS.md>) | Rezeptposition inkl. vollständiger Preiskalkulation (Taxierung) | `Id` |
| [REZ_ABRECH](<REZ_ABRECH.md>) | Abrechnungslauf: Zeitraum, Zähler, Betrag, Versand, Storno | `Abrechnungsid` |
| [REZ_ABRECH_POS](<REZ_ABRECH_POS.md>) | Zuordnung Abrechnung ↔ Rezeptposition | `Id` |
| [REZ_ABRECHNUNGSSTELLE](<REZ_ABRECHNUNGSSTELLE.md>) | Code-Tabelle der Abrechnungsstellen (Clearingstellen) | `Id` |
| [KUNDE_UNTERKONTO](<KUNDE_UNTERKONTO.md>) | Unterkonten für Praxen mit mehreren Ärzten (LANR/BSNR) | `Id` |

Tabellen des Kontor.MED-Plugins „Rezeptabrechnung". Diese Domäne hat sich seit
dem 2026-08-14 in mehreren Schritten stark weiterentwickelt und ist mit dem
Export vom 2026-08-15 (15:41) stabil:

- **2026-08-14, 10:06** — Erstdokumentation, keine registrierten Beziehungen.
- **10:46–10:52** — Beziehungen zu `KUNDE`/`ARTIK` und untereinander registriert.
- **11:47** — `REZ` (9→15 Felder), `REZ_POS` (15→25 Felder, komplette
  Preiskalkulation ergänzt) und `REZ_ABRECH` (6→19 Felder, jetzt vollständiger
  Abrechnungslauf mit Zeitraum/Versand/Storno) deutlich erweitert; neue
  Code-Tabelle `REZ_ABRECHNUNGSSTELLE` hinzugekommen. Dabei schwankte kurzzeitig
  die Relation `REZ_ABRECH_POS` → `REZ_POS`.
- **2026-08-15, 15:41 (Registry)** — alle zuvor offenen Punkte geschlossen:
  `REZ` bekommt drei weitere Relationen (zu `REZ_POS`, `KUNDE_UNTERKONTO` und
  `KUNDE` über `Kundennrkk`) sowie das neue Feld `Reznr`; `ARTIK` bekommt Feld
  `Aktiv`; `REZ_ABRECH` → `REZ_ABRECHNUNGSSTELLE` ist jetzt registriert; die
  `REZ_ABRECH_POS`-Relationen sind stabil und die Tippfehler-Inkonsistenz
  (`Abrechungsid` vs. `Abrechnungsid`) ist behoben.
- **2026-08-15, 17:52 (Fachquelle)** — die Rezeptabrechnungs-Fachquelle wurde
  bearbeitet: Beschreibungen der fünf nie registrierten `KUNDE_UNTERKONTO`-Felder
  (`Verwendung`, `Adressid`, `Kundennrkk`, `Deaktiviert`, `Info`) sind entfernt.
  Dabei ist auch die Beschreibung des tatsächlich registrierten Felds `Bez`
  verlorengegangen — neue kleine Lücke, siehe [KUNDE_UNTERKONTO](<KUNDE_UNTERKONTO.md>).

Die Registry und die Fachquelle für `KUNDE_UNTERKONTO` sind inzwischen deckungsgleich
(je 6 Felder); die einzige verbleibende Lücke ist eine fehlende Beschreibung für
`Bez`, kein fehlendes Feld.

Zusammenhang mit `KUNDE`: [KUNDE](<KUNDE.md>) trägt selbst Krankenkassen-/
Arztfelder (`KundennrKK`, `Lanr`, `Betriebsnummer`, `Kv`, …) — vermutlich der
Standardfall für Kunden mit nur einem Arzt, während `KUNDE_UNTERKONTO` mehrere
Kombinationen je Kunde abbildet (jetzt auch über die registrierte Relation
`REZ.Unterkontoid` abgebildet). Bestätigt (über zwei registrierte Relationen,
`REZ_ABRECH_KUNDE_Kundennrkk` und `REZ_KUNDE_Kundennrkk`): Krankenkassen werden
als eigene `KUNDE`-Datensätze geführt.

Alle Tabellen sind über den [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>)
exponiert (Registry-Export in `../../raw/dab_registry.md`, Stand 2026-08-15,
27 Entitäten — davon zwei keine Fachtabellen, sondern API-Infrastruktur, siehe
[00-Allgemeines](<../00-Allgemeines/index.md>)).
