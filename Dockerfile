FROM registry.access.redhat.com/ubi8/ubi-minimal:8.7-1049@sha256:c7036d048252451451bfc70493c2a849737e91c5517559ec508a0dbe7dfb6d15 as BUILD
RUN microdnf install freetype fontconfig

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:d8f386abcb110bf6e3fe54c93d93a207f39b3579be86b36c90dc1c2ac19c2b97
COPY --from=BUILD \
   /lib64/libfreetype.so.6 \
   /lib64/libgcc_s.so.1 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/libm.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libexpat.so.1 \
   /lib64/libuuid.so.1 \
   /lib64/

COPY --from=BUILD \
   /usr/lib64/libfontconfig.so.1 \
   /usr/lib64/

COPY --from=BUILD \
    /usr/share/fonts /usr/share/fonts

COPY --from=BUILD \
    /usr/share/fontconfig /usr/share/fontconfig

COPY --from=BUILD \
    /usr/lib/fontconfig /usr/lib/fontconfig

COPY --from=BUILD \
     /etc/fonts /etc/fonts
