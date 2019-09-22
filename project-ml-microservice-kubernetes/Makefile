## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

setup:
	python3 -m venv ~/.devops

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	

lint:
	docker pull hadolint/hadolint
	docker run --rm -i hadolint/hadolint < Dockerfile
	pylint --disable=R,C,W1203 app.py

all: install lint test
