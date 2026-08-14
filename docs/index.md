---
okf_version: "0.1"
---

# Kontor Datenbank Wiki

Persönliches Wissens-Wiki zur **Kontor Datenbank** — der SQL-Datenbank hinter dem ERP
**Kontor.MED** (Hersteller: codegarden software GmbH). Beschreibt die Datenbank aus
Entwickler- und Integrationssicht: Tabellen, Views und der Zugriff über den
**Kontor API Service**.

Für die Anwendersicht auf das ERP siehe das Schwesterwiki `Kontor MED v1`.

# Bereiche

| Bereich | Inhalt |
|---------|--------|
| [00 · Allgemeines](00-Allgemeines/index.md) | Datenbank-Überblick, Kontor API Service, Authentifizierung, Namenskonventionen |
| [10 · Tabellen](10-Tabellen/index.md) | Ein Konzeptdokument je Tabelle der Kontor Datenbank |
| [20 · Views](20-Views/index.md) | Ein Konzeptdokument je View der Kontor Datenbank |
| [90 · Glossar](90-Glossar/index.md) | Begriffe und Abkürzungen rund um DB und API |

# Einstieg

[Datenbank-Überblick](<00-Allgemeines/datenbank-ueberblick.md>) erklärt, was aktuell
dokumentiert ist. [Kontor API Service](<00-Allgemeines/kontor-api-service.md>) beschreibt
den HTTP-Zugriff (REST + GraphQL).

# Dokumentierter Ausschnitt

26 über den Kontor API Service exponierte Entitäten: sechs Kernentitäten mit
`BUCH_UMSATZ` als zentralem Bewegungsdatensatz, sechs Codetabellen für
Warengruppen, Kategorien, Kundengruppen und Vertreter, ein CRM-Bereich, die
Notiztabelle `KONTAKTE`, die Aufgabenverwaltung (`WFLOW`), die
Rezeptabrechnung (`REZ`) sowie zwei Objekte der API-Infrastruktur selbst.

- Kernentitäten: [ADRESSEN](<10-Tabellen/ADRESSEN.md>) · [ARTIK](<10-Tabellen/ARTIK.md>) · [BUCH_UMSATZ](<10-Tabellen/BUCH_UMSATZ.md>) · [KUNDE](<10-Tabellen/KUNDE.md>) · [PROJEKT](<10-Tabellen/PROJEKT.md>) · [_FIRMA](<10-Tabellen/_FIRMA.md>)
- Codetabellen: [ARTIK_WG1](<10-Tabellen/ARTIK_WG1.md>) · [ARTIK_WG2](<10-Tabellen/ARTIK_WG2.md>) · [ARTIK_KATWERTE](<10-Tabellen/ARTIK_KATWERTE.md>) · [KUNDE_GRP1](<10-Tabellen/KUNDE_GRP1.md>) · [KUNDE_GRP2](<10-Tabellen/KUNDE_GRP2.md>) · [VERTR](<10-Tabellen/VERTR.md>)
- CRM: [CRM_LEAD](<10-Tabellen/CRM_LEAD.md>) · [CRM_ACTIVITIES](<10-Tabellen/CRM_ACTIVITIES.md>) · [CRM_PROMPT_TEMPLATE](<10-Tabellen/CRM_PROMPT_TEMPLATE.md>) · [CRM_LEAD_CONFIG](<10-Tabellen/CRM_LEAD_CONFIG.md>) (nicht mehr registriert)
- Notizen: [KONTAKTE](<10-Tabellen/KONTAKTE.md>)
- Aufgabenverwaltung: [WFLOW](<10-Tabellen/WFLOW.md>) · [WFLOW_FOLDERS](<10-Tabellen/WFLOW_FOLDERS.md>) · [WFLOW_INVOICINGUNIT](<10-Tabellen/WFLOW_INVOICINGUNIT.md>)
- Rezeptabrechnung: [REZ](<10-Tabellen/REZ.md>) · [REZ_POS](<10-Tabellen/REZ_POS.md>) · [REZ_ABRECH](<10-Tabellen/REZ_ABRECH.md>) · [REZ_ABRECH_POS](<10-Tabellen/REZ_ABRECH_POS.md>) · [KUNDE_UNTERKONTO](<10-Tabellen/KUNDE_UNTERKONTO.md>)
- API-Infrastruktur: [SYS_DAB_METADATA](<00-Allgemeines/SYS_DAB_METADATA.md>) · [kon_dab_checkentityvalue](<00-Allgemeines/kon_dab_checkentityvalue.md>)

Beziehungsgrafik siehe [Datenbank-Überblick](<00-Allgemeines/datenbank-ueberblick.md>).

# Verwaltung

* [Log](log.md) — Chronologisches Änderungsprotokoll des Wikis
* [struktur.md](../struktur.md) — Verbindliche Zielstruktur
* [CLAUDE.md](../CLAUDE.md) — Konventionen und Workflows
