nexus-build:
	docker-compose -f ./docker-compose.yml --project-name="nexus" build --force-rm --no-cache
PHONY: nexus-build

nexus-start:
	docker-compose -f ./docker-compose.yml --project-name="nexus" up -d --remove-orphans
PHONY: nexus-start

nexus-stop:
	docker-compose -f ./docker-compose.yml --project-name="nexus" down
PHONY: nexus-stop