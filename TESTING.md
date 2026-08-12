# 🧪 Testing Guide

## Running Tests

### Run All Tests
```bash
robot tests/
```

### Run with Headless Mode (Default - CI/CD)
```bash
# This is the default - runs without visual browser window
robot --variable HEADLESS:True tests/
```

### Run with Browser Visible (Local Development)
```bash
# Open browser window for visual debugging
robot --variable HEADLESS:False tests/
```

### Run Specific Test Suite
```bash
robot tests/login.robot
robot tests/users.robot
```

### Run Specific Test Case
```bash
robot --test "Login With Valid Credentials" tests/login.robot
```

### Run with Custom Tags
```bash
robot --include smoke tests/
robot --exclude slow tests/
```

### Dry Run (Validate Syntax)
```bash
robot --dryrun tests/
```

---

## 📊 Test Reports

### Local Execution

When you run tests locally, Robot Framework automatically generates three files in the project root:

1. **`log.html`** - Detailed execution log with screenshots and step-by-step information
2. **`report.html`** - High-level test results summary with pass/fail statistics
3. **`output.xml`** - Machine-readable test results (used for integrations)

#### Viewing Reports Locally

**Option 1: Open in Browser**
```bash
# Open report in your default browser
open report.html        # macOS
xdg-open report.html    # Linux
start report.html       # Windows
```

**Option 2: VS Code**
- Right-click on `report.html` or `log.html` → "Open with Live Server"
- Or use: `python -m http.server 8000` then visit `http://localhost:8000`

**Option 3: Quick Preview**
```bash
# Serve files on local server
python -m http.server 8000
# Visit: http://localhost:8000/report.html
```

---

### CI/CD Execution (GitHub Actions)

The workflow file (`.github/workflows/robot-ci.yml`) is configured to:

1. **Run tests** in the GitHub Actions environment
2. **Upload artifacts** containing the test reports
3. **Store reports** for later viewing

#### Accessing CI/CD Reports

**Step 1: Go to GitHub Actions**
- Navigate to your repository on GitHub
- Click **Actions** tab
- Select the latest workflow run

**Step 2: Download Artifacts**
- Scroll to the bottom of the workflow run page
- Look for **Artifacts** section
- Download `robot-results` ZIP file

**Step 3: Extract and View**
```bash
unzip robot-results.zip
open report.html
```

**Step 4: View in GitHub UI**
- Click on the workflow run
- Artifacts are available for 90 days by default
- Download and extract to view reports

---

## 🔍 Understanding Reports

### report.html
Provides a quick summary:
- ✅ Total tests passed/failed
- 📊 Test execution timeline
- 🏷️ Tags and test names
- ⚡ Execution time per test

### log.html
Detailed execution information:
- 📝 Step-by-step keyword execution
- 📸 Screenshots of failed steps
- 🔍 Variable values at each step
- 📋 Full error messages and stack traces
- ⏱️ Execution duration for each keyword

---

## 🛠️ Advanced Options

### Custom Report Output Directory
```bash
robot --outputdir ./test-results tests/
```

### Combine Multiple Suites
```bash
robot --outputdir ./test-results --name "Full Suite" tests/
```

### Generate Screenshots on Failure
Screenshots are automatically captured when using Browser Library:
- Located in `screenshots/` directory (if configured)
- Embedded in `log.html` for easy viewing

### Console Output
```bash
robot --loglevel DEBUG tests/           # Verbose logging
robot --loglevel INFO tests/            # Normal logging
robot --loglevel WARN tests/            # Only warnings/errors
```

---

## 📌 Best Practices

1. **Always check reports after test runs** - Look for warnings and performance issues
2. **Keep reports in CI/CD** - Archive for compliance and debugging
3. **Share reports with team** - Download and share `report.html` for quick overview
4. **Use tags for organization** - Makes filtering and running specific tests easier
5. **Monitor execution time** - Use reports to identify slow tests that need optimization

---

## 🐛 Troubleshooting

### Reports not generated
- Ensure Robot Framework is installed: `pip install robotframework`
- Check if tests actually ran: Look for `output.xml`

### Screenshot not embedded
- Verify Browser Library is properly installed: `pip install robotframework-browser`
- Check that `screenshot` keyword is used in tests

### CI/CD artifacts not available
- Check workflow file `.github/workflows/robot-ci.yml`
- Verify artifact upload configuration is correct
- Note: Artifacts are deleted after 90 days by default
