NAME   := peterheybrock/capstone
TAG    := $$(git log -1 --pretty=%h)
IMG    := ${NAME}:${TAG}
LATEST := ${NAME}:latest

install:
	pip install --upgrade pip &&\
	pip install -r requirements.txt

lint:
	pylint cgiserver.py

build:
	@echo "Building ${IMG}" 
	docker build -t ${IMG} .
	docker tag ${IMG} ${LATEST}

push:
	@echo "Pushing ${NAME}"
	docker push ${NAME}
 
login:
	@echo "${DOCKER_PASS}" | docker login --username ${DOCKER_USER} --password-stdin

