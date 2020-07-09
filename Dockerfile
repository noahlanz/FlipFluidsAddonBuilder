FROM ubuntu

# prepare development environment
RUN apt-get update
RUN apt-get install -y git

# prepare flipfluid build
RUN mkdir /build
RUN git clone https://github.com/rlguy/Blender-FLIP-Fluids.git /build/flipfluids

# staryting actual build
WORKDIR /build/flipfluids

RUN ls
# todo