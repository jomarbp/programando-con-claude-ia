#!/usr/bin/env python3
"""
Genera códigos QR para el curso.
Uso: python scripts/generar-qr.py
"""
import qrcode
from qrcode.constants import ERROR_CORRECT_H
from PIL import Image, ImageDraw, ImageFont
import os

URLS = {
    "curso-principal": "https://jomarbp.github.io/programando-con-claude-ia/",
    "github-repo": "https://github.com/jomarbp/programando-con-claude-ia",
    "demo-landing": "https://jomarbp.github.io/programando-con-claude-ia/demos/landing/",
    "demo-tienda": "https://jomarbp.github.io/programando-con-claude-ia/demos/tienda/",
    "whatsapp": "https://wa.me/51970779871",
}

OUT_DIR = "recursos/qr"
NARANJA = "#E8742C"
AZUL = "#1F3A5F"

os.makedirs(OUT_DIR, exist_ok=True)

for nombre, url in URLS.items():
    qr = qrcode.QRCode(
        version=None,
        error_correction=ERROR_CORRECT_H,
        box_size=12,
        border=2,
    )
    qr.add_data(url)
    qr.make(fit=True)

    img = qr.make_image(fill_color=AZUL, back_color="white").convert("RGB")

    # Agregar borde con título
    W, H = img.size
    final_h = H + 80
    final = Image.new("RGB", (W, final_h), "white")
    final.paste(img, (0, 0))
    draw = ImageDraw.Draw(final)
    try:
        font = ImageFont.truetype("arial.ttf", 22)
        font_small = ImageFont.truetype("arial.ttf", 14)
    except:
        font = ImageFont.load_default()
        font_small = ImageFont.load_default()

    titulo = nombre.replace("-", " ").upper()
    draw.text((W // 2, H + 15), titulo, fill=AZUL, font=font, anchor="mm")
    draw.text((W // 2, H + 50), "OJB Soluciones Informaticas", fill=NARANJA, font=font_small, anchor="mm")

    out = f"{OUT_DIR}/qr-{nombre}.png"
    final.save(out)
    print(f"[OK] {out}  ->  {url}")

# Versión SVG simple del principal
import qrcode.image.svg
factory = qrcode.image.svg.SvgImage
qr = qrcode.QRCode(version=None, error_correction=ERROR_CORRECT_H, box_size=10, border=2)
qr.add_data(URLS["curso-principal"])
qr.make(fit=True)
img_svg = qr.make_image(image_factory=factory)
img_svg.save(f"{OUT_DIR}/qr-curso-principal.svg")
print(f"[OK] {OUT_DIR}/qr-curso-principal.svg")

print("\nQRs generados en:", OUT_DIR)
