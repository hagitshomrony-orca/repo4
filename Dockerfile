# Bad: uses :latest tag (CKV_DOCKER_7 / DL3007) :O
FROM ubuntu:latest

# Bad: hardcoded secrets in env
ENV DB_PASSWORD=supersecret123
ENV AWS_SECRET_ACCESS_KEY=AKIAIOSFODNN7EXAMPLE

# Bad: apt-get update alone, no version pin, no --no-install-recommends, no cleanup
# (CKV_DOCKER_5 / DL3009 / DL3015 / DL3008)
RUN apt-get update
RUN apt-get install -y curl wget sudo

# Bad: ADD instead of COPY for local file (CKV_DOCKER_4 / DL3020)
ADD ./app /app

# Bad: curl | bash anti-pattern (DL3047)
RUN curl -sSL http://example.com/install.sh | bash

# Bad: running as root, no USER directive (CKV_DOCKER_3)

# Bad: exposing privileged port
EXPOSE 22

# Bad: no HEALTHCHECK instruction (CKV_DOCKER_2)

# Bad: using sudo inside container (DL3004)
RUN sudo apt-get install -y nginx

# Bad: overly permissive chmod
RUN chmod 777 /app

# Bad: shell form CMD (DL3025)
CMD /app/start.sh
