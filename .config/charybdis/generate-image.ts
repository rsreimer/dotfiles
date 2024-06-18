import { launch } from "puppeteer";
import { createServer } from "http-server";

async function main() {
  const server = createServer({ cache: -1 });

  server.listen(8080);

  const browser = await launch();
  const page = await browser.newPage();

  await page.goto("http://localhost:8080/");
  await page.setViewport({ width: 1530, height: 885 });

  await page.screenshot({ path: "layout.png" });

  await browser.close();
  server.close();
}

main();
