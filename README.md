readme_robot = """# 🤖 Robot Framework + Browser Library (Playwright) BDD Framework

[![Robot Framework CI](https://github.com/bfsouza/robot-framework-bdd-sdet/actions/workflows/robot-ci.yml/badge.svg)](https://github.com/bfsouza/robot-framework-bdd-sdet/actions)
![Robot Framework](https://img.shields.io/badge/Robot%20Framework-6.x-000000?style=flat&logo=robot-framework)
![Python](https://img.shields.io/badge/Python-3.10%2B-3776AB?style=flat&logo=python)
![Playwright](https://img.shields.io/badge/Browser%20Library-Playwright-45BA4B?style=flat&logo=playwright)
![Docker](https://img.shields.io/badge/Docker-Supported-2496ED?style=flat&logo=docker)

> End-to-End (E2E) web automation testing framework built with **Robot Framework** and the modern **Browser Library** (powered by Playwright). Demonstrates BDD/Gherkin test design, modular keyword-driven Page Object architecture, dynamic data management, and CI/CD integration.

---

## 🎯 Target Application

Tests are executed against the **[ServeRest](https://serverest.dev/)** front-end application:
* **Web UI:** `https://front.serverest.dev`

---

## 🏗️ Architecture & Best Practices

This framework adopts a clean Keyword-Driven Page Object Model architecture:

* **Browser Library Engine:** Uses Playwright under the hood for blazing-fast, reliable execution without flakiness or manual sleep waits.
* **BDD/Gherkin Style:** High-level human-readable scenarios business stakeholders can easily audit.
* **Page Object Design (Resource-based):** Clear separation between element locators, page actions (keywords), and test specifications.
* **Built-in HTML Reporting:** Generates native Robot Framework `log.html` and `report.html` execution reports containing embedded screenshots for failed steps.

```text
├── .github/workflows/       # CI/CD pipeline (GitHub Actions)
├── resources/
│   ├── base.resource        # Global variables, setup, and teardown keywords
│   ├── pages/               # Encapsulated Page Objects and Locators
│   │   ├── login_page.resource
│   │   └── home_page.resource
│   └── fixtures/            # Test data and dynamic payload generators
├── tests/                   # BDD Test Suites
│   ├── login.robot
│   └── users.robot
├── .gitignore
├── requirements.txt         # Python dependencies
├── README.md
├── TESTING.md              # How to run tests
└── REPORTS.md              # How to access test reports
```

---

## 🚀 Quick Start

### 1. Install Dependencies
```bash
pip install -r requirements.txt
rfbrowser init
```

### 2. Run Tests
```bash
# Run all tests
robot tests/

# Run specific suite
robot tests/login.robot

# Validate syntax
robot --dryrun tests/
```

### 3. View Reports
After running tests, open reports in your browser:
- **Summary**: `report.html`
- **Details**: `log.html`

See [REPORTS.md](REPORTS.md) for detailed instructions.

---

## 📚 Documentation

- **[TESTING.md](TESTING.md)** - Comprehensive testing guide with all commands and options
- **[REPORTS.md](REPORTS.md)** - How to view test reports locally and from CI/CD
- **[.github/workflows/robot-ci.yml](.github/workflows/robot-ci.yml)** - CI/CD pipeline configuration

---

## 🔄 CI/CD Pipeline

This project includes automated testing via GitHub Actions:

1. **Trigger**: On every `push` and `pull_request` to `main` branch
2. **Execution**: Runs all tests in the `tests/` directory
3. **Results**: Artifacts (reports) available for download in GitHub Actions

**Access CI/CD Reports**:
- Go to **Actions** tab on GitHub
- Select the latest workflow run
- Download `robot-results` artifact

See [REPORTS.md](REPORTS.md#-cicd-execution-github-actions) for details.

---

## 🛠️ Development

### Add New Tests
1. Create `.robot` file in `tests/` directory
2. Reference resources in `resources/` folder
3. Follow BDD/Gherkin style with descriptive test names
4. Use Page Objects for element locators

### Add Page Objects
1. Create `.resource` file in `resources/pages/`
2. Define element locators in `*** Variables ***`
3. Implement keywords in `*** Keywords ***`
4. Document each keyword with `[Documentation]`

### Update Test Data
Edit `resources/fixtures/test_data.resource` with valid credentials and test data.
