---
name: baoyu-image-gen
description: Generate images using multiple AI image providers via Replicate MCP — Flux, Stable Diffusion, DALL-E, Ideogram. Handles prompt engineering, aspect ratio selection, style guidance, and batch generation. Use when you need hero images, illustrations, product mockups, or visual assets for any project.
---

# /baoyu-image-gen — Multi-Provider AI Image Generation

One skill, every major image model. Get the best image for the job.

## Usage

```
/baoyu-image-gen [description of desired image]
```

Examples:
- `/baoyu-image-gen a geometric Bauhaus-style hero image for a tech startup, beige and charcoal`
- `/baoyu-image-gen product mockup: dark UI dashboard on a MacBook screen, office background`
- `/baoyu-image-gen editorial illustration: person thinking at a desk, flat vector style`

## Provider Selection

| Model | Best For | Style |
|-------|----------|-------|
| **Flux Schnell** | Fast iteration, concepts | Versatile |
| **Flux Dev** | High quality, detailed | Versatile |
| **Flux Pro** | Production-ready assets | Versatile |
| **SDXL** | Artistic, stylized | Flexible |
| **Ideogram** | Text in images, logos | Graphic design |

Default: **Flux Dev** (balance of quality + speed)

Override: `/baoyu-image-gen --model ideogram [description]`

## Prompt Engineering

Claude automatically enhances your description with:
- **Style modifiers** — "professional photography", "flat vector", "editorial illustration"
- **Quality boosters** — "sharp focus", "high detail", "award winning"
- **Negative prompts** — removes common issues (blur, watermarks, distortion)

### Good Prompts
```
✅ "A minimal poster design, IBM Plex Mono typography, beige background, 
   geometric shapes in black and gold, high contrast, editorial style"

✅ "Product photo: white ceramic coffee mug on a wooden desk, 
   morning light from left, shallow depth of field, lifestyle photography"
```

### Bad Prompts
```
❌ "Cool image" (no direction)
❌ "Logo" (too vague — describe the actual visual)
```

## Aspect Ratios

```
/baoyu-image-gen --ratio 16:9 [description]   # widescreen, hero images
/baoyu-image-gen --ratio 1:1  [description]   # square, social media
/baoyu-image-gen --ratio 9:16 [description]   # portrait, mobile, stories
/baoyu-image-gen --ratio 4:3  [description]   # landscape, presentations
```

## Batch Generation

```
/baoyu-image-gen --batch 4 [description]
```

Generates 4 variations simultaneously. Claude picks the best one and explains why.

## Style Presets

```
/baoyu-image-gen --style bauhaus [description]
  → Geometric, beige/charcoal/black palette, IBM Plex typography if text present

/baoyu-image-gen --style editorial [description]
  → Magazine quality, dramatic lighting, sophisticated composition

/baoyu-image-gen --style flat [description]
  → Flat vector illustration, clean shapes, limited color palette

/baoyu-image-gen --style photo [description]
  → Photorealistic, natural lighting, high detail
```

## Setup Requirements

- Replicate API token (replicate.com) in your environment
- Already configured in this kit's `configs/mcp.json` as `replicate` MCP server

## Tips

- Describe composition, not just content: "subject in the left third, blurred background on right" outperforms "subject with background"
- For brand-consistent images: always include your palette colors by hex code
- Ideogram is the only model reliably good at text-in-images (other models distort letters)
- Generate 4 variants and pick — single shots rarely nail it on the first try
