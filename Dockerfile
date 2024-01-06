FROM registry.access.redhat.com/ubi8/ubi-minimal:8.8-1037@sha256:7394c071ed74ace08cfd51f881c94067fa7a570e7f7e4a0ef0aff1b4f6a2a949 as BUILD
RUN microdnf install freetype

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:da7140ede620f67789bf0d17d4b1868265bde19a217cbda2436b0d7208ffef51
COPY --from=BUILD \
   /lib64/libfreetype.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/
