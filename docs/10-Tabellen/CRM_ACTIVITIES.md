---
type: Entität
title: CRM_ACTIVITIES
description: Generisches Aktivitäten-/Verlaufsprotokoll im CRM, polymorph über ParentType/ParentId verknüpft.
tags: [tabelle, crm, aktivitaeten]
timestamp: 2026-08-01
---

Tabelle `dbo.CRM_ACTIVITIES` — protokolliert CRM-Aktivitäten (z. B. Anrufe, E-Mails,
Notizen) als Zeitverlauf. Die Verknüpfung zum Bezugsobjekt läuft polymorph über
`ParentType` + `ParentId`, ergänzt um feste Felder `ContactId` und `AccountId`.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `ActivityId` (`uniqueidentifier`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| ActivityId | uniqueidentifier | no | PK |
| CreatedAt | datetime | no | |
| ActivityType | nvarchar(50) | no | Art der Aktivität (Anruf, E-Mail, Notiz, …) |
| ResourceId | nvarchar(255) | yes | Bedeutung ungeklärt |
| Subject | nvarchar(255) | yes | Betreff |
| Description | nvarchar(255) | yes | |
| Weblink | nvarchar(255) | yes | |
| Sender | nvarchar(255) | yes | |
| Receiver | nvarchar(255) | yes | |
| CreatedByUserId | nvarchar(50) | yes | Ersteller; Verweis auf Benutzertabelle noch nicht dokumentiert |
| ParentType | nvarchar(50) | yes | Diskriminator für die polymorphe Verknüpfung (z. B. „Lead") |
| ParentId | nvarchar(50) | yes | ID des Bezugsobjekts, abhängig von `ParentType` |
| ContactId | nvarchar(50) | yes | Vermutlich Verweis auf [ADRESSEN](<ADRESSEN.md>).`Id` (als Text) |
| AccountId | nvarchar(50) | yes | Vermutlich Verweis auf [KUNDE](<KUNDE.md>) oder `ADRESSEN.Firmenadressid` |
| Direction | nvarchar(10) | yes | Richtung (eingehend/ausgehend) |
| IsSystem | bit | yes | Systemgenerierter Eintrag |
| IsDeleted | bit | yes | Soft-Delete-Flag |

**Ungeklärt:** konkrete Werte von `ParentType` und die dadurch adressierten Zieltabellen
(Kandidat: `CRM_LEAD`); genaue Bedeutung von `ResourceId`.

Das gleiche Verknüpfungsmuster (Diskriminator + Fremdschlüssel-Wert statt fester FK)
verwendet auch [KONTAKTE](<KONTAKTE.md>) (`Src`/`Srcvalue`) — dort allerdings ohne
Registry-Eintrag. Ob beide Tabellen zusammenhängen, ist ungeklärt.

# Beziehungen

In der Registry sind an dieser Tabelle **keine Beziehungen** deklariert — weder die
polymorphe Verknüpfung über `ParentType`/`ParentId` noch `ContactId`/`AccountId`.

# Citations

- `../../raw/dab_registry.md`
