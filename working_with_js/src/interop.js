// This is called BEFORE your Elm app starts up
//
// The value returned here will be passed as flags
// into your `Shared.init` function.
//
import "./web-components/forest-demo.js";
export const flags = ({ env }) => {
  return {
    message: "Hello, from JavaScript flags!",
  };
};

// This is called AFTER Elm app starts up
//
// Here you can wok with app.ports to send messages
// to your Elm application, or subscribe to incoming
// messages from Elm
//

export const onReady = ({ app, env }) => {
  if (app.ports && app.ports.outgoing) {
    app.ports.outgoing.subscribe(({ tag, data }) => {
      // Print out the message sent from Elm
      console.log(tag, data);
      switch (tag) {
        case "OPEN_WINDOW_DIALOG":
          window.alert(data);
          return;

        default:
          console.warn(`Unhandled outgoing port:"${tag}"`);
          return;
      }
    });
  }
};
