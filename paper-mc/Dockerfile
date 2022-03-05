ARG base_image=openjdk:slim
FROM ${base_image} AS build

RUN apt-get update && apt-get install -y --no-install-recommends jq curl

WORKDIR /papermc
ARG PAPER_URL=https://papermc.io/api/v2/projects/paper
ARG PAPER_BUILD="latest"
ARG MC_VERSION="1.18.1"

RUN set -ex && \
	if test "${MC_VERSION}" = "latest"; then MC_VERSION=$(curl -sSL $PAPER_URL | jq -r '.versions[-1]'); fi && \
	if test "${PAPER_BUILD}" = "latest"; then PAPER_BUILD=$(curl -sSL $PAPER_URL/versions/${MC_VERSION} | jq '.builds[-1]'); fi && \
	JAR_NAME=paper-${MC_VERSION}-${PAPER_BUILD}.jar && \
	curl -sSLo paper.jar ${PAPER_URL}/versions/${MC_VERSION}/builds/${PAPER_BUILD}/downloads/${JAR_NAME}

# Run paperclip so it performs its first time setup, `--version` used to ensure server immediately exits
RUN java -jar paper.jar --version && false

FROM ${base_image} AS runtime

EXPOSE 25565/tcp
EXPOSE 25565/udp
VOLUME /papermc
WORKDIR /papermc

ENV MEM_ARGS="-XX:InitialRAMPercentage=80 -XX:MaxRAMPercentage=80"
ENV JVM_ARGS="${MEM_ARGS} -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true"
ENV MC_ARGS="-Dcom.mojang.eula.agree=true"
ENV SPIGOT_ARGS=""
ENV PAPER_ARGS=""

# Obtain runable jar from build stage
COPY --from=build /papermc /opt/papermc

CMD java ${JVM_ARGS} -server ${MC_ARGS} -jar /opt/papermc/paper.jar nogui ${SPIGOT_ARGS} ${PAPER_ARGS}
