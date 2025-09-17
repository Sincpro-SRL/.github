# 🚀 SINCPRO S.R.L. Shared GitHub Templates

Centralized repository of reusable workflows and composite actions that standardize the PR → merge → release lifecycle across all Sincpro repositories.

## 📋 Workflow Matrix

| Stage            | Trigger      | Actions                                      | Status     | Result              |
| ---------------- | ------------ | -------------------------------------------- | ---------- | ------------------- |
| **Pull Request** | Open/Update  | Code Style + Tests                           | ✅ Pass    | Label added         |
| **Merge**        | Push to main | Code Style + Tests + Version + Release Draft | 🔄 Process | Draft created       |
| **Release**      | Publish      | Deploy/Publish                               | 🚀 Deploy  | Artifacts published |

## 🔄 Development Flow

```mermaid
graph TD
    A[Pull Request] --> B[Code Style]
    B --> C[Run Tests]
    C --> D{All Checks Pass?}
    D -->|✅ Yes| E[Add PR Label]
    D -->|❌ No| F[Block Merge]
    E --> G[Merge to Main]
    G --> H[Code Style]
    H --> I[Run Tests]
    I --> J[Update Version]
    J --> K[Release Drafter]
    K --> L[Publish Release]
    L --> M[Simple Publish]
```

## 🏗️ Composite Pattern Architecture

```mermaid
graph LR
    subgraph "Composite Actions"
        A1[Code Style Action]
        A2[Test Runner Action]
        A3[Version Updater Action]
        A4[Publisher Action]
    end

    subgraph "Reusable Workflows"
        W1[PR Validation Workflow]
        W2[Post-Merge Workflow]
        W3[Release Workflow]
    end

    A1 --> W1
    A2 --> W1
    A1 --> W2
    A2 --> W2
    A3 --> W2
    A4 --> W3
```

## 📦 Responsibilities Matrix

| Component           | Responsibility       | Reusable | Configurable |
| ------------------- | -------------------- | -------- | ------------ |
| **Code Style**      | Format and linting   | ✅       | ✅           |
| **Test Runner**     | Execute tests        | ✅       | ✅           |
| **PR Labeler**      | Automatic labeling   | ✅       | ✅           |
| **Version Manager** | Semantic versioning  | ✅       | ✅           |
| **Release Drafter** | Changelog generation | ✅       | ✅           |
| **Publisher**       | Deploy to registries | ✅       | ✅           |

## 🛠️ Implementation

### Composite Action

```yaml
- uses: Sincpro-SRL/.github/.github/actions/code-style@v1
- uses: Sincpro-SRL/.github/.github/actions/test-runner@v1
```

### Reusable Workflow

```yaml
uses: Sincpro-SRL/.github/.github/workflows/pr-validation.yml@v1
secrets: inherit
```

## 📋 Patterns Matrix

| Pattern             | Purpose                | Benefit       | Implementation      |
| ------------------- | ---------------------- | ------------- | ------------------- |
| **Composite**       | Reusable steps         | DRY principle | Modular actions     |
| **Template Method** | Standard flow          | Consistency   | Base workflows      |
| **Strategy**        | Flexible configuration | Adaptability  | Input parameters    |
| **Observer**        | Notifications          | Visibility    | Labels and webhooks |

## 🤝 Contribution Matrix

| Phase           | Action        | Validation      | Outcome      |
| --------------- | ------------- | --------------- | ------------ |
| **Development** | Fork & PR     | Code review     | Approval     |
| **Integration** | Merge         | CI Pipeline     | Validation   |
| **Release**     | Tag & Publish | Automated tests | Availability |

---

**Contact**: Sincpro engineering team for new templates or improvements.
