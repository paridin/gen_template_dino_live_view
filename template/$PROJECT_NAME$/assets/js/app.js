// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "alpinejs";
import "phoenix_html";

import LiveSocket from "phoenix_live_view";
// Import LiveViewHooks
import LiveViewHooks from "./liveview";
// Since we don't want to use by default the local socket just import from phoenix.
import { Socket } from "phoenix";
// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css";
// Support for topbar to loading states.
import topbar from "topbar";

topbar.config({
  barThickness: 5,
  barColors: {
    0: "rgba(26,  188, 156, .7)",
    ".3": "rgba(41,  128, 185, .7)",
    "1.0": "rgba(231, 76,  60,  .7)",
  },
  shadowBlur: 8,
  shadowColor: "rgba(0, 0, 0, .5)",
});

window.addEventListener("phx:page-loading-start", (info) => topbar.show());
window.addEventListener("phx:page-loading-stop", (info) => topbar.hide());

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

const csrfToken = document
  .querySelector("meta[name='csrf-token']")
  .getAttribute("content");

const liveSocket = new LiveSocket("/live", Socket, {
  hooks: LiveViewHooks,
  dom: {
    onBeforeElUpdated(from, to) {
      if (from.__x) {
        window.Alpine.clone(from.__x, to);
      }
    },
  },
  params: { _csrf_token: csrfToken },
});

liveSocket.connect();

if (process.env.NODE_ENV === "development") {
  window.liveSocket = liveSocket;

  // Then during your code session, you can use the browser console:
  // liveSocket.enableDebug()

  // to simulate latency, you can use the browser console:
  // liveSocket.enableLatencySim(1000)
}
