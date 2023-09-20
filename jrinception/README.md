# Inception

This is an end-of-course project at 42 School. The goal of the project is to build and link multiple services, each nested in a Docker container, to familiarize us with this powerful tool. We had to create containers for MariaDB, WordPress, and Nginx.

## Usage

1 - Go to the ```src``` directory and edit the ```docker-compose.yaml``` file.

2 - At the bottom of the file, change the path in the ```device``` option to match the location where you want your WordPress and MariaDB data to be stored on your device. The folder must already exist.

3 - Go back to the project root and run the ```make``` command.
