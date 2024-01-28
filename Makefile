dev:
	docker-compose -f docker-compose.yml up

dev-detached:
	docker-compose -f docker-compose.yml up -d

prod-detached:
	docker-compose -f docker-compose.prod.yml up -d

build-dev:
	docker-compose -f docker-compose.yml build --no-cache

build-prod:
	dokcer-compose -f docker-compose.prod.yml build --no-cache

list:
	docker compose ps -a

prune:
	docker compose down --rmi all --volumes

down:
	docker compose down


#.PHONY: dev
#.PHONY: prod
#.PHONY: list
#.PHONY: prune
#.PHONY: down