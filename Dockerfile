FROM registry.access.redhat.com/ubi9/ubi-minimal:9.3-1475@sha256:b7a3642d6245446da03d14482740be5f2fe58f30b9dfe001e89a39071a50edfc as BUILD
RUN microdnf -y install freetype

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:d86e7ce5810a6c2674981df3b0f3f29ec1b4cc6caf2207622270d720cb237de9
COPY --from=BUILD \
   /lib64/libfreetype.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/
