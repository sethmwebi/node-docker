FROM node:16
USER root
WORKDIR /app
COPY --chown=root:node package.json .
ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
        then npm install; \
        else npm install --only=production; \
        fi
COPY --chown=root:node . ./
ENV PORT 3000
EXPOSE $PORT
CMD ["node", "index.js"]