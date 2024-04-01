FROM registry.access.redhat.com/ubi9/ubi-minimal:8.9@sha256:d917ca6754699f2f655c08fe820d0a4eb5d1ae4900d85ba7daebe5b8ee591be5 as BUILD
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