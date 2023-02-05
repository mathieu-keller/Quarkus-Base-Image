FROM registry.access.redhat.com/ubi8/ubi-minimal:8.7-1049@sha256:c7036d048252451451bfc70493c2a849737e91c5517559ec508a0dbe7dfb6d15 as BUILD
RUN microdnf install freetype

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:a1eae999ee9f2c5910c5eb257badc5f93bea3df8dc7c223957e7bca975a97085
COPY --from=BUILD \
   /lib64/libfreetype.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/
