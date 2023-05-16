FROM registry.access.redhat.com/ubi8/ubi-minimal:8.8-860@sha256:82d08fba0a8322ff0c39934efe6972ccbf152dfb4639fb7a5765192f674e3eaa as BUILD
RUN microdnf install freetype

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:931e423651678140ffada0f6891f47b9de2b401429b17f21514cf623e5e8b654
COPY --from=BUILD \
   /lib64/libfreetype.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/
