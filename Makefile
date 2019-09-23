## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

include .env

setup:
	python3 -m venv ~/.devops

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	

lint:
	hadolint Dockerfile
	pylint --disable=R,C,W1203 app.py

docker_lint:
	docker pull hadolint/hadolint
	docker run --rm -i hadolint/hadolint < Dockerfile
	pylint --disable=R,C,W1203 app.py

konvert:
	REPOSITORY=${REPOSITORY} TAG=${TAG} kompose convert  --controller deployment --out ml-predict.yml

k8s_deploy:
	./run_kubernetes.sh

k8s_remove:
	kubectl delete -f ml-predict.yml

push:
	./upload_docker.sh

all: install lint test
