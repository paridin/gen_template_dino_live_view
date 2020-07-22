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
// Support for NProgress loading states.
import NProgress from "nprogress";
// Since we don't want to use by default the local socket just import from phoenix.
import { Socket } from "phoenix";
// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css";

NProgress.configure({ showSpinner: false, minimum: 0.1 });

window.addEventListener("phx:page-loading-start", (info) => NProgress.start());
window.addEventListener("phx:page-loading-stop", (info) => NProgress.done());

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
