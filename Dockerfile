FROM registry.access.redhat.com/ubi8/ubi-minimal:8.7-1085@sha256:ab03679e683010d485ef0399e056b09a38d7843ba4a36ee7dec337dd0037f7a7 as BUILD
RUN microdnf install freetype

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:266133872d14ef9c5f2c0af4abca41f70984448edbf9d421724c04aae78333fe
COPY --from=BUILD \
   /lib64/libfreetype.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/
