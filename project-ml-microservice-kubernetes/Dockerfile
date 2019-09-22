FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
RUN mkdir /app

## Step 2:
# Copy source code to working directory
COPY app.py /app
COPY requirements.txt /app
COPY Makefile /app
COPY model_data /app/model_data

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
WORKDIR /app
RUN make install
RUN make test

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
CMD ["python3", "app.py"]

