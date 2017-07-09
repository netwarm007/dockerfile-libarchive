FROM tim03/baseimage
LABEL maintainer Chen, Wenli <chenwenli@chenwenli.com>

WORKDIR /usr/src
ADD http://www.libarchive.org/downloads/libarchive-3.2.2.tar.gz .
COPY md5sums .
RUN md5sum -c md5sums
RUN \
	tar xvf libarchive-3.2.2.tar.gz && \
	mv -v libarchive-3.2.2 libarchive && \
	pushd libarchive && \
	./configure --prefix=/usr --disable-static && \
	make -j"$(nproc)" && \
	make check && \
	make install && \
	popd && \
	rm -rf libarchive

