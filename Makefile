.DEFAULT_GOAL := help

init: ## Setup environment for develop(build containers, db migration and startup containers)
	@make build
	@make up
	sleep 30
	@make migrate
	@echo "complete init."

build: ## Build docker containers
	@docker-compose build

up: ## Exec docker compose up(background)
	@docker-compose up -d

down: ## Exec docker compose down
	@docker-compose down

destroy: ## Exec docker compose down(remove volumes)
	@docker-compose down --volumes

destroy-all: ## Exec docker compose down(remove volumes and images)
	@docker-compose down --rmi all --volumes --remove-orphans

ps: ## Exec docker compose ps
	@docker-compose ps

bash: ## Exec bash in php container
	@docker-compose exec app bash

mysql: ## Exec mysql cli in mysql container
	@docker-compose exec db mysql -u ruby -p

migrate:
	@docker-compose exec app bin/rails db:migrate

help: ## Show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
