.PHONY: init-dev
# Init environment for development.
init-dev:
	@pip install --upgrade pip && \
	pip install --requirement requirements.txt && \
	pre-commit install

.PHONY: init-config-i-homework
# Init configs for homework
init-config-i-homework:
	@cp .env.homework .env && \
		cp docker-compose.override.homework.yml docker-compose.override.yml

.PHONY: homework-i-run
# Run homework.
homework-i-run:
	@make migrate && \
	python manage.py runserver

.PHONY: homework-i-purge
homework-i-purge:
	@echo Goodbye

.PHONY: pre-commit-run
# Run tools for files from commit.
pre-commit-run:
	@pre-commit run

.PHONY: pre-commit-run-all
# Run tools for all files.
pre-commit-run-all:
	@pre-commit run --all-files


.PHONY: d-homework-i-run
# Make all actions needed for run homework from zero.
d-homework-i-run:
	@make init-config-i-homework && \
	make d-run

.PHONY: d-homework-i-purge
# Make all actions needed for purge homework related data.
d-homework-i-purge:
	@make d-purge

.PHONY: d-run
# Just run
d-run:
	@COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 \
		COMPOSE_PROFILES=full_dev \
		docker compose \
		up --build

.PHONY: d-run-i-local-dev
# Just run
d-run-i-local-dev:
	@COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 \
		COMPOSE_PROFILES=local_dev \
		docker compose \
		up --build

.PHONY: d-stop
# Stop services
d-stop:
	@COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 \
		docker compose down

.PHONY: d-purge
# Purge all data related with services
d-purge:
	@COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 \
		docker compose down --volumes --remove-orphans --rmi local --timeout 0


.PHONY: migrations
# Make migrations
migrations:
	@python manage.py makemigrations

.PHONY: migrate
# Migrate
migrate:
	@python manage.py migrate

.PHONY: util-i-kill-by-port
# Kill services by port
util-i-kill-by-port:
	@sudo lsof -i:8000 -Fp | head -n 1 | sed 's/^p//' | xargs sudo kill


.PHONY: init-dev-i-create-superuser
# Create standard superuser
init-dev-i-create-superuser:
	@python manage.py create_superuser

.PHONY: init-dev-i-delete-superuser
# Delete superuser
init-dev-i-delete-superuser:
	@python manage.py delete_superuser