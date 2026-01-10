#!/bin/bash

# Clarify Ralph Setup Script
# Creates state file for requirement clarification loop

set -euo pipefail

# Parse arguments
REQUIREMENT_PARTS=()
MAX_ITERATIONS=10

while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
      cat << 'HELP_EOF'
Clarify Ralph - Iterative requirement clarification

USAGE:
  /clarify-ralph [REQUIREMENT...] [OPTIONS]

ARGUMENTS:
  REQUIREMENT...    The vague requirement to clarify (can be multiple words)

OPTIONS:
  --max-iterations <n>    Maximum questions before auto-stop (default: 10)
  -h, --help              Show this help message

DESCRIPTION:
  Starts a clarification loop that uses AskUserQuestion to iteratively
  resolve ambiguities in your requirement. Each iteration asks ONE question.

  The loop stops when:
  - User selects "Clarification complete" option
  - Max iterations reached

EXAMPLES:
  /clarify-ralph Add a login feature
  /clarify-ralph Build a REST API --max-iterations 15
  /clarify-ralph "Fix the export bug" --max-iterations 5

OUTPUT:
  When complete, outputs a Before/After comparison showing:
  - Original vague requirement
  - Clarified specification with all decisions made
HELP_EOF
      exit 0
      ;;
    --max-iterations)
      if [[ -z "${2:-}" ]]; then
        echo "Error: --max-iterations requires a number" >&2
        exit 1
      fi
      if ! [[ "$2" =~ ^[0-9]+$ ]]; then
        echo "Error: --max-iterations must be a positive integer, got: $2" >&2
        exit 1
      fi
      MAX_ITERATIONS="$2"
      shift 2
      ;;
    *)
      REQUIREMENT_PARTS+=("$1")
      shift
      ;;
  esac
done

# Join requirement parts
REQUIREMENT="${REQUIREMENT_PARTS[*]}"

# Validate requirement
if [[ -z "$REQUIREMENT" ]]; then
  echo "Error: No requirement provided" >&2
  echo "" >&2
  echo "Examples:" >&2
  echo "  /clarify-ralph Add user authentication" >&2
  echo "  /clarify-ralph Fix the export bug --max-iterations 5" >&2
  exit 1
fi

# Create state file
mkdir -p .claude

cat > .claude/clarify-ralph.local.md <<EOF
---
active: true
iteration: 1
max_iterations: $MAX_ITERATIONS
original_requirement: "$REQUIREMENT"
started_at: "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
---

## Original Requirement
"$REQUIREMENT"

## Clarification Progress
(Decisions will be recorded as the loop progresses)

EOF

# Output setup message
cat <<EOF
Clarify Ralph loop activated!

Original Requirement: "$REQUIREMENT"
Max Questions: $MAX_ITERATIONS
Completion: User confirms "Clarification complete" OR max iterations reached

The stop hook is now active. After each question-answer cycle, the loop
continues until you select "Clarification complete" or reach the limit.

To monitor: cat .claude/clarify-ralph.local.md
To cancel: /cancel-clarify

---

## Requirement to Clarify
"$REQUIREMENT"

Begin by identifying ambiguities and asking your first clarifying question using AskUserQuestion.
EOF
