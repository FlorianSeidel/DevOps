[![CircleCI](https://circleci.com/gh/FlorianSeidel/DevOps.svg?style=svg&circle-token=fd0a85a53e40ed66df62bd0c4da2fc848970fae7)](https://circleci.com/gh/FlorianSeidel/DevOps)
## Project Overview
This was one of the projects required for the Udacity DevOps Engineer course. The original project description is 
listed below.

_In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API._ 

_You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling._

### Project Tasks

The project required the completion of the following tasks:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

### Improvements

I extended the project with the following improvements:
* Docker compose based image builds and deployment
* Single sourcing of docker repository and tag from .env file in Makefile and shell scripts
* Conversion of docker-compose file to kubernetes resource using kubernetes kompose
* Deployment of image to kubernetes cluster using kubernetes resource
* Run hadlolint as dockercontainer instead of installation to simplify build environment setup
* CircleCI config for running hadolint for Dockerfile linting as docker container
* run_kubernetes.sh waits for pods to be ready before printing summary data
* run_docker.sh waits for containers to be ready before printing summary data
* Fix scikit-learn version in requirements.txt to resolve incompatibility of code with newer versions of the library

### Files in repository

|  File | Description  |
|---|---|
| Dockerfile  | Image definition for running app.py. Exposes API on port 80. |
| docker-compose.yml  | Runs app.py in docker container and exposes the API on port 8000. |
| .env  | Contains default repository and image tag. |
| ml-predict.yml | Service and deployment definition for running app.py on a kubernetes cluster. Will create a service exposing one instance of the application on port 8000. |
| run_docker.sh | Run app.py in docker using docker-compose. |
| upload_docker.sh | Upload the docker image to a repository defined by the REPOSITORY environemnt variable using a tag defined by the TAG environment variable. |
| run_kubernetes.sh | Applies ml-predict.yml to a kubernetes cluster. |
| make_prediction.sh | Test the application by making a prediction. |

---

## Setup the Environment

* Create a virtualenv and activate it by running `make setup`
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`
