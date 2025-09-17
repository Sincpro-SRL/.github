prepare-environment:
	@echo "Template to prepare environment, Install core libraries like pip, pipx, npm, etc"

init: prepare-environment
	@echo "Template to init dependencies project"

format:
	@echo "Template to format code"

verify-format:
	@echo "Template to verify code format"

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


