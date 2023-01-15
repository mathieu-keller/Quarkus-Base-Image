FROM registry.access.redhat.com/ubi8/ubi-minimal:8.7-1049@sha256:c7036d048252451451bfc70493c2a849737e91c5517559ec508a0dbe7dfb6d15 as BUILD
RUN microdnf install freetype

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:33546f89aef850c164b60d4ce81db653b4220004083ab683c78ca5ab1f11edd2
COPY --from=BUILD \
   /lib64/libfreetype.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/
