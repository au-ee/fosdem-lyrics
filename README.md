# A lazy developer's approach to building real-time web applications

This repository holds the example to my 2024 FOSDEM talk:

https://fosdem.org/2024/schedule/event/fosdem-2024-2231-a-lazy-developer-s-approach-to-building-real-time-web-applications/

The intention of my talk is to show how easy it is to build a scalable messaging solution which 
can power a static web page so that it is able to distribute real time information 
to many visitors at once.

... all of that with minimum effort and maximum effect.

Just like lazy developers like it :-)

There are two subfolders:

- server ((README)[server/README.md])

  The server part of the example shown in my talk:

  A docker compose file which spins up:

  - a webserver hosting the static web page

  - a NATS server which powers the web page with real-time capabilities

  - an EMQX MQTT server as an alternative protocol to NATS

- demo-publisher ((README)[demo-publisher/README.md])
  
  Just like the music stand software in my example, the shell script in this folder 
  will publish song texts  to the respective topics on the example NATS and MQTT servers.

Markus Renschler / 2024-01
