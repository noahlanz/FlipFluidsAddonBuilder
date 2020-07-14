FROM ubuntu

# prepare development environment
RUN apt-get update
RUN apt-get install -y zip git gcc g++ 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y cmake 

# prepare flipfluid build
RUN git clone https://github.com/rlguy/Blender-FLIP-Fluids.git /flipfluids
RUN mkdir /flipfluids/build
WORKDIR /flipfluids/build

# starting actual build
RUN cmake .. 
RUN make
WORKDIR /flipfluids/build/bl_flip_fluids
RUN zip -r /flipfluids-blender-addon.zip ./flip_fluids_addon ./pyfluid

# show result
RUN ls -l /flipfluids-blender-addon.zip