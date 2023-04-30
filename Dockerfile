FROM registry.access.redhat.com/ubi8/ubi-minimal:8.7-1107@sha256:3e1adcc31c6073d010b8043b070bd089d7bf37ee2c397c110211a6273453433f as BUILD
RUN microdnf install freetype

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:a9794c63b16e467d4729c1ef0ccf133de5eccffae29d1c497c4485f47de7613c
COPY --from=BUILD \
   /lib64/libfreetype.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/
