FROM ghcr.io/cuhk-haosun/code-docker-minio:main

LABEL authors="Vladimir <opa_oz> Levin"
LABEL authors="Xing Zhao Milokita"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
