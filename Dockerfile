FROM registry.access.redhat.com/ubi8/ubi-minimal:8.7-1085.1679482090@sha256:35b1b1332190882af4f2a7176bdbe4bcf18f8670be2435098c22cfc16e4c0850 as BUILD
RUN microdnf install freetype

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:ca440a9a5f018031562c7f45bc2d8e8399f94e4a959e58ad24ef3a418f735c3e
COPY --from=BUILD \
   /lib64/libfreetype.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/
