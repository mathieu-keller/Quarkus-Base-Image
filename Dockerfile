FROM registry.access.redhat.com/ubi9/ubi-minimal:9.3-1475@sha256:b7a3642d6245446da03d14482740be5f2fe58f30b9dfe001e89a39071a50edfc as BUILD
RUN microdnf -y install freetype

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:da7140ede620f67789bf0d17d4b1868265bde19a217cbda2436b0d7208ffef51
COPY --from=BUILD \
   /lib64/libfreetype.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/
