FROM alpine:latest

RUN mkdir -p /tftpboot; \
	apk --update add --no-cache tftp-hpa busybox

EXPOSE 69/udp

ADD https://boot.netboot.xyz/ipxe/netboot.xyz.kpxe /tftpboot/
ADD https://boot.netboot.xyz/ipxe/netboot.xyz-undionly.kpxe /tftpboot/
ADD https://boot.netboot.xyz/ipxe/netboot.xyz.efi /tftpboot/
ADD https://boot.netboot.xyz/ipxe/netboot.xyz-snp.efi /tftpboot/
ADD https://boot.netboot.xyz/ipxe/netboot.xyz-snponly.efi /tftpboot/

RUN find /tftpboot -type f -exec chmod 0444 {} +

ENTRYPOINT ["sh", "-c"]
CMD ["busybox syslogd -n -O /dev/stdout & in.tftpd -Lvvv --secure -u nobody /tftpboot"]
