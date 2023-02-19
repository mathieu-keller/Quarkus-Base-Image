FROM registry.access.redhat.com/ubi8/ubi-minimal:8.7-1049.1675784874@sha256:0214a28336e387c66493c61bb394e86a18f3bea8dbc46de74a26f173ff553c89 as BUILD
RUN microdnf install freetype

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:266133872d14ef9c5f2c0af4abca41f70984448edbf9d421724c04aae78333fe
COPY --from=BUILD \
   /lib64/libfreetype.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/
