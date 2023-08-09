FROM registry.access.redhat.com/ubi8/ubi-minimal:8.8-1037@sha256:7394c071ed74ace08cfd51f881c94067fa7a570e7f7e4a0ef0aff1b4f6a2a949 as BUILD
RUN microdnf install freetype

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:ad515385f578e937ddb18510c15498c6d515094b7cc3604053eee890cc9fda23
COPY --from=BUILD \
   /lib64/libfreetype.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/
