install:
	pip install --upgrade pip &&\
	pip install -r requirements.txt

lint:
	pylint cgiserver.py

all: install lint
