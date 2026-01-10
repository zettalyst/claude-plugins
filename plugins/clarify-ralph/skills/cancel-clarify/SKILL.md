---
name: cancel-clarify
description: Cancel active clarify-ralph loop
---

# Cancel Clarify Ralph Loop

When this skill is invoked, cancel the active clarification loop by:

1. Delete the state file: `.claude/clarify-ralph.local.md`
2. Confirm cancellation to the user

Execute:
```bash
rm -f .claude/clarify-ralph.local.md
```

Then inform the user:
```
Clarify Ralph loop cancelled.

You can now exit the session normally or start a new loop with /clarify-ralph.
```
