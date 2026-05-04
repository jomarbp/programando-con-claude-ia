#!/usr/bin/env python3
"""
Genera certificados HTML personalizados a partir de un CSV.
Uso: python scripts/generar-certificados.py participantes.csv

Formato del CSV:
  nombre,fecha,id
  Juan Perez,2026-05-15,CERT-0001
"""
import csv
import sys
import os
from pathlib import Path

if len(sys.argv) < 2:
    print("Uso: python scripts/generar-certificados.py participantes.csv")
    sys.exit(1)

csv_file = sys.argv[1]
plantilla_path = Path("recursos/certificado/plantilla-certificado.html")
out_dir = Path("recursos/certificado/generados")
out_dir.mkdir(exist_ok=True)

with open(plantilla_path, encoding="utf-8") as f:
    plantilla = f.read()

with open(csv_file, encoding="utf-8") as f:
    reader = csv.DictReader(f)
    contador = 0
    for fila in reader:
        nombre = fila["nombre"].strip()
        fecha = fila["fecha"].strip()
        cert_id = fila["id"].strip()

        # Reemplazos en el HTML
        cert = plantilla.replace("[NOMBRE DEL PARTICIPANTE]", nombre)
        # Formatear fecha en español
        from datetime import datetime
        try:
            fecha_obj = datetime.strptime(fecha, "%Y-%m-%d")
            meses = ["enero","febrero","marzo","abril","mayo","junio",
                     "julio","agosto","septiembre","octubre","noviembre","diciembre"]
            fecha_es = f"{fecha_obj.day} de {meses[fecha_obj.month-1]} de {fecha_obj.year}"
        except:
            fecha_es = fecha

        cert = cert.replace("[FECHA]", fecha_es)
        cert = cert.replace("CERT-XXXX", cert_id)

        # Nombre de archivo seguro
        safe_name = "".join(c if c.isalnum() or c in "-_" else "_" for c in nombre.lower().replace(" ", "-"))
        out_file = out_dir / f"{cert_id}-{safe_name}.html"

        with open(out_file, "w", encoding="utf-8") as f:
            f.write(cert)

        print(f"[OK] {out_file}")
        contador += 1

print(f"\n{contador} certificados generados en {out_dir}")
print("Para convertir a PDF: abre cada uno en Chrome y usa Ctrl+P -> Guardar como PDF")
