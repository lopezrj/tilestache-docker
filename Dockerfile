FROM ubuntu:18.04
MAINTAINER Roberto Lopez

# install Python and all the mapnik dependencies
RUN apt-get update
RUN apt-get install -y libjpeg-dev zlib1g-dev 
RUN apt-get install -y python python-setuptools python-dev \
    python-pip python-gdal python-psycopg2
RUN apt-get install -y  libboost-python-dev software-properties-common
RUN apt-get install -y libmapnik3.0 libmapnik-dev mapnik-utils python-mapnik

# symlink the native extensions so Python can pick them up
RUN ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /usr/lib
RUN ln -s /usr/lib/x86_64-linux-gnu/libz.so /usr/lib
RUN ln -s /usr/lib/x86_64-linux-gnu/libboost_python.so /usr/lib
RUN ln -s /usr/lib/x86_64-linux-gnu/libboost_thread.so /usr/lib

# install tilestache, mapnik, and dependencies
# RUN pip install --allow-external PIL --allow-unverified PIL PIL tilestache simplejson werkzeug sympy Blit mapnik2 shapely

RUN apt-get install tilestache
