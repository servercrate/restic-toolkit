FROM alpine:3.21
RUN apk add --no-cache restic bash openssh-client ca-certificates tzdata
WORKDIR /opt/restic-toolkit
COPY scripts/ scripts/
COPY templates/ templates/
RUN chmod +x scripts/*.sh
ENTRYPOINT ["/bin/bash"]
CMD ["scripts/sc-backup.sh"]
