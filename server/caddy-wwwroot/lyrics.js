// stupid handling of the payload

const formatPlainTextToHtml = (text) => {
    let htmlText = text.replace(/(\r\n|\r|\n)/g, '<br>');
    htmlText = htmlText.replace(/([^<]*)<br>/, '<h1>$1</h1>');
    return htmlText;
}

var currentLyrics = '';

const handleLyrics = (newLyrics) => {
  let updateTimestampElement = document.getElementById('updateTimestamp');
  updateTimestampElement.innerText = new Date().toLocaleTimeString();

  if(newLyrics == currentLyrics) {
    console.log('New message, existing lyrics')
    return;
  }

  currentLyrics = newLyrics;

  let lyricsElement = document.getElementById('lyrics');
  lyricsElement.innerHTML = formatPlainTextToHtml(currentLyrics);
}

// the communication magic

import {
  connect,
  StringCodec,
} from "https://cdn.jsdelivr.net/npm/nats.ws@1.19.1/+esm";

const sc = new StringCodec();

const nc = await connect({
  servers: ["wss://live.fiftysix.site:8443"],
});

const sub = nc.subscribe("lyrics");

const handle = (msg) => {
  let newLyrics = sc.decode(msg.data)
  handleLyrics(newLyrics);
}

// Wait for messages and handle them
(async () => {
  for await (const msg of sub) handle(msg)
})();