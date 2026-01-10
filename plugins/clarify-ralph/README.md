# Clarify Ralph

Iterative requirement clarification using AskUserQuestion in a Ralph Wiggum-style loop.

Transform vague requirements into precise, actionable specifications through structured questioning.

## Installation

```bash
claude plugin add yuhogyun/claude-plugins --subdir plugins/clarify-ralph
```

Or install from local directory:

```bash
claude plugin add ./plugins/clarify-ralph
```

## Quick Start

```bash
/clarify-ralph "Add a login feature" --max-iterations 10
```

Claude will iteratively ask clarifying questions until:
- You select "Clarification complete"
- Max iterations reached

## Commands

| Command | Description |
|---------|-------------|
| `/clarify-ralph` | Start clarification loop |
| `/cancel-clarify` | Cancel active loop |
| `/help` | Show detailed help |

## Usage

### Basic Usage

```bash
/clarify-ralph Add user authentication
```

### With Max Iterations

```bash
/clarify-ralph Build a REST API --max-iterations 15
```

### Quoted Requirements

```bash
/clarify-ralph "Fix the bug where exports fail" --max-iterations 5
```

## How It Works

```
┌─────────────────────────────────────────────────────┐
│  /clarify-ralph "Add a login feature"               │
└──────────────────────┬──────────────────────────────┘
                       │
                       ▼
┌─────────────────────────────────────────────────────┐
│  Iteration 1: Claude asks clarifying question       │
│  "Which authentication method?"                     │
│  - Username/Password                                │
│  - OAuth                                            │
│  - Clarification complete                           │
└──────────────────────┬──────────────────────────────┘
                       │ User selects option
                       ▼
┌─────────────────────────────────────────────────────┐
│  Iteration 2: Claude asks next question             │
│  "Include registration?"                            │
│  - Yes, self-signup                                 │
│  - No, admin only                                   │
│  - Clarification complete                           │
└──────────────────────┬──────────────────────────────┘
                       │ User selects "Clarification complete"
                       ▼
┌─────────────────────────────────────────────────────┐
│  Output: Before/After Summary                       │
│  <promise>CLARIFICATION COMPLETE</promise>          │
└─────────────────────────────────────────────────────┘
```

## Example Session

```
> /clarify-ralph Add a login feature --max-iterations 10

Clarify Ralph loop activated!
Original Requirement: "Add a login feature"
Max Questions: 10

---

[Claude]: Which authentication method should we use?
  1. Username/Password (Recommended)
  2. OAuth (Google, GitHub, etc.)
  3. Magic link (email-based)
  4. Clarification complete

[You]: Username/Password

[Claude]: Should user registration be included?
  1. Yes, self-signup with email verification
  2. No, admin creates accounts
  3. Invitation-only registration
  4. Clarification complete

[You]: Yes, self-signup with email verification

[Claude]: What session duration is appropriate?
  1. 24 hours
  2. 7 days with "remember me" option
  3. Until browser close
  4. Clarification complete

[You]: Clarification complete

---

## Requirement Clarification Summary

### Before (Original)
"Add a login feature"

### After (Clarified)
**Goal**: Add username/password login with self-registration
**Reason**: Allow users to create accounts and access the system
**Scope**: Login, logout, registration with email verification
**Constraints**: Username/password auth, self-signup enabled
**Success Criteria**: Users can register, verify email, login, logout

**Decisions Made**:
| Question | Decision |
|----------|----------|
| Auth method | Username/Password |
| Registration | Yes, self-signup with email verification |

<promise>CLARIFICATION COMPLETE</promise>
```

## Ambiguity Categories

The loop probes these areas:

| Category | Questions |
|----------|-----------|
| **Scope** | What's included? Excluded? |
| **Behavior** | Edge cases? Error handling? |
| **Interface** | Who interacts? How? |
| **Data** | Inputs? Outputs? Format? |
| **Constraints** | Performance? Compatibility? |
| **Priority** | Must-have vs nice-to-have? |
| **Reason** | Why? What problem does it solve? |
| **Success** | How to verify completion? |

## Completion Conditions

The loop ends when:
1. **User confirms**: Select "Clarification complete" option
2. **Max iterations**: Reach `--max-iterations` limit
3. **Manual cancel**: Run `/cancel-clarify`

## Philosophy

Inspired by:
- **Clarify skill**: Structured requirement refinement
- **Ralph Wiggum technique**: Persistent iteration loops

Key principles:
- **One question at a time**: Focused, not overwhelming
- **Options over open-ended**: Recognition beats recall
- **User controls completion**: Loop until YOU decide it's done
- **Safety limit**: Max iterations prevents infinite loops

## File Structure

```
plugins/clarify-ralph/
├── .claude-plugin/
│   └── plugin.json          # Plugin metadata
├── commands/
│   ├── clarify-ralph.md     # Main command
│   ├── cancel-clarify.md    # Cancel loop
│   └── help.md              # Help documentation
├── hooks/
│   ├── hooks.json           # Hook configuration
│   └── stop-hook.sh         # Loop continuation logic
├── scripts/
│   └── setup-clarify-ralph.sh  # Setup script
└── README.md
```

## Troubleshooting

### Loop doesn't continue
Check if state file exists:
```bash
cat .claude/clarify-ralph.local.md
```

### Cancel a stuck loop
```bash
/cancel-clarify
# or manually:
rm .claude/clarify-ralph.local.md
```

### Check current iteration
```bash
grep '^iteration:' .claude/clarify-ralph.local.md
```

## License

MIT
