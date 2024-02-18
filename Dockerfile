FROM registry.access.redhat.com/ubi9/ubi-minimal:9.3-1475@sha256:b7a3642d6245446da03d14482740be5f2fe58f30b9dfe001e89a39071a50edfc as BUILD
RUN microdnf -y install freetype

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:ef36b84153ee1239cf8f13decf3e6e0f16c6081de39ab35004b0610ecbeef693
COPY --from=BUILD \
   /lib64/libfreetype.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/
