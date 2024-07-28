# https://wiki.alpinelinux.org/wiki/Setting_up_a_Samba_server
FROM alpine:3.20.2
RUN apk add samba && mkdir /media/storage && chmod 0777 /media/storage
COPY smb.conf /etc/samba/smb.conf
RUN adduser -D smbuser && smbpasswd -n -a smbuser
ENTRYPOINT ["smbd","-i"]
