# Makefile

.PHONY: create_project delete_project

create_project:
	@./scripts/create_project.sh $(PROJECT_NAME)

delete_project:
	@./scripts/delete_project.sh $(PROJECT_NAME)