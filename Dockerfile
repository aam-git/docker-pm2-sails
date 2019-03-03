FROM keymetrics/pm2:latest-slim
LABEL maintainer="AAMServices <info@aamservices.uk>"

WORKDIR /usr/src/app

RUN curl -fsSL "https://raw.githubusercontent.com/aam-git/docker-pm2-sails/master/ecosystem.config.js" -o ecosystem.config.js && \
    npm i -g sails && \
    sails new sailsApp --minimal

EXPOSE 3000

CMD [ "pm2-runtime", "start", "ecosystem.config.js" ]
