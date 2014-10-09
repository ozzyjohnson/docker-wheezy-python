# Google mirrors are very fast.
FROM google/debian:wheezy

MAINTAINER Ozzy Johnson <ozzy.johnson@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Update and install minimal.
RUN \
  apt-get update \
            --quiet && \
  apt-get install \ 
            --yes \
            --no-install-recommends \
            --no-install-suggests \
          build-essential \
          python \
          python-dev \
          python-pip && \

# Clean up packages.
  apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Update pip and set up virtualenv.
RUN pip install \
      -U pip

RUN pip install \
      virtualenv

# Default command.
CMD ["bash"]
