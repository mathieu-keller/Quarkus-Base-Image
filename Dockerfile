FROM registry.access.redhat.com/ubi8/ubi-minimal:8.7-1085@sha256:ab03679e683010d485ef0399e056b09a38d7843ba4a36ee7dec337dd0037f7a7 as BUILD
RUN microdnf install freetype

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:1fd3cef4f48faece37f17aed424bdadcc63f82ab6a91a9aff40a908cef3bf367
COPY --from=BUILD \
   /lib64/libfreetype.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/
