<template>
  <div ref="terminal"></div>
</template>

<script>
import "xterm/dist/xterm.css";
import "xterm/dist/addons/fullscreen/fullscreen.css";

import { Terminal } from "xterm";
import * as fit from "xterm/lib/addons/fit/fit";
import * as fullscreen from "xterm/lib/addons/fullscreen/fullscreen";
import * as webLinks from "xterm/lib/addons/webLinks/webLinks";
import * as attach from "xterm/lib/addons/attach/attach";

export default {
  name: "Index",
  created() {
    Terminal.applyAddon(attach);
    Terminal.applyAddon(fit);
    Terminal.applyAddon(fullscreen);
    Terminal.applyAddon(webLinks);

    const terminal = new Terminal();
    const ws = new WebSocket("ws://127.0.0.1:8000/terminal?container=8c548b4285c9&welcome=Welcome+to+Alibaba+Cloud Elastic+Compute+Service+!");
    ws.onclose = function() {
      console.log("服务器关闭了连接");
    };
    terminal.open(this.$refs.terminal);
    terminal.fit();
    terminal.toggleFullScreen();
    terminal.webLinksInit();
    terminal.attach(ws);
  }
};
</script>
