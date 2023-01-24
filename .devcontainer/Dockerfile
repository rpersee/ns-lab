FROM ubuntu:bionic AS builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y curl \
        build-essential g++-4.8 gcc-4.8 \
        libx11-dev xorg-dev && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 10 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 10 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20 && \
    update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30     && \
    update-alternatives --set cc /usr/bin/gcc                        && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30   && \
    update-alternatives --set c++ /usr/bin/g++

WORKDIR /opt/nsnam/

RUN curl -fsSL -O "https://altushost-swe.dl.sourceforge.net/project/nsnam/allinone/ns-allinone-2.35/ns-allinone-2.35.tar.gz" && \
    tar -xzvf ns-allinone-2.35.tar.gz && \
    cd ns-allinone-2.35/ && \
    sed -ri '137s/(erase\()/baseMap::\1/' ns-2.35/linkstate/ls.h && \
    ./install


FROM ubuntu:bionic

ENV NSVER=2.35
ENV TCLVER=8.5.10
ENV TKVER=8.5.10
ENV OTCLVER=1.14

COPY --from=builder /opt/nsnam/ns-allinone-$NSVER /opt/nsnam/ns-allinone-$NSVER/

ENV PATH="$PATH:/opt/nsnam/ns-allinone-$NSVER/bin:/opt/nsnam/ns-allinone-$NSVER/tcl$TCLVER/unix:/opt/nsnam/ns-allinone-$NSVER/tk$TKVER/unix"
ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/nsnam/ns-allinone-$NSVER/otcl-$OTCLVER:/opt/nsnam/ns-allinone-$NSVER/lib"
ENV TCL_LIBRARY="$TCL_LIBRARY:/opt/nsnam/ns-allinone-$NSVER/tcl$TCLVER/library"

RUN apt update && apt install -y libx11-6 && \
    apt clean -y && rm -rf /var/lib/apt/lists/*

