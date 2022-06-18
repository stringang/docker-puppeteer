# https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#running-puppeteer-in-docker

FROM buildkite/puppeteer:latest

ENV TYPEFACE source-han-sans
ENV SOURCE_HAN_SANS_VERSION 2.004R

RUN apt-get update && apt-get install -y \
    fonts-ipafont-gothic \
    fonts-wqy-zenhei \
    fonts-thai-tlwg \
    fonts-kacst \
    fonts-freefont-ttf \
    curl \
    unzip

# Source Han Sans
# https://wiki.debian.org/Fonts
RUN curl -fsSLO --compressed "https://github.com/adobe-fonts/$TYPEFACE/releases/download/$SOURCE_HAN_SANS_VERSION/SourceHanSansCN.zip" \
    && unzip SourceHanSansCN.zip \
    && cp -r SubsetOTF/CN/ /usr/local/share/fonts/$TYPEFACE/ \
    && fc-cache -fv \
    && rm -rf SourceHanSansCN.zip SubsetOTF LICENSE.txt
