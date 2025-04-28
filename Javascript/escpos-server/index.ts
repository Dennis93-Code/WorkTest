import { Printer } from "@node-escpos/core";
import Network from "@node-escpos/network-adapter";
import { Hono, type Context } from "hono";
import { createBunWebSocket } from 'hono/bun'

// This only work on network but not on live server
const { upgradeWebSocket, websocket } = createBunWebSocket()

const app = new Hono();
const PORT = 3000;

app.get("", upgradeWebSocket((context) => ({
  onMessage: (event , ws) => {
    const printerIp = event.data as string;
    const device = new Network(printerIp);
    let printer = new Printer(device, { encoding: "GB18030" });

    device.open((error) => {

      if (error && error?.message) {
        ws.send(error.message);
        return;
      }

      printer
        .font('a')
        .align('ct')
        .style('bu')
        .size(1, 1)
        .text('The quick brown fox jumps over the lazy dog')
        .text('敏捷的棕色狐狸跳过懒狗')
        .barcode('1234567', 'EAN8', { height: 50, width: 50 })
        .table(["One", "Two", "Three"])
        .tableCustom(
          [
            { text: "Left", align: "LEFT", width: 0.33, style: 'B' },
            { text: "Center", align: "CENTER", width: 0.33 },
            { text: "Right", align: "RIGHT", width: 0.33 }
          ],
          { encoding: 'cp857', size: [1, 1] } // Optional
        );

      printer
        .cut()
        .close()
    });
  },
  onOpen: (event, socket) => {
    
  },
  onClose: (event, ws) => {

  }
})))

export default {
  port: PORT,
  fetch: app.fetch,
  websocket
}