.PHONY: start build clean full-reset help

start: ## Start all services
	docker-compose up -d

build: ## Build all services
	docker-compose build

clean: ## Stop and remove containers, networks
	docker-compose down

full-reset: ## Full reset (clean + remove volumes + start)
	docker-compose down -v
	docker-compose rm -vsf
	docker-compose up --build -d

help: ## Display this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
