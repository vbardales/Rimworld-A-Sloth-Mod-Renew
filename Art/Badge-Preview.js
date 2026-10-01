// Badges Mod/About/Preview.png with the flood-fill cutout of ModIcon, in whichever corner
// is emptiest, bleeding off the canvas edge like it is climbing out of the frame.
const sharp = require('sharp');
const path = require('path');

const here = __dirname;
const base = path.join(here, 'Preview.png'); // unbadged source
const cutout = path.join(here, 'ModIcon-cutout.png');
const dst = path.join(here, '..', 'Mod', 'About', 'Preview.png');

const BADGE = 190; // px
const BLEED_PX = 5; // px hanging past the canvas edge, fixed (not proportional)
const CROP_W = 260, CROP_H = 200; // corner sample region for emptiness

const CORNERS = {
  bottomLeft: { angle: 15, gravity: 'southwest' },
  bottomRight: { angle: -15, gravity: 'southeast' },
  topLeft: { angle: -15, gravity: 'northwest' },
  topRight: { angle: 15, gravity: 'northeast' },
};

async function emptiness(img, w, h, corner) {
  const left = corner.includes('west') ? 0 : w - CROP_W;
  const top = corner.includes('north') ? 0 : h - CROP_H;
  // .stats() on a chained .extract() ignores the crop in this sharp version; materialize first.
  const buf = await sharp(img).extract({ left, top, width: CROP_W, height: CROP_H }).png().toBuffer();
  const { channels } = await sharp(buf).stats();
  return channels.reduce((s, c) => s + c.stdev, 0);
}

async function main() {
  const meta = await sharp(base).metadata();
  const { width: W, height: H } = meta;

  const scores = {
    bottomLeft: await emptiness(base, W, H, 'southwest'),
    bottomRight: await emptiness(base, W, H, 'southeast'),
    topLeft: await emptiness(base, W, H, 'northwest'),
    topRight: await emptiness(base, W, H, 'northeast'),
  };

  const pick = 'bottomLeft'; // owner override, 2026-09-29: left side, not auto-picked

  const { angle, gravity } = CORNERS[pick];
  console.log('corner scores (stdev sum, lower = emptier):', scores, '-> picked', pick);

  // rotate() pads to the rotated bounding box with transparent margin; trim() strips that
  // margin so the 5px bleed below is measured against the opaque silhouette, not the padding.
  const rotated = await sharp(cutout)
    .resize(BADGE, BADGE, { fit: 'contain', background: { r: 0, g: 0, b: 0, alpha: 0 } })
    .rotate(angle, { background: { r: 0, g: 0, b: 0, alpha: 0 } })
    .trim({ background: { r: 0, g: 0, b: 0, alpha: 0 } })
    .toBuffer();
  const rotMeta = await sharp(rotated).metadata();
  const rw = rotMeta.width, rh = rotMeta.height;

  // Work on a canvas extended by the badge size on the relevant sides, so the bleed offset
  // never goes negative for sharp composite; extract the original W x H back afterward.
  const padL = gravity.includes('west') ? rw : 0;
  const padR = gravity.includes('east') ? rw : 0;
  const padT = gravity.includes('north') ? rh : 0;
  const padB = gravity.includes('south') ? rh : 0;

  const extended = await sharp(base)
    .extend({ top: padT, bottom: padB, left: padL, right: padR, background: { r: 0, g: 0, b: 0, alpha: 0 } })
    .toBuffer();

  let left, top;
  if (gravity === 'southwest') { left = padL - BLEED_PX; top = padT + H - rh + BLEED_PX; }
  if (gravity === 'southeast') { left = padL + W - rw + BLEED_PX; top = padT + H - rh + BLEED_PX; }
  if (gravity === 'northwest') { left = padL - BLEED_PX; top = padT - BLEED_PX; }
  if (gravity === 'northeast') { left = padL + W - rw + BLEED_PX; top = padT - BLEED_PX; }

  const composited = await sharp(extended)
    .composite([{ input: rotated, left, top }])
    .extract({ left: padL, top: padT, width: W, height: H })
    .png()
    .toBuffer();

  await sharp(composited).toFile(dst);
  console.log(`badged ${dst}: corner=${pick} angle=${angle} badge=${BADGE}px bleed=${BLEED_PX}px`);
}

main().catch((e) => { console.error(e); process.exit(1); });
