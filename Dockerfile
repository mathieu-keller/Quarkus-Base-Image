FROM registry.access.redhat.com/ubi8/ubi-minimal:8.8-860@sha256:82d08fba0a8322ff0c39934efe6972ccbf152dfb4639fb7a5765192f674e3eaa as BUILD
RUN microdnf install freetype

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:81b5c49ecea667cc8e48e8e945bb1e6a674167f6c4299fe1f069f7f8e4f6097a
COPY --from=BUILD \
   /lib64/libfreetype.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/
