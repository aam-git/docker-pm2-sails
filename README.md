Docker PM2 Sails v1.0
========
powered by pm2:latest-slim image

[Sails][1] makes it easy to build custom, enterprise-grade Node.js apps.


Instructions for Composer
========

```
1) choose one of the 3 versions below
traditional - $ curl -sSL https://raw.githubusercontent.com/aam-git/docker-pm2-sails/master/ecosystem.config.js > docker-compose.yml
minimal - $ curl -sSL https://raw.githubusercontent.com/aam-git/docker-pm2-sails/minimal/ecosystem.config.js > docker-compose.yml
caviar - $ curl -sSL https://raw.githubusercontent.com/aam-git/docker-pm2-sails/caviar/ecosystem.config.js > docker-compose.yml

2) $ docker-compose up -d

2) go to your web url (eg. http://127.0.0.1:1337)
```


Available tags you can use in docker compose (default master): master, minimal or caviar

## docker-compose.yml

```yaml
version: '2'
services:
  mongo:
    image: mongo
    hostname: mongo
    restart: unless-stopped
    networks:
      - internal
    volumes:
      - mongodb_data:/data/db
  sails:
    image: aamservices/pm2-sails:latest
    restart: unless-stopped
    volumes:
      - sails_data:/usr/src/app
    networks:
      - internal
    ports:
      - 1337
    depends_on:
      - mongo
volumes:
  mongodb_data:
    driver: local
  sails_data:
    driver: local
```


[1]: https://sailsjs.com
