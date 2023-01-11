FROM registry.access.redhat.com/ubi8/ubi-minimal:8.7-1031@sha256:96a76fa48db5fca24271fe1565d88a4453e759b365dbaaeeb5a4e41049293e77 as BUILD
RUN microdnf install freetype

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:d8f386abcb110bf6e3fe54c93d93a207f39b3579be86b36c90dc1c2ac19c2b97
COPY --from=BUILD \
   /lib64/libfreetype.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/
