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

- demo-publisher ((README)[demo-publisher/README.md])
  
  Just like the music stand software in my example, the shell script in this folder 
  will publish song texts to the respective topic on the example NATS server.

----

This work is licensed under the Creative Commons Attribution 4.0 International License. To view a copy of this license, visit [creativecommons.org/licenses/by/4.0](https://creativecommons.org/licenses/by/4.0) or see the `LICENSE.md` file.

## Attribution

If you use or adapt the contents of this repository, you are required to give appropriate attribution by including the following information:

- Author: Markus Renschler
- Repository: https://github.com/au-ee/fosdem-lyrics

You may provide the attribution in a manner that is reasonable for the medium or means you are using, such as a credits section, readme file, or elsewhere.

## Disclaimer

This license does not grant you any trademark or other intellectual property rights concerning the contents of this repository. If you have questions about the licensing or use of this work, please contact the author at https://github.com/au-ee.

