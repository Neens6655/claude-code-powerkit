---
name: video-forge
description: "TTS-narrated institutional video pipeline — script → VO (MiniMax/Gemini clone) → timing-gate → Remotion render → localize (RTL/Arabic) → trim → deliver. Distilled from v1→v11c + Arabic localization cycle. Use when asked to build narrated promo/story/institutional videos with voice cloning, multi-language, or Remotion composition."
---

# /video-forge — TTS-narrated video pipeline

## When to use

Invoke on:
- "build an institutional video / promo / resilience ad"
- "narrated video from this script"
- "Arabic version of this video" / "localize this video"
- "clone this voice and build a video"
- "re-render with new VO"
- "generate b-roll for this shot"

Decline when:
- Raw footage editing (no VO narrative) — use straight ffmpeg
- Motion graphics only (no story / no voice) — use `/scroll-experience`
- Short-form social (TikTok/IG Reels) without VO
- Live-action shooting prep — out of scope

## Phase 0 — MANDATORY

Before ANY work, check for `corrections/videoforge-*.md` files in your skills directory and load all rules as session constraints. These represent hard-won lessons from the v1→v11c cycle. Print: `loaded N corrections` before proceeding.

## Provider decision trees

### TTS routing

```
Goal                              → Provider                              Why
───────────────────────────────────────────────────────────────────────────────────────
Voice clone (premium)             → MiniMax speech-02-hd                  Best Arabic/Gulf; cloned from YouTube ref.
                                    REQUIRES 10s+ sample (rule 001)       Cost: ~$1 clone + ~$0.01/1K chars.
Voice clone fallback              → Replicate XTTS-v2 (lucataco/xtts-v2)  When MiniMax balance 0 or rejects.
                                                                          Arabic supported. Lower quality than MiniMax.
No clone, English/multi-lang      → Gemini TTS (Orus/Charon/Iapetus/      Free tier, fast. Voices don't clone.
                                    Rasalgethi)                           Arabic works but not native-sounding.
Premium production VO             → ElevenLabs (if budget approved)       Best cloning quality overall.
```

### Video gen routing

```
Goal                              → Provider                              Why
───────────────────────────────────────────────────────────────────────────────────────
8s cinematic clip, 1080p          → Veo 3.1 (Google generateVideos)       1080p native. Long-op. ~$0.50/clip.
5-10s b-roll, fast                → Seedance 2.0 (Replicate, bytedance)   720p max — upscale via ffmpeg if needed.
Image-to-video from screenshot    → Seedance 2.0 image ref mode           PNG/JPEG auto-detected.
>10s narrative                    → Kling / Runway                        Slower, premium tier.
Library footage available         → ALWAYS use library first              Faster, free, consistent palette.
```

**Replicate MCP**: reserved for exploratory/one-off calls. For repeated section-level generation use direct API + cache-aware scripts (`seedance-generate.mjs` pattern).

## Pipeline

```
Phase 1 — SCRIPT      : video.md (N shots; each has VO, ONSCREEN kind, duration, CLIP, flags)
Phase 2 — VO          : gen-vo-elevenlabs.mjs (primary) OR gen-vo-batch.mjs (MiniMax clone)
Phase 3 — TIMING GATE : validate-timing.mjs — blocks render on VO/slot CUT or FREEZE mismatch
Phase 4 — CLIPS       : gen-clip-router.mjs — routes shots to Veo 3.1 / Kling / Seedance / Ray3
                        based on flags (face/hdr/long/brand). Library match first.
Phase 5 — STORYBOARD  : build-storyboard.mjs → public/storyboard.json (or storyboard.ar.json)
Phase 6 — RENDER      : npx remotion render --concurrency=1 (rule 014)
Phase 6.5 — SELF-REVIEW: review-render.mjs — ffprobe + frame-sample + loudness gate
Phase 7 — MUX+TRIM    : FFmpeg MCP (preferred) or compress-and-mux.sh fallback
Phase 7.5 — REFINE    : natural-language edit loop ("trim last 5s")
Phase 8 — LOCALIZE    : swap .en.md→.ar.md, TextOverlay→TextOverlayAR, SPEED=1.3
Phase 9 — DELIVER     : copy to Desktop with client-friendly name, checkpoint the state
```

Phases 5, 6.5, and 7 auto-call `/checkpoint save` so long builds survive session end.

## Rules (hard-coded, non-negotiable)

- **NEVER render without a timing-gate pass.** v1→v7 shipped 12 broken shots because there was no gate. Rule 011.
- **NEVER use MiniMax clone with <10s sample** → status_code 2037. Rule 001.
- **NEVER use ffmpeg atempo > 1.3.** Above 1.3 audio sounds compressed/rushed. Rule 003.
- **NEVER leave baked-in text in a source video you may localize later.** ffmpeg overlay can't mask cleanly; you WILL re-render from Remotion. Rule 004.
- **NEVER run scripts from a parent cwd** → MODULE_NOT_FOUND. Always `cd` to the project first. Rule 006.
- **ALWAYS check MiniMax balance before voice_clone call** → status_code 1008 on empty. Rule 007.
- **ALWAYS verify render output file exists**, not log content, for background renders (they complete silently). Rule 008.
- **ALWAYS budget Arabic VO at ~1.45× English runtime.** Same script at same speaker speed = longer in Arabic. Rule 009.
- **ALWAYS use `--concurrency=1` on Remotion** → OOM otherwise on 2min+ renders. Rule 014.
- **ALWAYS use lossless stream-copy (`-c copy`) for final runtime trims.** Rule 016.
- **ALWAYS use `-shortest` on mux** to avoid phantom trailing silence. Rule 017.

## Key knowledge (load on demand)

| Need | What to look for |
|------|-----------------|
| TTS provider matrix | `knowledge/tts-provider-matrix.md` |
| Video-gen matrix | `knowledge/video-gen-provider-matrix.md` |
| Timing-gate pattern | `knowledge/timing-gate-pattern.md` |
| Voice clone (MiniMax) | `knowledge/voice-clone-workflow.md` |
| Arabic RTL in Remotion | `knowledge/arabic-rtl-remotion.md` |
| ffmpeg recipes | `knowledge/ffmpeg-recipes.md` |
| Remotion composition | `knowledge/remotion-composition-pattern.md` |

## Scripts (battle-tested)

| File | Purpose |
|------|---------|
| `scripts/clone-voice.mjs` | MiniMax upload→clone→t2a_v2, cache voice_id locally |
| `scripts/gen-vo-batch.mjs` | Batched VO generation, speed-configurable (MiniMax or Gemini) |
| `scripts/validate-timing.mjs` | VO vs slot mismatch detector (the timing gate) |
| `scripts/rehash-vo-cache.mjs` | Relink VO cache when only duration changed (avoids TTS re-run) |
| `scripts/cut-clips-to-exact-duration.sh` | ffmpeg loop+trim per scene to exact target duration |
| `scripts/build-storyboard.mjs` | Generate storyboard.json from script map |
| `scripts/compress-and-mux.sh` | setpts + atempo + loudnorm + mux + trim final |

## Templates

| File | Purpose |
|------|---------|
| `templates/video.en.md` | 17-shot English skeleton |
| `templates/video.ar.md` | 17-shot Arabic skeleton (institutional register, ONSCREEN RTL text) |
| `templates/brand.json` | Palette + font pairs (IBM Plex Serif/Mono EN + IBM Plex Sans Arabic / Noto Kufi Arabic AR) |
| `templates/TextOverlay.tsx` | LTR text overlay reference component |
| `templates/TextOverlayAR.tsx` | RTL text overlay (direction:rtl, flex-row-reverse, right-aligned bullets) |

## Version history lessons

| Version | Core lesson |
|---------|-------------|
| v1–v7 | No timing gate → **12 of 17 shots broken** by v7. VO/slot mismatch went undetected for 7 versions. Led to validate-timing.mjs. |
| v8 | Timing gate introduced. Gate now blocks render on CUT/FREEZE mismatch. |
| v9 | Seedance image-to-video works from PNG + JPEG. Resolution max 720p — upscale via ffmpeg. |
| v10–v11 | Shaky drone footage can't be rescued by vidstab alone. When stab fails, pivot to clean b-roll. |
| v11c | Crop 100px bottom for subtitle burn-in, rescale 1920×1080 after crop. |
| Arabic cycle | MiniMax voice clone + full RTL Remotion re-render. Arabic = 1.45× English runtime at same pace. End on synthesis scene, not call-to-action. |
| Final trim | Use lossless stream-copy for <1s trims. Re-render from Remotion only when content changes. |

## Checkpoint integration

Auto-checkpoint after:
- Phase 5 (STORYBOARD ready, before render)
- Phase 7 (MUX done, before localize)
- Phase 9 (DELIVERED — final state)

Naming: `videoforge-{project}-{date}`. Use `/checkpoint resume videoforge-X` to continue.

## What this skill does NOT do

- Music bed (no stable provider wired yet)
- Subtitle/caption tracks — separate workflow
- Multi-speaker interview assembly — single-narrator only
- Live-action shooting logistics
