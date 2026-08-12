#!/bin/bash

# Helper script to run tests and open reports

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Detect OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OPEN_CMD="xdg-open"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OPEN_CMD="open"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    OPEN_CMD="start"
else
    OPEN_CMD="echo"
    echo -e "${YELLOW}Could not detect OS. Reports will be generated but not opened automatically.${NC}"
fi

echo -e "${BLUE}╔════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Robot Framework Test Runner                  ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════╝${NC}"
echo ""

# Parse arguments
TEST_PATH="${1:-tests/}"
DRY_RUN="${2:-false}"

if [[ "$DRY_RUN" == "--dryrun" || "$DRY_RUN" == "-d" ]]; then
    echo -e "${YELLOW}Running in DRY RUN mode (syntax validation only)${NC}"
    robot --dryrun "$TEST_PATH"
    echo -e "${GREEN}✓ Syntax validation passed!${NC}"
    exit 0
fi

# Run tests
echo -e "${BLUE}Running tests from: $TEST_PATH${NC}"
echo ""

if robot "$TEST_PATH"; then
    echo ""
    echo -e "${GREEN}✓ Tests completed successfully!${NC}"
else
    echo ""
    echo -e "${YELLOW}⚠ Some tests failed. Check log.html for details.${NC}"
fi

echo ""
echo -e "${BLUE}╔════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Reports Generated                            ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════╝${NC}"
echo ""

# List generated files
if [[ -f "report.html" ]]; then
    echo -e "${GREEN}✓ report.html${NC} (Summary report)"
fi

if [[ -f "log.html" ]]; then
    echo -e "${GREEN}✓ log.html${NC} (Detailed log with screenshots)"
fi

if [[ -f "output.xml" ]]; then
    echo -e "${GREEN}✓ output.xml${NC} (Machine-readable results)"
fi

echo ""
echo "Opening reports in browser..."
echo ""

# Open reports
if [[ -f "report.html" ]]; then
    $OPEN_CMD report.html &
    echo -e "${GREEN}→ report.html${NC}"
fi

if [[ -f "log.html" ]]; then
    $OPEN_CMD log.html &
    echo -e "${GREEN}→ log.html${NC}"
fi

echo ""
echo -e "${BLUE}For more information, see REPORTS.md${NC}"
