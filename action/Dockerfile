FROM asonnleitner/kubectl@sha256:23dc0c77f093ff6a3d6252959fcab98797fe164bd6797be40d4b0b8a19e3c053

WORKDIR /

COPY entrypoint.sh .

# Seems to be the default user in github actions
USER 1001

ENTRYPOINT ["/entrypoint.sh"]
