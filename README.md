# latex-container

A docker container which can take a LaTeX input on stdin and return a JPG on stdout.
It tries to be a little bit secure by doing the following:

* Running each render as a separate container instance.

* Limiting CPU, memory and time taken to render. (in docker invocation and init.sh)

* Detecting dodgy LaTeX commands that can be used to execute system commands. (in init.sh)

* Running LaTeX in paranoid configuration. (in init.sh)


Build:

    docker build -t latex .

Usage:

    echo "e=mc^2" | docker run -i --cpus="1" latex > emc2.jpg


GPL v3, please see the LICENSE file for license information.
