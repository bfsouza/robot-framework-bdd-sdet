# 🚀 Quick Start Guide

## 📦 Installation

```bash
# Install dependencies
pip install -r requirements.txt

# Initialize Playwright browsers
rfbrowser init
```

## 🧪 Running Tests

### Option 1: Using Helper Script (Recommended)

**Linux/macOS:**
```bash
./run-tests.sh
```

**Windows:**
```bash
run-tests.bat
```

The script will:
- ✅ Run all tests
- 📊 Generate reports (report.html, log.html)
- 🌐 Automatically open reports in your browser

### Option 2: Manual Commands

```bash
# Run all tests (headless mode - default)
robot tests/

# Run with browser visible (for local debugging)
robot --variable HEADLESS:False tests/

# Run specific test suite
robot tests/login.robot
robot tests/users.robot

# Run specific test
robot --test "Login With Valid Credentials" tests/

# Syntax validation (no execution)
robot --dryrun tests/
```

## 📊 Viewing Test Reports

### Local Reports

After running tests, you'll find:
- **report.html** - Summary of all tests (% pass, fail, time)
- **log.html** - Detailed execution with screenshots
- **output.xml** - Machine-readable format

Open them directly or use:
```bash
# Linux
xdg-open report.html

# macOS
open report.html

# Windows
start report.html
```

### CI/CD Reports (GitHub Actions)

1. Go to your GitHub repository
2. Click **Actions** tab
3. Select the latest workflow run
4. Scroll to **Artifacts** section
5. Download **robot-results** ZIP file
6. Extract and open `report.html`

## 📚 Full Documentation

- **[TESTING.md](TESTING.md)** - Advanced testing commands and options
- **[REPORTS.md](REPORTS.md)** - Detailed guide to viewing and understanding reports
- **[README.md](README.md)** - Project overview and architecture

## 🔄 Continuous Integration

This project automatically runs tests on:
- Every push to `main` branch
- Every pull request to `main`

Results are available as artifacts in GitHub Actions for 90 days.

## 🐛 Troubleshooting

### Tests won't run
```bash
# Check if dependencies are installed
pip list | grep robot
pip list | grep playwright

# Reinstall if needed
pip install -r requirements.txt
rfbrowser init
```

### Reports not opening
```bash
# Check if report files exist
ls *.html

# If not, run tests first
robot tests/

# Open manually
open report.html  # or use your browser
```

### Browser issues
```bash
# Reinitialize Playwright
rfbrowser init

# Run with debug output
robot --loglevel DEBUG tests/
```

## 📋 Common Commands

| Command | Purpose |
|---------|---------|
| `./run-tests.sh` | Run tests and open reports (Linux/Mac) |
| `run-tests.bat` | Run tests and open reports (Windows) |
| `robot tests/` | Run all tests |
| `robot --dryrun tests/` | Validate syntax only |
| `xdg-open report.html` | Open summary report (Linux) |
| `open log.html` | Open detailed log (macOS) |
| `start report.html` | Open report (Windows) |

## 💡 Tips

1. **Always check log.html first** when tests fail - it shows exact failures
2. **Use tags** to run specific test categories:
   ```bash
   robot --include smoke tests/
   robot --exclude slow tests/
   ```
3. **Run syntax check** before committing:
   ```bash
   robot --dryrun tests/
   ```
4. **Check CI/CD** after pushing - Reports available in GitHub Actions

---

**Need more details?** See [REPORTS.md](REPORTS.md) for comprehensive documentation.
