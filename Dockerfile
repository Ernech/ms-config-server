FROM azul/zulu-openjdk:11.0.11
RUN apt update
RUN mkdir -p /opt/arquitectura/logs
VOLUME /opt/arquitectura/logs
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app

ENV SERVER_PORT 8887
ENV EUREKA_URI "http://localhost:8763/eureka"

ENTRYPOINT ["java",\
 "-cp",\
 "app:app/lib/*",\
 "com.arquitecturasoftware.msconfigserver.MsConfigServerApplication"]