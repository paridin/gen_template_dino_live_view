// README IF YOU WANT TO ADD A HOOK.
//
// If you need hooks usage, please take a look the following example
// also check https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html#module-js-interop-and-client-controlled-dom
//
// <input type="text" name="user[phone_number]" phx-hook="PhoneNumber"/>
//
// >>>>>>>>>>>> content on ./phone-number.js file
//
// export const PhoneNumber = {
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
// Then in this file index.js import the hook
//
// import { PhoneNumber } from "./phone-number"
//
// and finally export it

export default {
  // PhoneNumber,
};
