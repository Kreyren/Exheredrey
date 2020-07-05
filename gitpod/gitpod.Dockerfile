FROM gitpod/workspace-full:latest

USER gitpod

RUN true "" \
	&& sudo apt-get update -q \
	&& sudo apt-get install -qy \
		docker.io \
	&& sudo usermod -a -G docker gitpod \
	&& sudo apt-get autoremove -qy \
	&& sudo rm -rf /var/lib/apt/lists/*