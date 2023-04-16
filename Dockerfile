FROM registry.access.redhat.com/ubi8/ubi-minimal:8.7-1107@sha256:3e1adcc31c6073d010b8043b070bd089d7bf37ee2c397c110211a6273453433f as BUILD
RUN microdnf install freetype

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:8b8d52ec8a088ab42a078d526674ec302a3995cf2655f7447284b295e7a50c18
COPY --from=BUILD \
   /lib64/libfreetype.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/
