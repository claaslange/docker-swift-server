.PHONY: readme jsdocs

export CHARLES_HOST=$(shell ifconfig | grep "inet " | tail -1 | awk -F'[: ]+' '{ print $$2 }')

build: remove-temp-files
	docker-compose build --force-rm

rebuild:
	docker-compose build --no-cache --force-rm

start: run-dev

run-dev: stop build
	docker-compose up

stop:
	docker-compose down

start-prod: run-prod

run-prod: stop build
	docker-compose -f docker-compose.prod.yml up

stop-prod:
	docker-compose -f docker-compose.prod.yml down

status:
	docker-compose ps

shell:
	docker-compose exec server /bin/bash || echo "Please start the docker container with 'make run-dev' seperately"

host:
	@echo ${CHARLES_HOST}

remove-temp-files:
	-rm 11*.*
