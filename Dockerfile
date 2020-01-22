FROM keymetrics/pm2:12-slim
LABEL maintainer="AAMServices <info@aamservices.uk>"

WORKDIR /usr/src/app

RUN curl -fsSL "https://raw.githubusercontent.com/aam-git/docker-pm2-sails/master/ecosystem.config.js" -o ecosystem.config.js && \
    npm i -g sails && \
    sails new sailsApp --traditional

EXPOSE 3000

CMD [ "pm2-runtime", "start", "ecosystem.config.js" ]
