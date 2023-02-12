FROM registry.access.redhat.com/ubi8/ubi-minimal:8.7-1049.1675784874@sha256:0214a28336e387c66493c61bb394e86a18f3bea8dbc46de74a26f173ff553c89 as BUILD
RUN microdnf install freetype

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:9aa26b6f9ec75533e836e53a640358fc9461ce4d0c15c122dfa955b50fff60b5
COPY --from=BUILD \
   /lib64/libfreetype.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/
