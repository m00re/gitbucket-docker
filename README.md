# gitbucket-docker

A small Docker Image for [Gitbucket](https://github.com/gitbucket/gitbucket) based on OpenJDK 8 alpine image - compressed image size is only 91 MB.

The image is very simple and straightforward: it includes Gitbucket's WAR package, runs it upon start (using `/data` as home directory) and listens on port 8080 for incoming connections. Yet, the port is not exposed by default.

## Building Image

To build your custom image based on a different version, you can pass a build-argument `VERSION` to `docker build`, e.g. run

`docker build --build-arg VERSION=4.7.1 -t yourname/gitbucket .`

to use Gitbucket version 4.7.1 instead of the default of 4.8.
## Running Image

Once your image is built, you can run it as follows:

`docker run -p 8080:8080 -v ~/gitbucket-data/:/data -d -t yourname/gitbucket`

To override the default Gitbucket parameters, simple pass the corresponding arguments after the image name, e.g. type

`docker run -p 9000:9000 -v ~/gitbucket-data/:/data -d -t yourname/gitbucket --port=9000`

to use port 9000 instead of port 8080.

## Prebuilt Image

Prebuilt images can be found on Dockerhub: https://hub.docker.com/r/m00re/gitbucket/
