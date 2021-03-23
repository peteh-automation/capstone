NAME   := peterheybrock/capstone
IMG    := ${NAME}:latest

install:
	pip install --upgrade pip &&\
	pip install -r requirements.txt

lint:
	pylint cgiserver.py

build-image:
	@echo "Building ${IMG}" 
	docker build -t ${IMG} .

push-image:
	@echo "Pushing ${IMG} to repo"
	@echo "${DOCKER_PASS}" | docker login --username ${DOCKER_USER} --password-stdin
	docker push ${IMG}
 


