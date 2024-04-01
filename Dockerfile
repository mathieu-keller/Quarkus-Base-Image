FROM registry.access.redhat.com/ubi9/ubi-minimal:9.3@sha256:registry.redhat.io/ubi9/ubi-minimal@sha256:119ac25920c8bb50c8b5fd75dcbca369bf7d1f702b82f3d39663307890f0bf26 as BUILD
RUN microdnf install freetype fontconfig

# Second stage - copy the dependencies
FROM quay.io/quarkus/quarkus-micro-image:2.0@sha256:88486fd45bd911db41e8bede2cebb4193193c8674d5203e388a721bbd6369b1e
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