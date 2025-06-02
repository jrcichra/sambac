# https://wiki.alpinelinux.org/wiki/Setting_up_a_Samba_server
FROM alpine:3.22.0
RUN apk add samba && mkdir /media/storage && chmod 0777 /media/storage
COPY smb.conf /etc/samba/smb.conf
RUN adduser -D smbuser && echo -e "smbuser\nsmbuser" | smbpasswd -a -s smbuser
ENTRYPOINT ["smbd", "-F", "--no-process-group"]
