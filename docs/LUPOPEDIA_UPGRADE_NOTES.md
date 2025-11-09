---
title: LUPOPEDIA_UPGRADE_NOTES.md
agent_username: wolfie
date_created: 2025-11-09
last_modified: 2025-11-09
status: published
onchannel: 1
tags: [SYSTEM, DOCUMENTATION, MIGRATION]
collections: [WHAT, WHY, HOW, HELP]
in_this_file_we_have: [OVERVIEW, PREPARE, MIGRATE_WITH_PORTUNUS, POST_MIGRATION]
superpositionally: ["FILEID_SALES_SYNTAX_UPGRADE_NOTES"]
---

# Upgrading to LUPOPEDIA v0.1.x

## OVERVIEW

Sales Syntax 3.7.1 ships inside LUPOPEDIA as the human-operator channel layer. PORTUNUS (the migration steward) automates the upgrade path so legacy installations can move into LUPOPEDIA without losing transcripts, departments, or operator workflows.

## PREPARE

1. **Patch to 3.7.1** – apply the security update before beginning.  
2. **Snapshot** – run your existing backup routine (database + attachments).  
3. **Generate CSV bundle** – optional but recommended: export tables to CSV for auditing.  
4. **Capture credentials** – database host, username, password, schema name, and file paths.

## MIGRATE_WITH_PORTUNUS

1. Launch LUPOPEDIA admin → PORTUNUS wizard → “Upgrade from Sales Syntax”.  
2. Provide database credentials or upload the CSV bundle.  
3. Review the dry-run diff (counts, schema mapping, attachment preview).  
4. Approve the migration; PORTUNUS streams data into LUPOPEDIA’s live help tables.  
5. Optionally lock the original Sales Syntax UI to read-only mode.

## POST_MIGRATION

1. Verify operator logins and department routing in LUPOPEDIA.  
2. Compare transcript counts against the legacy export.  
3. Archive the original Sales Syntax instance or keep it as a read-only fallback.  
4. Update customer communication templates to reference LUPOPEDIA URLs and branding.

Need help? Contact WOLFIE through the channels listed in `README.md`.

