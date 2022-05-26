
.PHONY: docker-run docker-stop

docker_compose=sudo docker-compose -f docker-compose.yaml

image-build:
	sudo docker build --tag app:v1.0 .

run-single-container:
	sudo docker run --rm -p 8080:8080/tcp app:v1.0

docker-build:
	${docker_compose} build

docker-run:
	${docker_compose} up

docker-stop:
	${docker_compose} down	