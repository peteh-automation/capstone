NAME   := peterheybrock/capstone
TAG    := $(git log -1 --pretty=%h)
IMG    := ${NAME}:${TAG}
LATEST := ${NAME}:latest

install:
	pip install --upgrade pip &&\
	pip install -r requirements.txt

lint:
	pylint cgiserver.py

build:
	docker build -t ${IMG} .
	docker tag ${IMG} ${LATEST}
 
push:
	docker push ${NAME}
 
login:
	docker log -u ${DOCKER_USER} -p ${DOCKER_PASS}
