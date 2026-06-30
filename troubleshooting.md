# Troubleshooting Notes

This file documents issues encountered while building the Terraform Azure Module Library and how they were resolved.

## Issue 1: Terminal entered heredoc prompt

### What happened

The terminal displayed `heredoc>` while creating files with cat.

### Cause

The shell was waiting for the closing EOF marker.

### Resolution

Typed `EOF` by itself on a new line and pressed Enter.

## Issue 2: Terminal entered bquote prompt

### What happened

The terminal displayed `bquote>`.

### Cause

Markdown backticks from a code block were accidentally pasted into the terminal.

### Resolution

Pressed Control + C to cancel the unfinished command, then pasted only the shell commands.

## Issue 3: AKS module showed deprecated argument warning

### What happened

Terraform validation showed a warning for `managed = true` inside the AKS Azure AD RBAC block.

### Cause

The AzureRM v3.x provider still accepts the argument, but warns that it will be removed or defaulted in a future provider version.

### Resolution

The argument was kept for compatibility with the selected AzureRM provider version because removing it caused Terraform validation errors.

### Lesson Learned

A provider deprecation warning does not always mean the argument can be removed immediately. Compatibility should be checked against the provider version being used.

## Issue 4: Empty folders did not appear in Git status

### What happened

The `vault-infra/` and `screenshots/` folders did not appear in git status.

### Cause

Git does not track empty folders.

### Resolution

This is expected. These folders will be tracked once files are added.
