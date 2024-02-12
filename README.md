# DockerSeminar
This repository contains the presentation and examples presented in the "Docker Seminar" on February 8th by Alberto Maillo.
* [Docker example](https://github.com/TranslationalBioinformaticsUnit/DockerSeminar/tree/main#example1dockerexample)
* [Singularity example](#Example_2:_Singularity_example_(in_Ibex))

## Example1Dockerexample
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

# Example 2: Singularity example (in Ibex)
This guide provides instructions for using Singularity on Ibex, including building and running Singularity images. (download folder example2).

## 1. Logging in to Ibex
```
ssh <username>@ilogin.ibex.kaust.edu.sa
```

## 2. Building the Singularity Image
To build a Singularity image on Ibex, follow these steps:
- Use the `singularity build` command with the `--fakeroot` and `--force` options to create the image:
```
singularity build --fakeroot --force <image>.sig <image>.def
```

## 3. Running the Singularity Image
To run the Singularity image on Ibex, execute the following command:
```
singularity run <image>.sig
```

## 4. Creating and Running a Bash Script
To create a bash script containing the Singularity run command and execute it using Slurm, see example *[script.sh](https://github.com/TranslationalBioinformaticsUnit/DockerSeminar/blob/main/example2/script.sh)*:
```
sbatch script.sh
```








