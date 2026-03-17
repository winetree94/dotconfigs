---
name: git-commit-push
description: Git commit and push workflow. Stages changes, generates a conventional commit message, commits, and pushes to the remote. Use when the user wants to commit and push code changes.
---

# Git Commit & Push

Automated workflow for analyzing changes, creating well-organized commits, and pushing to remote.

## Workflow

Follow these steps in order:

### 1. Review Recent Commit History

```bash
git log --oneline -10
```

Check the last 10 git commits to understand the project's commit message style and conventions. Follow the same format, tone, and structure for consistency.

### 2. Analyze Current Changes

```bash
git status
git diff
git diff --cached
```

- If there are no changes (working tree clean), notify the user and stop.
- Review both unstaged and staged changes to understand all modifications.
- Group related changes by their purpose (e.g., feature work, bug fixes, documentation, refactoring).

### 3. Split Commits by Purpose

- Do NOT create a single commit for unrelated changes.
- Create separate commits for each logical unit of work.
- Each commit should be atomic and represent a single purpose.

For each logical group of changes:

```bash
# Stage related files together
git add <file1> <file2>

# Commit with appropriate message
git commit -m "<type>: <summary>"
```

Repeat for each group until all changes are committed.

### 4. Commit Message Format

Use a conventional commit prefix:

| Type | Description |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation changes |
| `chore` | Maintenance tasks, dependency updates |
| `refactor` | Code refactoring without behavior change |
| `style` | Formatting, whitespace changes |
| `test` | Adding or updating tests |
| `i18n` | Internationalization changes |
| `perf` | Performance improvement |
| `build` | Build system or external dependency changes |
| `ci` | CI configuration changes |
| `revert` | Reverts a previous commit |

**Rules:**
- Write concise, descriptive messages focusing on **"why"** rather than "what"
- Use imperative mood (e.g., "add feature" not "added feature")
- Keep the subject line under 72 chars, lowercase, no period
- All commit messages MUST be written in English
- Use clear, professional technical English

**Examples:**
- `feat: add user profile page`
- `fix: resolve timeout error during login`
- `docs: add installation guide to README`
- `refactor: extract authentication logic into separate module`
- `i18n: add Korean translations for settings page`

### 5. Push to Remote

After all commits are created, determine the current branch and push:

```bash
git branch --show-current
git push origin <branch>
```

If the remote branch doesn't exist yet:

```bash
git push -u origin <branch>
```

### 6. Verify

```bash
git log --oneline -5
```

Confirm all commits were pushed successfully.

## Error Handling

- If `git push` fails due to remote changes, suggest `git pull --rebase` first
- If there are merge conflicts, help the user resolve them before retrying
- If authentication fails, suggest checking credentials or SSH keys

## Notes

- Always review commit history first to match project conventions
- Always show the diff summary before committing
- Never force push (`--force`) unless explicitly requested by the user
- Split unrelated changes into separate atomic commits
