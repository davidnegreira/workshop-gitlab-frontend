FROM rolandocaldas/angular

COPY application /application
COPY server /server

RUN cd /application/marvel-like && npm install
RUN cd /application/marvel-like && ng build --prod
RUN cd /server && 
RUN cp -r /application/marvel-like/dist/marvel-like /server/dist

WORKDIR "/server"

EXPOSE 4200

CMD [ "node", "server.js" ]