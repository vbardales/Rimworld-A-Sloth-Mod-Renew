// Flood-fill cutout of ModIcon-source.png from its border, never a global color threshold:
// only background pixels reachable from the edge lose alpha, so an interior dark pixel
// (eye, shadow, ponytail) that happens to match the background color stays opaque.
const sharp = require('sharp');
const path = require('path');

const here = __dirname;
const src = path.join(here, 'ModIcon-source.png');
const out = path.join(here, 'ModIcon-cutout.png');
const TOLERANCE = 28; // per-channel Euclidean-ish distance to count as "same as background"

async function main() {
  const img = sharp(src).ensureAlpha();
  const { data, info } = await img.raw().toBuffer({ resolveWithObject: true });
  const { width, height, channels } = info;
  const idx = (x, y) => (y * width + x) * channels;

  const bg = [data[idx(0, 0)], data[idx(0, 0) + 1], data[idx(0, 0) + 2]];
  const same = (x, y) => {
    const i = idx(x, y);
    const dr = data[i] - bg[0], dg = data[i + 1] - bg[1], db = data[i + 2] - bg[2];
    return Math.sqrt(dr * dr + dg * dg + db * db) <= TOLERANCE;
  };

  const visited = new Uint8Array(width * height);
  const stack = [];
  for (let x = 0; x < width; x++) { stack.push([x, 0]); stack.push([x, height - 1]); }
  for (let y = 0; y < height; y++) { stack.push([0, y]); stack.push([width - 1, y]); }

  while (stack.length) {
    const [x, y] = stack.pop();
    if (x < 0 || y < 0 || x >= width || y >= height) continue;
    const p = y * width + x;
    if (visited[p]) continue;
    if (!same(x, y)) continue;
    visited[p] = 1;
    data[idx(x, y) + 3] = 0;
    stack.push([x + 1, y], [x - 1, y], [x, y + 1], [x, y - 1]);
  }

  const cutCount = visited.reduce((a, b) => a + b, 0);
  await sharp(data, { raw: { width, height, channels } }).png().toFile(out);
  console.log(`cutout ${out}: ${cutCount} of ${width * height} px removed (${(100 * cutCount / (width * height)).toFixed(1)}%)`);
}

main().catch((e) => { console.error(e); process.exit(1); });
