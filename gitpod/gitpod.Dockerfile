# FIXME: Replace the rationales once https://github.com/hadolint/hadolint/issues/441 is resolved

## Gitpod expects latest version only
# hadolint ignore=DL3007
FROM gitpod/workspace-full:latest

USER gitpod

# Install dependencies through apt
## Gitpod expects us to use sudo here
# hadolint ignore=DL3004 
RUN true \
	&& sudo apt-get update --quiet \
	&& sudo apt-get install \
		--no-install-recommends \
		--quiet \
		--assume-yes \
			# Required for testing of the packages
			docker.io \
			# Used in QA scripts
			busybox \
	&& sudo apt-get autoremove --quiet --assume-yes \
	&& sudo rm -rf /var/lib/apt/lists/*

# Linting tool for shell linting
RUN true \
	&& brew install shellcheck

# Linting tool for dockerfile linting
RUN true \
	&& brew install hadolint

# Set proper ownership of /dev/tty required for paludis
## Gitpod expects us to use sudo here
# hadolint ignore=DL3004
RUN sudo chown root:tty /dev/tty