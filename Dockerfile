FROM registry.access.redhat.com/ubi8/ubi-minimal:8.7-1049@sha256:c7036d048252451451bfc70493c2a849737e91c5517559ec508a0dbe7dfb6d15 as BUILD
RUN microdnf install freetype

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:d139fc33e6af84495d6054cb4d84656d8a8615b75a7a03df8ccc22dd02569023
COPY --from=BUILD \
   /lib64/libfreetype.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/
