# Log

Chronologisches Änderungsprotokoll des Wikis. Neueste Einträge zuerst.

## 2026-08-14 (Update 10:52)

**Update** — `raw/dab_registry.md` erneut exportiert (10:52, weiterhin 26
Entitäten). Genau die eine verbleibende Lücke aus dem 10:46-Update ist
geschlossen: `REZ_ABRECH_POS` hat jetzt auch die Relation
`REZ_ABRECH_POS_REZ_ABRECH_Abrechungsid` (`Abrechungsid : Abrechnungsid`).
Sonst keine Änderungen. Damit ist die gesamte Rezeptabrechnungs-Domäne
(`REZ`, `REZ_POS`, `REZ_ABRECH`, `REZ_ABRECH_POS`, `KUNDE_UNTERKONTO`)
durchgehend registriert verknüpft.

Aktualisiert: `REZ_ABRECH_POS.md` (zweite Relation ergänzt, „halbe
Registrierung"-Hinweis entfernt), `REZ_ABRECH.md` und `REZ.md`
(Querverweise/Diagramm korrigiert), `10-Tabellen/index.md` und
`00-Allgemeines/datenbank-ueberblick.md` (Beziehungsgrafik und Text bereinigt,
keine offene Lücke mehr vermerkt).

## 2026-08-14 (Update 10:46)

**Update** — `raw/dab_registry.md` erneut exportiert (10:46, weiterhin 26
Entitäten). Die gesamte Rezeptabrechnungs-Domäne, die im Export von 10:06 noch
ohne jede registrierte Beziehung war, hat jetzt fast durchgängig registrierte
DAB-Relationen:

- `REZ` → `KUNDE` (`Kundennr`, neu)
- `REZ_ABRECH` → `KUNDE` **zweimal** (`Kundennr` und `Kundennrkk`, neu) —
  bestätigt die vorher nur vermutete Lesart, dass Krankenkassen als eigene
  `KUNDE`-Datensätze geführt werden
- `REZ_POS` → `ARTIK`, `KUNDE`, `REZ`, `REZ_ABRECH` (vier neue Relationen)
- `REZ_ABRECH_POS` → `REZ_POS` (neu, über `Posguid`)
- `KUNDE_UNTERKONTO` → `KUNDE` (neu) sowie neues Feld `Id` **mit PK-Kennzeichnung**
  — deckt sich jetzt mit der Fachquelle, die weiterhin 5 zusätzliche Felder
  beschreibt, die in der Registry fehlen (`Verwendung`, `Adressid`,
  `Kundennrkk`, `Deaktiviert`, `Info`)

**Verbleibende Lücke:** `REZ_ABRECH_POS.Abrechungsid` → `REZ_ABRECH` ist weiterhin
nicht registriert, obwohl die Tabelle laut Fachquelle ausschließlich der
Verknüpfung beider Tabellen dient — halbe Registrierung.

Aktualisiert: `REZ.md`, `REZ_ABRECH.md`, `REZ_ABRECH_POS.md`, `REZ_POS.md`,
`KUNDE_UNTERKONTO.md` (Beziehungsabschnitte von „fachlich vermutet" auf
„registriert" umgestellt, Diskrepanz-Hinweis bei `KUNDE_UNTERKONTO` präzisiert),
`KUNDE.md` (neuer Abschnitt „Eingehende Beziehungen", `KundennrKK`-Anmerkung
präzisiert). `10-Tabellen/index.md` und `00-Allgemeines/datenbank-ueberblick.md`
(neue Beziehungsgrafik für die Rezeptabrechnungs-Domäne) nachgezogen.

## 2026-08-14

**Creation** — Drei Rohquellen gemeinsam verarbeitet: `raw/dab_registry.md`
(Export 2026-08-14T10:06, 21 → 26 Entitäten),
`raw/# Wichtige Datenbanktabellen rezeptabrechnungs-plugin.md` (Fachtext zu
`REZ`, `REZ_POS`, `REZ_ABRECH`, `REZ_ABRECH_POS`, `KUNDE_UNTERKONTO`) und
`raw/Firmenstammdaten.md` (Fachtext zu `_FIRMA`).

**Neue Rezeptabrechnungs-Domäne** — fünf neue Konzeptseiten unter `10-Tabellen/`:
`REZ.md`, `REZ_POS.md`, `REZ_ABRECH.md`, `REZ_ABRECH_POS.md`,
`KUNDE_UNTERKONTO.md`. Durchgängiges Muster: keine dieser Tabellen hat
registrierte DAB-Beziehungen, obwohl mehrere Felder klar wie Fremdschlüssel
aussehen und die Fachquelle die Zusammenhänge explizit beschreibt. Bei
`KUNDE_UNTERKONTO` zusätzlich eine Diskrepanz dokumentiert: Registry listet nur 5
Felder ohne PK, Fachquelle beschreibt 11 Felder mit `Id` als PK — beide Stände auf
der Seite getrennt wiedergegeben, Ursache ungeklärt.

**Neue Firmenstammtabelle** — `10-Tabellen/_FIRMA.md`: Stammdaten des
Anwenderunternehmens (nicht eines Kunden), inkl. der beiden MwSt-Sätze
(`Mwst`=19 % „voll", `Mwst2`=7 % „ermäßigt").

**Erweiterte Bestandstabellen für dieselbe Domäne:**
- `ARTIK.md`: fünf neue Felder (`Mwstklasse`, `SSB`, `Rezeptbez1`, `Rezeptbez2`,
  `Abda_preisfaktor`; 23 → 28 Felder) — Rezeptdruck- und ABDA-Pharmadaten.
- `KUNDE.md`: sechs neue Felder (`KundennrKK`, `Lanr`, `Kostentraegerkennung`,
  `Klinikverbund`, `Betriebsnummer`, `Kv`; 10 → 16 Felder) — vermutlich der
  Standardfall für Kunden mit nur einem Arzt/einer Betriebsstätte, während
  `KUNDE_UNTERKONTO` mehrere Kombinationen je Kunde abbildet (Interpretation,
  nicht belegt).

**Deprecation** — `CRM_LEAD_CONFIG` ist im Export vom 2026-08-14 nicht mehr
enthalten (war bis 2026-08-02 registriert). `CRM_LEAD_CONFIG.md` als historische
Referenz mit deutlichem Hinweis am Seitenanfang erhalten, nicht gelöscht. Aus den
aktiven Tabellenlisten in `10-Tabellen/index.md`, `datenbank-ueberblick.md` und
`wiki/index.md` entfernt bzw. gesondert als „nicht mehr registriert" markiert.
`CRM_PROMPT_TEMPLATE.md` angepasst, da ihr vermuteter Verweis auf
`CRM_LEAD_CONFIG.Profile` ins Leere läuft.

**Update** — `CRM_LEAD` stark verschlankt (33 → 20 Felder; Export 2026-08-14):
entfallen u. a. `Adressid`/`Ansprechid` (die zuvor vermuteten FK-Kandidaten auf
`ADRESSEN`), `Kampid`, alle Aktions-/Wiedervorlagefelder; neu ist `Str`.
`CRM_LEAD.md` komplett überarbeitet, Schema-Historie dokumentiert statt der
entfallenen Felder stillschweigend zu löschen.

Übersichtsseiten aktualisiert: `10-Tabellen/index.md` (neue Gruppe
„Rezeptabrechnung", `_FIRMA` bei Kernentitäten, CRM-Gruppe bereinigt),
`00-Allgemeines/datenbank-ueberblick.md` (neue Sektion, Beziehungstext, Citations),
`00-Allgemeines/kontor-api-service.md` (Entitätenliste, Hinweis auf
nicht-monotones Wachstum der Registry), `wiki/index.md`. Entitätenzahl
durchgängig auf 26 aktualisiert.

## 2026-08-10

**Creation** — `raw/dab_registry.md` deutlich erweitert (Export 2026-08-10T10:19,
19 → 21 Entitäten). Drei Änderungsarten:

1. `ADRESSEN` bekommt zwei neue Felder `Geocode_lat`/`Geocode_lng` (decimal) —
   ergänzt in `ADRESSEN.md`.
2. Erstmals eine gespeicherte Prozedur in der Registry: `kon_dab_checkentityvalue`
   (keine Felder, keine Beziehungen gelistet). Neue Seite
   `00-Allgemeines/kon_dab_checkentityvalue.md` (`type: Integration`) — erstes
   registriertes DAB-Objekt, das keine Tabelle ist.
3. Neue Metadaten-Tabelle `SYS_DAB_METADATA` (`Entityname`/`Fieldname`/`Label`/
   `Ismandatory`/`Lookupentity`/`Hasproccheck`/…) beschreibt Felder anderer
   DAB-Entitäten — offenbar Teil der API-Infrastruktur, nicht des Fachschemas.
   Neue Seite `00-Allgemeines/SYS_DAB_METADATA.md` (`type: Referenz`). Vermuteter,
   nicht belegter Zusammenhang: `Hasproccheck = 1` löst vermutlich
   `kon_dab_checkentityvalue` aus.

Beide neuen Seiten unter `00-Allgemeines/` statt `10-Tabellen/` eingeordnet, da sie
laut Einordnungsregel 3 in `struktur.md` den „allgemeinen DB-Kontext bzw. API-Zugriff"
beschreiben, nicht Fachdaten.

**Decision** — Auch diesmal keine Auth-Seite angelegt, obwohl die Registry die
Permission-Anzeige von `anonymous:*` auf `Lesen und Schreiben` umgestellt hat
(auf allen Entitäten einheitlich) — weiterhin auf Nutzerwunsch zurückgestellt.

`00-Allgemeines/index.md`, `kontor-api-service.md` (neuer Abschnitt zu
Nicht-Tabellen-Entitäten und Selbstbeschreibung), `datenbank-ueberblick.md`
(Entitätenzahl, neuer Abschnitt „API-Infrastruktur"), `10-Tabellen/index.md` und
`wiki/index.md` auf 21 Entitäten nachgezogen.

## 2026-08-02

**Update** — `raw/dab_registry.md` erneut nachgezogen (Export 2026-08-02T13:40,
weiterhin 19 Entitäten): `WFLOW` bekommt drei neue Felder (`Sender`,
`ProcessingTime`, `Wrkstate`; 15 → 18 Felder), keine Beziehungsänderungen.
`Wrkstate` deckt vermutlich den in der Fachquelle erwähnten „Bearbeitungsstatus"
ab, der bisher keinem Feld zugeordnet werden konnte. `WFLOW.md` entsprechend
ergänzt.

**Update** — `raw/dab_registry.md` erneut nachgezogen (Export 2026-08-02T13:34,
weiterhin 19 Entitäten): `KUNDE` bekommt neues Feld `Anlagedatum` (datetime, 9 → 10
Felder). Sonst keine Änderungen. `KUNDE.md` entsprechend ergänzt.

**Update** — `raw/dab_registry.md` zweimal kurz hintereinander nachgezogen (Export
2026-08-02T10:31 und T10:33, weiterhin 19 Entitäten): `WFLOW` bekommt drei
registrierte Relationen (`WFLOW_WFLOW_INVOICINGUNIT_Invoicingunit`,
`WFLOW_PROJEKT_Projektnr`, `WFLOW_WFLOW_FOLDERS_Folder`), `PROJEKT` bekommt die
Relation `PROJEKT_KUNDE_Kundennr`. Alle vier Verweise, die zuvor auf den jeweiligen
Seiten als „fachlich, nicht registriert" dokumentiert waren, sind jetzt offizielle
DAB-Relationen — die Kette Aufgabe → Projekt → Kunde ist damit durchgehend
registriert.

Korrigiert: `WFLOW.md`, `WFLOW_FOLDERS.md`, `WFLOW_INVOICINGUNIT.md`, `PROJEKT.md`
(Beziehungsabschnitte von Vermutung auf registrierte Relation umgestellt),
`10-Tabellen/index.md` und `datenbank-ueberblick.md` (Beziehungsgrafik und Texte
entsprechend angepasst).

**Creation** — Zwei zusammenhängende Rohquellen verarbeitet:
`raw/dab_registry.md` (Export 2026-08-02T10:18, 16 → 19 Entitäten) und
`raw/# Tabellen der Aufgabenverwaltung W.md` (Fachtext zu `WFLOW`,
`WFLOW_FOLDERS`, `WFLOW_INVOICINGUNIT`). Die zehn zuvor dokumentierten und
sechs CRM/KONTAKTE-Tabellen sind inhaltlich unverändert.

Neue Konzeptseiten unter `10-Tabellen/`: `WFLOW.md`, `WFLOW_FOLDERS.md`,
`WFLOW_INVOICINGUNIT.md` — die Aufgabenverwaltung. Kernaussage der Fachquelle:
eine Aufgabe wird immer über ein Projekt zugeordnet, das Projekt referenziert den
Kunden, damit ist eine Aufgabe transitiv einem Kunden zurechenbar
(`WFLOW.Projektnr` → `PROJEKT.Projektnr` → `PROJEKT.Kundennr` → `KUNDE.Kundennr`,
durchgehend fachlich, keine registrierte Relation). Klargestellt: Die eigentlichen
Abrechnungsdaten (Datum, Anzahl, Art) liegen direkt in `WFLOW`
(`FinishedTime`/`InvoicingUnitCount`/`Invoicingunit`) — `WFLOW_INVOICINGUNIT` ist
nur die Code-Tabelle für die Art (`Unit`/`Name`), trotz leicht irreführender
Formulierung in der Fachquelle.

`PROJEKT.md` um den eingehenden Verweis von `WFLOW` ergänzt. `10-Tabellen/index.md`
um die Gruppe „Aufgabenverwaltung" erweitert; `wiki/index.md`,
`00-Allgemeines/datenbank-ueberblick.md` (neue Beziehungsgrafik WFLOW → PROJEKT →
KUNDE) und `00-Allgemeines/kontor-api-service.md` nachgezogen. Entitätenzahl
durchgängig auf 19 aktualisiert.

## 2026-08-01

**Creation** — Neue Rohquelle `raw/Informationen_Tabelle_Kontakte.md` (Fachtext zu
`KONTAKTE`) verarbeitet, zunächst als nicht in der Registry vorhandene Tabelle
dokumentiert (Seite `10-Tabellen/KONTAKTE.md`, ohne „Registriert im Kontor API
Service").

**Update** — Kurz darauf `raw/dab_registry.md` erneut aktualisiert (Export
2026-08-01T14:56, 15 → 16 Entitäten): `KONTAKTE` ist doch registriert, mit
vollständigem Schema (`Id`, `Betreff`, `Erfasser`, `Datum`, `Bemerkungen`, `Src`,
`Srcvalue`, PK `Id`). `KONTAKTE.md` entsprechend korrigiert — Schema ergänzt,
„nicht registriert"-Hinweis entfernt. `10-Tabellen/index.md`,
`datenbank-ueberblick.md`, `kontor-api-service.md` und `wiki/index.md` von einer
zwischenzeitlichen „außerhalb des API Service"-Kategorie auf reguläre Einordnung
unter „Notizen" korrigiert; Entitätenzahl durchgängig auf 16 aktualisiert.
`CRM_ACTIVITIES.md` verweist auf `KONTAKTE` als strukturell ähnliches
Diskriminator-Muster (`ParentType`/`ParentId` vs. `Src`/`Srcvalue`); keine
Beziehung zwischen beiden ist registriert oder anderweitig belegt.

**Update** — `raw/dab_registry.md` von 10 auf 15 Entitäten erweitert (Export
2026-08-01T09:08). Fünf neue Tabellen in zwei neuen Bereichen: CRM (`CRM_LEAD`,
`CRM_ACTIVITIES`, `CRM_LEAD_CONFIG`, `CRM_PROMPT_TEMPLATE`) und `PROJEKT`. Keine
der zehn bestehenden Tabellen hat sich inhaltlich verändert.

Neue Konzeptseiten unter `10-Tabellen/`: `CRM_LEAD.md`, `CRM_ACTIVITIES.md`,
`CRM_LEAD_CONFIG.md`, `CRM_PROMPT_TEMPLATE.md`, `PROJEKT.md`. Keine der vier
CRM-Tabellen hat in der Registry deklarierte Beziehungen — weder zu `ADRESSEN`/`KUNDE`
noch untereinander; naheliegende fachliche Verweise (`CRM_LEAD.Adressid/Ansprechid` →
`ADRESSEN`, `CRM_ACTIVITIES.ParentId` → vermutlich `CRM_LEAD`,
`CRM_PROMPT_TEMPLATE.Profile` → `CRM_LEAD_CONFIG.Profile`) sind auf den Seiten als
Vermutung markiert. Bei `PROJEKT` auffällig: `Rgadrid`/`Lieferadrid` sind dort
`bigint`, während dieselben Feldnamen in `KUNDE`/`ADRESSEN` `uniqueidentifier` sind —
als offene Typabweichung dokumentiert.

`10-Tabellen/index.md` um eine dritte Gruppe „CRM" ergänzt; `wiki/index.md`,
`00-Allgemeines/datenbank-ueberblick.md` (Beziehungsgrafik-Text, CRM als
unverbundener Bereich vermerkt) und `00-Allgemeines/kontor-api-service.md`
(Registry-Aufzählung) nachgezogen.

**Lint** — 15 Tabellen jetzt flach in `10-Tabellen/`; laut `struktur.md` ist eine
Gruppierung nach Fachbereich „ab einer gewissen Menge" vorgesehen. Der CRM-Bereich
ist ein guter Kandidat für einen eigenen Unterordner, falls weitere CRM-Tabellen
hinzukommen — noch nicht umgesetzt, da `struktur.md` das nicht vorgibt.

**Update** — Zwei neue Rohquellen verarbeitet: `raw/dab_registry.md` (Export
2026-08-01T07:14, `ADRESSEN` von 21 auf 26 Felder erweitert um `Isansprechpartner`,
`Firmenadressid`, `Hauptansprechpartner`, `Entscheider`, `Aktiv`) sowie
`raw/# Aufbau und Zuordnung von Adressen.md` (Fachtext zur Adresszuordnung).

`ADRESSEN.md` grundlegend überarbeitet: Schema um die fünf neuen Felder ergänzt,
neuer Abschnitt „Aufbau und Zuordnung von Adressen" (Firmenadressid als
vorrangiges Gruppierungskriterium vor `Kdliefnr`, Ansprechpartner-Kennzeichnung,
Aktiv-Flag). `datenbank-ueberblick.md` und `10-Tabellen/index.md`
(Kurzbeschreibung) nachgezogen.

## 2026-07-31

**Update** — Registry-Nachtrag (Export 2026-07-31T07:05): `ARTIK` bekommt Feld
`Katid nvarchar(50)` und die registrierte Relation `ARTIK_ARTIK_KATWERTE_Katid`
(one → `ARTIK_KATWERTE` über `Katid : Katid`). Jeder Artikel ist damit genau
einer Kategorie zugeordnet. Angepasst: `ARTIK.md` (neues Feld + Relation, Wegfall
der „nicht deklariert"-Anmerkung), `ARTIK_KATWERTE.md` (Isoliert-Note entfernt,
eingehender Verweis dokumentiert, Selbstreferenz `Katidparent` weiterhin nur
fachlich), `datenbank-ueberblick.md` (Beziehungsgrafik ergänzt).

**Update** — `raw/dab_registry.md` von 4 auf 10 Entitäten erweitert (Export 2026-07-31).

Neue Konzeptseiten unter `10-Tabellen/`: `ARTIK_WG1.md`, `ARTIK_WG2.md`,
`ARTIK_KATWERTE.md`, `KUNDE_GRP1.md`, `KUNDE_GRP2.md`, `VERTR.md`.

Bestehende Seiten nachgezogen: `ARTIK.md` (neue Relationen zu `ARTIK_WG1`/`ARTIK_WG2`,
Hinweis auf fehlende Verbindung zu `ARTIK_KATWERTE`), `KUNDE.md` (neues Feld
`Vertrnr`, drei neue Relationen zu `VERTR`/`KUNDE_GRP1`/`KUNDE_GRP2`),
`BUCH_UMSATZ.md` (Anmerkung, dass `Vertreter` fachlich auf `VERTR` zeigt, aber keine
DAB-Relation ist).

Übersichtsseiten aktualisiert: `wiki/index.md`, `00-Allgemeines/datenbank-ueberblick.md`
(neue Beziehungsgrafik, Trennung Kern- vs. Codetabellen), `00-Allgemeines/kontor-api-service.md`
(Registry-Aufzählung erweitert), `10-Tabellen/index.md` (zweigeteilte Übersicht).

## 2026-07-30

**Creation** — Erste Quelle `raw/dab_registry.md` eingelesen (DAB-Registry-Export,
Stand 2026-07-30). Neue Konzeptseiten:
`00-Allgemeines/datenbank-ueberblick.md`, `00-Allgemeines/kontor-api-service.md`,
`10-Tabellen/ADRESSEN.md`, `10-Tabellen/ARTIK.md`, `10-Tabellen/BUCH_UMSATZ.md`,
`10-Tabellen/KUNDE.md`. `wiki/index.md`, `00-Allgemeines/index.md` und
`10-Tabellen/index.md` nachgezogen.

**Decision** — Auf Nutzerwunsch keine Auth-Seite (`00-Allgemeines/authentifizierung.md`)
angelegt; in `struktur.md` bleibt sie als geplante Seite gelistet.

## 2026-07-29

**Creation** — Grundstruktur des Wikis nach Vorbild `Kontor MED v1` angelegt:
`wiki/index.md`, `log.md`, Bereiche `00-Allgemeines`, `10-Tabellen`, `20-Views`,
`90-Glossar` mit je eigener `index.md`. `struktur.md` und `CLAUDE.md` als
Schema-Grundlage ergänzt. Noch keine Konzeptseiten befüllt.
