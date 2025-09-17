prepare-environment:
	@echo "Template to prepare environment, Install core libraries like pip, pipx, npm, etc"

init: prepare-environment
	@echo "Template to init dependencies project"

format:
	@prettier --write --tab-width 2 "**/*.{yml,yaml,json,md}"

verify-format: format
	@if ! git diff --quiet; then \
	  echo >&2 "✘ El formateo ha modificado archivos. Por favor agrégalos al commit."; \
	  git --no-pager diff --name-only HEAD -- >&2; \
	  exit 1; \
	fi

test:
	@echo "Template to run tests"

update-version:
ifndef VERSION
	$(error VERSION is required. Usage: make update-version VERSION=1.2.3)
endif
	@echo "Template to update project version $(VERSION) based on make parameter"

publish:
	@echo "Template to publish the artifact"

deploy:
	@echo "Template to deploy the artifact only if is service"

.PHONY: prepare-environment init format verify-format test update-version publish deploy


