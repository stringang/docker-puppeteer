# https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#running-puppeteer-in-docker

FROM buildkite/puppeteer:latest

ENV TYPEFACE source-han-sans
ENV SOURCE_HAN_SANS_VERSION 2.004R

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update && apt-get install -y \
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
