# DockerSeminar

# Example 1: Docker example 1
This guide provides instructions for building, running, uploading to Docker Hub, and downloading from Docker Hub for an R script (download folder example1).

## 1. Building the Docker Image
To build the Docker image, run the following command in the terminal (the "." should be specified the path of the Dockerfile, the dot represents the current directory):
```	
docker build -t <image_name> . --progress=plain . &> build.log
```	

## 2. Running and generating Output Files
To generate output files, mount the current directory or another directory of the host machine to the /output/ folder using the following command:
```	
docker run -v "path:/output" <image_name>
```	
## 3. Uploading to Docker Hub
To upload the Docker image to Docker Hub, follow these steps:
- Tag the image with your Docker Hub username and repository name:
```	
docker tag <image_id> <username>/<repository_name>:<tag>
```	
- Log in to Docker Hub (insert your credentials):
```	
docker login
```	
- Push the tagged image to Docker Hub:
```	
docker push <username>/<repository_name>:<tag>
```	

## 4. Downloading from Docker Hub
To download the Docker image from Docker Hub, use the following commands:
```	
docker pull <username>/<repository_name>
```	

## 5. Additional Commands
- Show all containers:
```	
docker ps -a
```
- Remove a container:
```	
docker rm -f <container_id>
```	
- Remove an image:
```	
docker image rm <image_id>
```	
