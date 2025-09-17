# Copilot Instructions for Sincpro Shared GitHub Templates

## Repository Context

You are working in the **Sincpro Shared GitHub Templates** repository, which serves as the centralized hub for reusable workflows and composite actions that standardize the PR → merge → release lifecycle across all Sincpro repositories.

## Primary Purpose

This repository implements the **Composite Pattern** to provide:

- **Reusable Workflows**: Standardized CI/CD pipelines
- **Composite Actions**: Modular, configurable steps
- **Template Methods**: Consistent development flows

## Workflow Philosophy

Sincpro follows a strict three-stage development lifecycle:

### 1. Pull Request Stage

- **Code Style** validation (linting, formatting)
- **Test execution** (unit, integration)
- **PR Labeling** on success (for automation visibility)

### 2. Merge to Main Stage

- **Re-run** code style and tests on merge commit
- **Version update** (semantic versioning)
- **Release Draft** creation with changelog

### 3. Release Publication Stage

- **Simple publish** to appropriate registries
- **Artifact deployment** (PyPI, npm, Docker Hub, etc.)

## Architecture Guidelines

### Composite Actions

When creating composite actions, follow these principles:

- **Single Responsibility**: Each action should have one clear purpose
- **Configurable**: Use inputs for flexibility across different tech stacks
- **Reusable**: Design for consumption by multiple repositories
- **Idempotent**: Actions should be safe to run multiple times

### Reusable Workflows

Structure workflows to:

- **Accept secrets**: Use `secrets: inherit` pattern
- **Parameterize**: Accept technology-specific configurations
- **Fail fast**: Stop on first failure for quick feedback
- **Cache efficiently**: Use lockfile-based caching strategies

## File Structure Patterns

### Composite Actions Location

```
.github/actions/
├── code-style/
├── test-runner/
├── version-updater/
├── pr-labeler/
├── release-drafter/
└── publisher/
```

### Reusable Workflows Location

```
.github/workflows/
├── pr-validation.yml
├── post-merge.yml
├── release.yml
└── template-*.yml
```

## Technology Agnostic Approach

- **Avoid hardcoding** specific tools (pytest, eslint, etc.)
- **Use strategy pattern** for technology-specific implementations
- **Parameterize tooling** through action inputs
- **Support multiple languages** (Python, Node.js, Go, etc.)

## Naming Conventions

- **Actions**: Use kebab-case with descriptive names
- **Workflows**: Use descriptive names ending in `.yml`
- **Inputs**: Use snake_case for consistency
- **Outputs**: Use snake_case following GitHub conventions

## Security Best Practices

- **Minimal permissions**: Use least-privilege tokens
- **Environment protection**: Sensitive operations in protected environments
- **Secret management**: Never hardcode secrets, use GitHub secrets
- **Version pinning**: Pin action versions to specific tags (v1, v2, etc.)

## Documentation Standards

- **README updates**: Always update when adding new actions/workflows
- **Input documentation**: Document all inputs with types and descriptions
- **Usage examples**: Provide clear implementation examples
- **Matrix format**: Use tables for capability and responsibility matrices

## Testing Strategy

- **Self-testing**: This repository should use its own workflows
- **Integration tests**: Test workflows with sample repositories
- **Version compatibility**: Ensure backward compatibility
- **Breaking changes**: Use major version bumps for breaking changes

## Common Implementation Patterns

### Error Handling

```yaml
- name: Handle Failure
  if: failure()
  run: echo "Step failed, but continuing..."
```

### Conditional Execution

```yaml
- name: Run on specific conditions
  if: github.event_name == 'pull_request'
  run: echo "PR-specific step"
```

### Matrix Strategies

```yaml
strategy:
  matrix:
    os: [ubuntu-latest, windows-latest, macos-latest]
    version: ["3.8", "3.9", "3.10"]
```

## Release Management

- **Semantic Versioning**: Follow semver for all releases
- **Release Notes**: Auto-generate using Release Drafter
- **Tagging**: Create both major (v1) and specific (v1.2.3) tags
- **Changelog**: Maintain comprehensive changelog

## Consumer Repository Integration

When helping with consumer repositories, guide users to:

1. **Reference stable versions**: Use `@v1` tags, not `@main`
2. **Configure secrets**: Set up required secrets properly
3. **Branch protection**: Enable required status checks
4. **Environment setup**: Configure protected environments for releases

## Troubleshooting Common Issues

- **Permission denied**: Check token permissions and repository settings
- **Cache misses**: Verify cache key patterns match lockfiles
- **Version conflicts**: Ensure semantic versioning is followed
- **Failed deployments**: Check environment protection rules

Remember: This repository is the **source of truth** for Sincpro's CI/CD standards. All changes should maintain backward compatibility and follow the established patterns.
