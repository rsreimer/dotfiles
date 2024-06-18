import puppeteer from "puppeteer";

const browser = await puppeteer.launch();
const page = await browser.newPage();

await page.goto("https://localhost:8080/");
await page.setViewport({ width: 1530, height: 885 });

await page.screenshot({ path: "../layout.png" });

await browser.close();
