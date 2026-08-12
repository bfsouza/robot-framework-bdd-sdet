# 📊 Accessing Test Reports

## 🏠 Local Execution

### After Running Tests Locally

When you execute `robot tests/`, three files are generated in your project root:

```
project-root/
├── report.html          ← Summary report (START HERE)
├── log.html             ← Detailed log with screenshots
└── output.xml           ← Machine-readable results
```

### View Reports Locally

**Method 1: Direct Browser Open**
```bash
# On Linux/WSL:
xdg-open report.html
xdg-open log.html

# On macOS:
open report.html
open log.html

# On Windows:
start report.html
start log.html
```

**Method 2: Using VS Code**
1. Open the file explorer in VS Code
2. Right-click on `report.html`
3. Select "Open with Live Server" (if installed)
4. Or click "Open in Default Browser"

**Method 3: Local Web Server**
```bash
# Start a simple server
python -m http.server 8000

# Then visit in your browser
http://localhost:8000/report.html
http://localhost:8000/log.html
```

---

## ☁️ CI/CD Execution (GitHub Actions)

### Workflow Overview

The `.github/workflows/robot-ci.yml` file:
1. Triggers on every `push` and `pull_request` to `main`
2. Installs dependencies (Python, Robot Framework, Playwright)
3. Runs all tests in `tests/` directory
4. **Uploads artifacts** (reports) to GitHub

### Accessing CI/CD Reports

**Step 1: Navigate to GitHub Actions**
```
Repository → Actions tab → Select latest workflow run
```

**Step 2: View Workflow Status**
```
✅ Pass - All tests passed
❌ Fail - Some tests failed
⚠️  Skipped - Tests were skipped
```

**Step 3: Download Reports**
```
Scroll to "Artifacts" section
Download → "robot-results" (ZIP file)
```

**Step 4: Extract and View**
```bash
# Extract the ZIP file
unzip robot-results.zip

# Open reports
open report.html
open log.html
```

### Direct Links

After a workflow run completes:
- **Build Summary**: `github.com/[owner]/[repo]/actions/runs/[run-id]`
- **Artifacts Download**: Bottom of the workflow run page (available 90 days)

---

## 📈 Report Contents

### `report.html` (Executive Summary)
```
┌─────────────────────────────────────┐
│  Robot Framework Test Report        │
├─────────────────────────────────────┤
│ Total Tests:        5               │
│ Passed:            5  (100%)        │
│ Failed:            0                │
│ Execution Time:    2m 34s           │
├─────────────────────────────────────┤
│ Test Suites:                        │
│  • Login Tests       3 passed        │
│  • User Tests        2 passed        │
└─────────────────────────────────────┘
```

### `log.html` (Detailed Execution)
```
Contains:
├── Full test execution timeline
├── Keywords and their execution steps
├── Variable values at each step
├── 📸 Screenshots of failed steps
├── ⚠️  Error messages and stack traces
├── ⏱️  Execution duration per keyword
└── 🔍 Debug information
```

---

## 🔧 Customizing Report Output

### Change Output Directory
```bash
robot --outputdir ./my-reports tests/
```

### Custom Report Names
```bash
robot --output custom-output.xml \
      --log custom-log.html \
      --report custom-report.html \
      tests/
```

### Combine Multiple Runs
```bash
# Run tests and append to existing results
robot --outputdir ./results \
      --name "Test Suite Run" \
      --append \
      tests/
```

---

## 🚨 Troubleshooting

### "Report not found" Error
```bash
# Ensure tests ran successfully
robot --dryrun tests/        # Validate syntax first

# Check if output files exist
ls -la *.html
ls -la output.xml
```

### Reports from CI/CD not showing
1. Check GitHub Actions workflow status (green ✅)
2. Verify artifacts weren't deleted (90-day default)
3. Ensure artifact upload path is correct in workflow:
   ```yaml
   path: |
     log.html
     report.html
     screenshots/
   ```

### Screenshots not appearing
1. Verify Browser Library is installed
2. Check that tests actually take screenshots
3. Ensure `screenshots/` directory exists
4. For CI/CD: Add to artifact path (already configured)

---

## 📋 Quick Reference

| Task | Command |
|------|---------|
| Run all tests | `robot tests/` |
| Run one suite | `robot tests/login.robot` |
| View report | `open report.html` |
| Debug mode | `robot --loglevel DEBUG tests/` |
| Syntax check | `robot --dryrun tests/` |
| Custom output dir | `robot --outputdir ./reports tests/` |

---

## 💡 Pro Tips

1. **Always check the log.html first** when tests fail - it shows exactly what went wrong
2. **Keep reports in git history** - Helpful for tracking test evolution
3. **Use tags** to organize tests and generate subset reports:
   ```bash
   robot --include smoke tests/        # Only smoke tests
   robot --exclude slow tests/         # Exclude slow tests
   ```
4. **Set up local server** for faster viewing:
   ```bash
   python -m http.server 5000 &
   open http://localhost:5000/report.html
   ```
5. **Archive CI/CD reports** - Download before 90-day expiration for compliance
