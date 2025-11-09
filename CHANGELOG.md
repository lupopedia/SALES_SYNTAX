---
title: SALESSYNTAX_CHANGELOG.md
agent_username: wolfie
date_created: 2025-11-09
last_modified: 2025-11-09
status: published
onchannel: 1
tags: [SYSTEM, DOCUMENTATION, LEGACY, CHANGELOG]
collections: [WHAT, WHEN, WHY, HOW]
in_this_file_we_have: [OVERVIEW, VERSION_3_7_1, VERSION_3_7_0, REFERENCES]
---

# Sales Syntax Changelog (Legacy Live Help Program)

This file tracks the GPL Sales Syntax lineage that now ships inside LUPOPEDIA. The livehelp module (Crafty Syntax → Sales Syntax → LUPOPEDIA) remains open source and fully documented so customers know which fixes landed in each release.

**License**: GPL v3.0  under LUPOPEDIA LLC  
**Program Scope**: Human operator live help with layered popups, channel routing, canned replies, and visitor tracking.

---

## VERSION_3_7_1 — 2025-11-09 (Security Patch & LUPOPEDIA Integration)

### Highlights

- Hardened every public visitor entry point (`livehelp.php`, `user_connect.php`, `user_chat_*`, `user_top.php`, `user_qa.php`) to reuse already-sanitized department/tab/offset integers before building redirects, query strings, or embedded JavaScript.
- Sanitized visitor-supplied hidden fields in lost-password and chat-color forms so remote widgets and password-reset flows cannot inject markup when rendered off-site.
- Refreshed the powered-by link in `livehelp_js.php`, allowing brand swaps to point directly to LUPOPEDIA while preserving the optional creditline toggle.
- Expanded the session fingerprinting ladder (`get_ipaddress`) to honor modern proxy/CDN headers, preferring public IPs and falling back safely so legacy installs maintain tracking accuracy.
- Packaged the release as the LUPOPEDIA migration baseline: the core now ships with the full Sales Syntax codebase, layered-pop-up heritage, and 3.7.1 security posture.
- Added LUPOPEDIA-side scaffolding: `livehelps` parent table (Migration 1071), CSV export guidance, and updated public docs (`public/crafty_syntax_evolved.php`, `public/what_was_crafty_syntax.php`) so operators understand the upgrade path.

### Recommended Action

- Apply 3.7.1 (latest GPL release) before migrating. PORTUNUS and LUPO warn or block imports when `livehelps.version = '3.7.0'`.
- After patching, regenerate CSV snapshots so `livehelps_rows.csv` reflects the sanitized schema and `version,3.7.1`.

---

## VERSION_3_7_0 — 2023-11-07 (PHP 8 Compatibility Sweep)

### Highlights

- Baked the previously “pro/unbranded” option into core so powered-by links can be removed directly from the HTML generator or department settings.
- Completed a PHP 8 readiness pass: converted all `each()` loops to `foreach`, normalized `Header()` → `header()`, supplied missing response-code parameters, ensured `mktime()` casts, and added default values for undefined variables encountered in empty result sets.
- Hardened runtime safety by checking for ghost sessions before dereferencing arrays, assigning defaults for `$hide`, and replacing the legacy `browser_info` class with the newer `Browser` helper.
- Moved `CTabBox` include calls into `data.php`, repaired department HTML generation to use the correct ordered arrays, and refreshed the hour parameter handling to avoid null notices under PHP 8.
- File footprint: essentially every PHP asset was touched (`FILES CHANGED: ALL OF THEM`), with no schema alterations (`DATABASE ALTERATIONS: NONE`).

### Status

- **Legacy baseline**: Still functional but missing the minor reflected XSS fixes and documentation polish delivered in 3.7.1.
- **Upgrade path**: Apply 3.7.1 (latest GPL release) before migrating into LUPOPEDIA; see `md_files/1_wolfie/livehelp_module.md` and `public/crafty_syntax_evolved.php` for patch workflow.

---

## VERSION_3_6_2 — 2017-02-17 (Security Patch & UX Fixes)

### Highlights

- Patched SQL injection spots tied to `$aftertime` and `$typeof`, coercing inputs with `intval()` and adding guard clauses around the write-div handler.
- Smoothed out the “bubble window” template: adjusted window dimensions, ensured chat sounds trigger when visitors request a session, and tidied department refresh logic.
- Updated live help admin refresh code (`admin_users_refresh.php`, `admin_users_xmlhttp.php`) and core helpers (`functions.php`, `livehelp_js.php`, `iphone/functions.php`) to keep real-time views synchronized.

### Status

- No schema changes required (`DATABASE ALTERATIONS: NONE`); recommended as the minimum security level for pre-3.7 installations still on PHP 7-era hosting.

---

## VERSION_3_6_1 — 2016-06-21 (Leads & Offline Invite Enhancements)

### Highlights

- Introduced a dedicated leads tab plus offline layer invites so operators can capture visitor details—even when no human is online.
- Expanded tooling (`autolead.php`, `autoinvite.php`, `sendemail.php`, `createemail.php`, `leads.php`) and refreshed navigation/admin views to surface the new workflow.
- Added `offline` flag to `livehelp_autoinvite` and created the supporting `livehelp_leads`, `livehelp_emails`, and `livehelp_emailque` tables for long-term contact management.
- Bundled themed assets (`layer_invites/layer-Help_buttonoffline.*`) so the invite CTA matches the extended lead collection experience.

### Status

- Represents the start of the CRM-oriented roadmap; later releases (3.7.x) build on this foundation while resolving security gaps and modernizing the runtime.

---

## VERSION_3_5_4 — 2016-05-28 (CRM Interface Refresh)

### Highlights

- Rolled out a visual refresh (new logo, login background) and exposed tabs for CRM linkage, support tickets, lead management, and operator wall posts.
- Updated both MySQL and MySQLi drivers (`class/mysql_db.php`, `class/mysqli_db.php`, plus mobile variants) and tuned setup/config scripts to support the expanded modules.

### Status

- Served as the UX bridge into the CRM era; later 3.6.x releases layered in lead databases and offline invites.

---

## VERSION_3_5_3 — 2016-03-30 (MySQL → MySQLi Migration)

### Highlights

- Converted the legacy `mysql_*` calls to `mysqli_*`, providing PHP 5/7 compatibility without altering the surrounding business logic.
- Focused change set around database abstraction classes and supporting helpers; no schema adjustments required.

### Status

- Required baseline for any installation targeting PHP 5.6+ or modern shared hosting environments.

---

## VERSION_3_5_2 — 2015-12-02 (HTML5 Audio Default)

### Highlights

- Switched the default alert sound implementation to HTML5 `<audio>` (with fallback options for legacy browsers), reducing QuickTime/plug‑in dependencies.
- Touched core notification scripts to ensure audio playback continuity across operator consoles.

### Status

- Recommended upgrade for operators relying on browser-based audio cues; no database changes.

---

## VERSION_3_5_1 — 2015-11-28 (Brand Transition Release)

### Highlights

- Updated system messaging and configuration references to align with the lupopedia.com domain transition and security posture.
- Prepared the codebase for the upcoming CRM and lead-management additions that landed in 3.5.4+.

### Status

- Acts as the housekeeping release before the CRM-focused 3.5.4 refresh.

---

## VERSION_3_4_7 — 2013-08-15 (CRM Data Capture)

### Highlights

- Added CRM capture tools so visitor data can be collected even when operators are offline.
- Integrated the new workflow across setup pages and reporting dashboards.

### Status

- Marks the first appearance of CRM hooks that later 3.5.x/3.6.x builds expand into full lead management.

---

## VERSION_3_4_6 — 2013-04-23 (Unbranded 3.4.4 Build)

### Highlights

- Delivered an unbranded variant of 3.4.4 so customers could run live help without the standard credit line.

### Status

- Shares code with 3.4.4; use when brand-neutral deployments are required.

---

## VERSION_3_4_5 — 2013-04-23 (Mobile 3.4.4 Build)

### Highlights

- Packaged 3.4.4 for mobile environments, ensuring templates and assets render cleanly on phones and tablets.

### Status

- Recommended for teams targeting mobile-first deployments; otherwise functionally identical to 3.4.4.

---

## VERSION_3_4_4 — 2013-04-23 (Security Release)

### Highlights

- Fixed two very minor vulnerabilities: remote file include exposure in `admin.php` (operator scope) and full path disclosure in `xmlhttp.php`.
- Updated template logic and helper scripts to enforce stricter page routing rules and sanitize `whattodo` parameters.

### Status

- Required baseline for any 3.4.x installation; patch instructions appear in the original changelog (manual edits plus guard clauses).

---

## VERSION_3_4_1 — 2013-01-19 (Reporting Fixes)

### Highlights

- Resolved bar-chart duplication in visitor analytics when departments overlapped.
- Corrected the version indicator so the UI shows the proper release number.

### Status

- Light maintenance build; ensures analytics dashboards remain accurate before the 3.4.4 security patch.

---

## VERSION_3_3_8 — 2012-08-05 (Visitor Paging & XSS Fix)

### Highlights

- Corrected department-aware pagination so the “data” tab no longer shows duplicate bars when browsing visitors.
- Patched a cross-site scripting issue in `livehelp_js.php`; accompanying updates landed in `setup.php`, `data_visits.php`, and `navigation.php`.

### Status

- Security-sensitive build; roll up critical fixes before extending visitor analytics further.

---

## VERSION_3_3_8 (Mobile/No-Link Variants) — 2012-06-02

### Highlights

- Published the “no backlink” (3.3.8) and “mobile” (3.3.7) variants of the 3.3.6 codebase for customers needing brand-free or mobile-optimized deployments.

### Status

- Functionally equivalent to 3.3.6 aside from packaging differences.

---

## VERSION_3_3_6 — 2012-06-02 (Operator Experience Polishing)

### Highlights

- Fixed operator creation so display names show correctly on first login and added the `maxrequests`/`deny agents` throttles for bots.
- Enhanced icon credit styling and department selection within visitor/referer data tabs.

### Status

- Includes configuration fields (`ignoreagent`, `maxrequests`) that later CRM and security updates rely on.

---

## VERSION_3_3_5 / 3.3.4 / 3.3.3 — 2012-05-29 (Leads & Dept Analytics)

### Highlights

- Released no-link (3.3.5) and mobile (3.3.4) builds alongside core 3.3.3, which overhauled analytics (department-aware data tabs, dynamic HTML generation) and added the `ignoreagent`/`maxrequests` columns to `livehelp_config`.
- Introduced department selection, cleaned shorthand PHP tags, and improved robot throttling for high-traffic sites.

### Status

- Mandatory upgrade for installations facing analytics accuracy issues or resource strain from crawlers.

---

## VERSION_3_3_0 — 2012-04-24 (Timeout & Website Segmentation)

### Highlights

- Added timeouts and auto-logout controls for operators, plus per-website department visibility settings.
- Introduced the `livehelp_websites` table and added timestamps/department fields needed for multi-site routing.

### Status

- Foundation for multi-site deployments; required before adopting the lead-management features that followed.

---

## VERSION_3_2_5 — 2012-04-20 (No-Backlink Release)

### Highlights

- Delivered a backlink-free build for customers needing white-label deployments while retaining 3.2.3 functionality.

### Status

- Companion to the 3.2.3 improvements; use when licensing terms require removing the credit link.

---

## VERSION_3_2_4 — 2012-04-20 (Mobile Release)

### Highlights

- Packaged 3.2.3 for mobile use, adapting templates and scripts to render on smartphones.

### Status

- Base for mobile deployments; pair with 3.2.3 schema changes.

---

## VERSION_3_2_3 — 2012-04-20 (Session Stability & Geo Lookup)

### Highlights

- Fixed missing tables during setup (e.g., `livehelp_sessions`), ensured external chat windows close when visitors depart, added operator display names, and integrated geo-IP lookup in chat details.
- Updated generated HTML to meet XHTML 1.0 Transitional standards and touched core scripts (`setup.php`, `operators.php`, `details.php`) accordingly.

### Status

- Must-have for sites encountering session errors or wanting geo-location context in transcripts.

---

## VERSION_3_2_2 — 2012-04-04 (No-Backlink Variant)

### Highlights

- Provided a credit-free package mirroring 3.2.0 functionality for customers needing white labeling.

### Status

- Mirrors 3.2.0; choose based on branding requirements.

---

## VERSION_3_2_1 — 2012-04-04 (Mobile Helper Fix)

### Highlights

- Fixed Windows-hosted helper files so the mobile/iPhone apps function correctly; packaged as the mobile edition of 3.2.0.

### Status

- Required for Windows deployments using the companion mobile app.

---

## VERSION_3_2_0 — 2012-04-04 (Performance & Localization)

### Highlights

- Upgraded `client_visitors.php`, fixed undefined variables, added indexes to hot tables, modernized layer rendering (replacing the 1999 Dynamic Layer library), and refreshed the Portuguese (Brazil) language pack.
- Applied helper fixes for iPhone/mobile directories and broadened timezone handling in settings.

### Status

- Major maintenance uplift; establishes the baseline for all subsequent 3.2.x tweaks.

---

## VERSION_3_1_11 / 3.1.10 / 3.1.9 — 2012-03-25 (Brand & Stability Tweaks)

### Highlights

- Released the no-backlink (3.1.11) and mobile (3.1.10) variants; 3.1.9 fixed multi-department icon handling, added dark/light credit link options, and ensured chat icons respect “hide when offline”.

### Status

- Recommended for customers running multi-department widgets or needing branded credit image options.

---

## VERSION_3_1_8 — 2012-03-08 (Unbranded Edition)

### Highlights

- Removed “Powered by Sales Syntax” links from themes, chat icons, and the donation prompt, creating a fully unbranded 3.1.7 build.

### Status

- Ideal for OEM deployments prior to the 3.2.x series.

---

## VERSION_3_1_7 — 2012-03-08 (Display Name & Mobile Input Fix)

### Highlights

- Fixed missing `displayname` field errors, improved mobile input handling, and released the mobile variant of 3.1.6.

### Status

- Important for organizations with dual desktop/mobile operator workflows.

---

## VERSION_3_1_6 — 2012-03-07 (Operator Presence & Cleanup)

### Highlights

- Polished the operator availability logic, cleaned out unused `showpopout` code, refreshed `invite.php`, and rebuilt the help documentation.

### Status

- Sets the stage for the 3.1.7 mobile/unbranded updates; ensure this release is in place before layering subsequent patches.

---

## REFERENCES

- `md_files/1_wolfie/livehelp_module.md` — Live help module overview and migration flow.
- `database/migrations/1069_create_livehelp_legacy_tables.sql` — Legacy sales syntax base tables.
- `database/migrations/1071_2025_11_09_livehelps_create_parent_table.sql` — Parent configuration table with seed record.
- `CHANGELOG.md` — LUPOPEDIA platform changelog (see “Livehelp Parent Table & Documentation” entry).
- `public/crafty_syntax_evolved.php` — Customer-facing continuity and upgrade instructions.

---

**Maintainer**: PORTUNUS Migration Steward  
**Contact**: migration@lupopedia.com  
**Last Reviewed**: 2025-11-09 (Captain WOLFIE)

---

> Historical Note: For release notes covering **2002-12-21 through 2012-03-07**, refer to the original `README_FILES/` changelog bundled with each Sales Syntax installation.



