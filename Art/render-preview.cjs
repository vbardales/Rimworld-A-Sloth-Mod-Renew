// Requires playwright and sharp. Run with Node; Chrome must be installed.
const fs = require('node:fs');
const path = require('node:path');
const http = require('node:http');
const { chromium } = require('playwright');
const sharp = require('sharp');
const root = path.resolve(__dirname, '..');
const mime = {'.html':'text/html','.json':'application/json','.png':'image/png','.xml':'application/xml'};
const server = http.createServer((req,res)=>{
  const file=path.resolve(root,'.'+decodeURIComponent(req.url.split('?')[0]));
  if(!file.startsWith(root+path.sep)){res.writeHead(403).end();return;}
  fs.readFile(file,(err,data)=>{if(err){res.writeHead(404).end();return;}res.setHeader('Content-Type',mime[path.extname(file)]||'text/plain');res.end(data);});
});
function lum(rgb){const c=rgb.map(v=>{v/=255;return v<=.04045?v/12.92:((v+.055)/1.055)**2.4;});return .2126*c[0]+.7152*c[1]+.0722*c[2];}
function ratio(a,b){return (Math.max(a,b)+.05)/(Math.min(a,b)+.05);}
(async()=>{
  await new Promise(resolve=>server.listen(0,'127.0.0.1',resolve));
  let browser;
  try{
    browser=await chromium.launch({executablePath:process.env.CHROME_PATH||'C:/Program Files/Google/Chrome/Application/chrome.exe',headless:true});
    const page=await browser.newPage({viewport:{width:896,height:504},deviceScaleFactor:1});
    await page.goto(`http://127.0.0.1:${server.address().port}/Art/preview.html`);
    await page.evaluate(()=>window.previewReady);
    const cdp=await page.context().newCDPSession(page);
    await cdp.send('DOM.enable');await cdp.send('CSS.enable');
    const {root:dom}=await cdp.send('DOM.getDocument');
    const fonts={},regions={};
    for(const selector of ['h1','h1 .link','h1 .suffix','.tag','p','.version']){
      const {nodeId}=await cdp.send('DOM.querySelector',{nodeId:dom.nodeId,selector});
      fonts[selector]=(await cdp.send('CSS.getPlatformFontsForNode',{nodeId})).fonts;
      if(!fonts[selector].length||fonts[selector].some(f=>!/^Segoe UI(?: Semibold| Bold)?$/.test(f.familyName)))throw Error('Unexpected font: '+JSON.stringify(fonts));
      regions[selector]=await page.locator(selector).evaluate(el=>{const r=el.getBoundingClientRect();return {x:r.x,y:r.y,width:r.width,height:r.height,color:getComputedStyle(el).color};});
    }
    const final=path.join(root,'Mod/About/Preview.png');
    await page.screenshot({path:final});
    await sharp(final).resize(268).png().toFile(path.join(__dirname,'preview-268.png'));
    await page.addStyleTag({content:'.text{visibility:hidden}.version{visibility:hidden}'});
    const background=path.join(__dirname,'preview-background.png');
    await page.screenshot({path:background});
    const {data,info}=await sharp(background).removeAlpha().raw().toBuffer({resolveWithObject:true});
    const contrast={};
    // All pixels in each text rectangle: stricter than four corner samples; excludes shadows.
    for(const selector of ['h1','h1 .link','h1 .suffix','.tag','p']){
      const r=regions[selector],ink=lum(r.color.match(/\d+/g).slice(0,3).map(Number));
      let min=Infinity,point;
      for(let y=Math.floor(r.y);y<Math.ceil(r.y+r.height);y++)for(let x=Math.floor(r.x);x<Math.ceil(r.x+r.width);x++){
        const i=(y*info.width+x)*info.channels;
        const value=ratio(ink,lum([...data.subarray(i,i+3)]));
        if(value<min){min=value;point=[x,y];}
      }
      contrast[selector]={minimum:min,point};
      if(min<4.5)throw Error('Contrast failure '+selector+': '+min);
    }
    const palette=JSON.parse(fs.readFileSync(path.join(__dirname,'preview-palette.json'),'utf8').replace(/^\uFEFF/,''));
    const toRGB=hex=>hex.match(/\w\w/g).map(x=>parseInt(x,16));
    contrast.badge=ratio(lum(toRGB(palette.badgeInk)),lum(toRGB(palette.accent)));
    if(contrast.badge<4.5)throw Error('Badge contrast failure');
    const bytes=fs.statSync(final).size;
    if(bytes>=900000)throw Error('Preview exceeds 900 kB');
    const report={fonts,regions,contrast,bytes,version:await page.locator('.version').textContent(),dimensions:[896,504],fontReady:true};
    fs.writeFileSync(path.join(__dirname,'preview-qa.json'),JSON.stringify(report,null,2)+'\n');
    console.log(JSON.stringify({contrast,bytes,version:report.version,fonts:'Segoe UI confirmed via Chrome platform font data'}));
  }finally{if(browser)await browser.close();server.close();}
})().catch(err=>{console.error(err);process.exitCode=1;});
