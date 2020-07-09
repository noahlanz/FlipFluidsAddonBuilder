FROM ubuntu

# prepare development environment
RUN apt-get update
RUN apt-get install -y zip
RUN apt-get install -y git 
RUN apt-get install -y gcc 
RUN apt-get install -y g++ 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y cmake 

# prepare flipfluid build
RUN git clone https://github.com/rlguy/Blender-FLIP-Fluids.git /flipfluids
RUN mkdir /flipfluids/build
WORKDIR /flipfluids/build

# starting actual build
RUN cmake .. 
RUN make
RUN zip -r /flipfluids-blender-addon.zip ./bl_flip_fluids/flip_fluids_addon ./bl_flip_fluids/pyfluid

# delpoy
RUN echo "Copy the file from this container from location /flipfluids-blender-addon.zip"