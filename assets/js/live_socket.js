import { Socket } from "phoenix";
import LiveSocket from "phoenix_live_view";
import SimpleBar from "simplebar";

let hooks = {};
hooks.SimpleBar = {
  mounted() {
    new SimpleBar(this.el);
  },
  updated() {
    new SimpleBar(this.el);
  }
};

let liveSocket = new LiveSocket("/live", Socket, { hooks });
liveSocket.connect();

export default liveSocket;
