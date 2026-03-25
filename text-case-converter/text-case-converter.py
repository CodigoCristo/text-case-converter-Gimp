#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Text Case Converter / Convertidor de Caso de Texto
# Plugin para GIMP 3.0
#
# Instalación / Installation:
#   Windows : %APPDATA%\GIMP\3.0\plug-ins\text-case-converter\text-case-converter.py
#   Linux   : ~/.config/GIMP/3.0/plug-ins/text-case-converter/text-case-converter.py
#   macOS   : ~/Library/Application Support/GIMP/3.0/plug-ins/text-case-converter/text-case-converter.py
#
# Requiere / Requires: GIMP 3.0.2 o superior / or higher

import gi
gi.require_version('Gimp', '3.0')
from gi.repository import Gimp, GLib
import sys
import locale

def es_espanol():
    lang = locale.getdefaultlocale()[0] or ""
    return lang.startswith("es")

ESPAÑOL = es_espanol()

def msg(es, en):
    return es if ESPAÑOL else en


def convertir_texto(image, drawables, modo):
    # Prioridad: drawables recibidos → selected → activa
    capas = list(drawables) if drawables else []

    if not capas:
        capas = list(image.get_selected_drawables() or [])

    if not capas:
        activa = image.get_active_drawable()
        if activa:
            capas = [activa]

    if not capas:
        Gimp.message(msg("No hay capas seleccionadas.", "No layers selected."))
        return

    capas_texto = [c for c in capas if c.is_text_layer()]

    if not capas_texto:
        Gimp.message(msg(
            "Selecciona una capa de texto primero.",
            "Please select a text layer first."
        ))
        return

    image.undo_group_start()
    try:
        for capa in capas_texto:
            texto = capa.get_text()
            if not texto:
                continue
            nuevo = {
                "upper":    texto.upper(),
                "lower":    texto.lower(),
                "title":    texto.title(),
                "swap":     texto.swapcase(),
                "sentence": texto.capitalize(),
            }.get(modo, texto)
            capa.set_text(nuevo)
    finally:
        image.undo_group_end()

    Gimp.displays_flush()


class TextCaseConverter(Gimp.PlugIn):

    def do_query_procedures(self):
        return [
            "text-case-uppercase",
            "text-case-lowercase",
            "text-case-titlecase",
            "text-case-swapcase",
            "text-case-sentence",
        ]

    def do_set_i18n(self, name):
        return False

    def do_create_procedure(self, name):
        info = {
            "text-case-uppercase": (msg("1. AA - MAYÚSCULAS", "1. AA - UPPERCASE"),  "upper"),
            "text-case-lowercase": (msg("2. aa - minúsculas",  "2. aa - lowercase"),  "lower"),
            "text-case-titlecase": (msg("3. Aa - Título",      "3. Aa - Title Case"), "title"),
            "text-case-swapcase":  (msg("4. aA - iNVERTIR",   "4. aA - sWAP cASE"),  "swap"),
            "text-case-sentence":  (msg("5. Aaa - Oración",   "5. Aaa - Sentence"),   "sentence"),
        }
        label, modo = info[name]

        procedure = Gimp.ImageProcedure.new(
            self, name,
            Gimp.PDBProcType.PLUGIN,
            self._run, modo
        )
        procedure.set_image_types("*")
        # ALWAYS — siempre activo sin importar qué capas estén seleccionadas
        procedure.set_sensitivity_mask(Gimp.ProcedureSensitivityMask.ALWAYS)
        procedure.set_menu_label(label)
        procedure.add_menu_path(msg(
            "<Image>/Texto/Convertir Caso",
            "<Image>/Text/Convert Case"
        ))
        procedure.set_documentation(label, label, name)
        procedure.set_attribution("Text Case Converter", "Text Case Converter", "2025")
        return procedure

    def _run(self, procedure, run_mode, image, drawables, config, modo):
        try:
            convertir_texto(image, drawables, modo)
        except Exception as e:
            Gimp.message(f"Error: {e}")
            return procedure.new_return_values(
                Gimp.PDBStatusType.EXECUTION_ERROR,
                GLib.Error(str(e))
            )
        return procedure.new_return_values(Gimp.PDBStatusType.SUCCESS, GLib.Error())


Gimp.main(TextCaseConverter.__gtype__, sys.argv)
