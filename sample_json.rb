JSON_STR = '{
  "images": {
    "color": {
      "downsample": {
        "trigger-dpi": 225,
        "target-dpi": 150
      },
      "recompress": {
        "type": "jpeg",
        "quality": "medium"
      }
    },
    "grayscale": {
      "downsample": {
        "trigger-dpi": 225,
        "target-dpi": 150
      },
      "recompress": {
        "type": "jpeg",
        "quality": "medium"
      }
    },
    "monochrome": {
      "downsample": {
        "trigger-dpi": 450,
        "target-dpi": 300
      },
      "recompress": {
        "type": "jbig2",
        "quality": "lossy"
      }
    },
    "optimize-images-only-if-reduction-in-size": "on",
    "consolidate-duplicate-image-and-forms": "on",
    "down-convert-16-to-8-bpc-images": "on"
  },
  "transparency": {
    "quality": "medium-quality"
  },
  "fonts": {
    "subset-embedded-fonts": "on",
    "consolidate-duplicate-fonts": "on",
    "unembed-standard-14-fonts": "on",
    "resubset-subset-fonts": "off",
    "remove-unused-fonts": "on"
  },
  "objects": {
    "discard-javascript-actions": "on",
    "discard-alternate-images": "on",
    "discard-thumbnails": "on",
    "discard-document-tags": "on",
    "discard-bookmarks": "off",
    "discard-output-intent": "off"
  },
  "userdata": {
    "discard-comments-forms-multimedia": "on",
    "discard-xmp-metadata-padding": "on",
    "discard-document-information-and-metadata": "on",
    "discard-file-attachments": "on",
    "discard-external-crossreferences": "on",
    "discard-private-data": "on",
    "discard-hidden-later-content": "on"
  },
  "cleanup": {
    "compression": "compress-entire-file",
    "flate-encode-uncompressed-streams": "on",
    "convert-lzw-to-flate": "on",
    "optimize-page-content": "on",
    "optimize-for-fast-web-view": "on"
  },
  "general": {
    "write-output-even-if-increase-in-size": "off",
    "preserve-version": "off"
  },
  "color-conversion": {
    "enabled": "off",
    "color-convert-action": "convert",
    "convert-intent": "profile-intent",
    "convert-profile": "srgb"
  },
  "pdfa-conversion": {
    "enabled": "off",
    "type": "1b",
    "pdfa-target-color-space": "rgb",
    "rasterize-if-errors-encountered": "off"
  }
}'
