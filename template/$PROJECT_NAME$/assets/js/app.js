// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Since we don't want to use by default the local socket just import from phoenix.
import { Socket } from "phoenix" 

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"


import LiveSocket from "phoenix_live_view"

// Import liveview bases and connect.
//
// If you need hooks usage, please take a look the following example
// also check https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html#module-js-interop-and-client-controlled-dom
// 
// <input type="text" name="user[phone_number]" phx-hook="PhoneNumber"/>
//
// let Hooks = {}
// Hooks.PhoneNumber = {
//     mounted(){
//       this.el.addEventListener("input", e => {
//         let match = this.el.value.replace(/\D/g, "").match(/^(\d{3})(\d{3})(\d{4})$/)
//         if(match) {
//           this.el.value = `${match[1]}-${match[2]}-${match[3]}`
//         }
//       })
//     }
//   }
//
// let liveSocket = new LiveSocket("/socket", Socket, {hooks: Hooks})

const csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
const liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}});
liveSocket.connect()