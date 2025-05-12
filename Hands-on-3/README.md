# Hands-on 3 – Sistema Recomendador en CLIPS

Este proyecto corresponde al tercer Hands-on de la materia **Sistemas Basados en el Conocimiento** (SBK), y consiste en la implementación de un sistema experto tipo recomendador, utilizando el lenguaje **CLIPS**.

## 🧠 Descripción

El sistema simula un entorno de compras en un mercado donde, según las características de los productos, clientes y condiciones de compra, se disparan recomendaciones automáticas como descuentos, promociones, mensajes, vales, combos, alertas de stock y regalos VIP.

## 📁 Archivos

- `kb-main.clp` – Archivo principal que coordina la ejecución del sistema.
- `kb-templates.clp` – Define los templates (estructuras) de los hechos.
- `kb-facts.clp` – Contiene los hechos iniciales: productos, clientes, compras, etc.
- `kb-rules.clp` – Define las **20 reglas del sistema experto**.
- `kb-run.clp` – Escenarios de prueba automatizados que disparan las reglas.

## ✅ Requisitos cumplidos

- [x] Implementación de 20 reglas significativas.
- [x] Uso de templates y hechos correctamente estructurados.
- [x] Reglas cubren aspectos como promociones, stock, bancos, lealtad, etc.
- [x] Salidas detalladas: vales, alertas, combos, descuentos, actualizaciones de stock, etc.
- [x] Escenarios de prueba ejecutables desde `kb-run.clp`.
- [x] Código modular, comentado y organizado.

## ▶️ Ejecución

Puedes ejecutar el sistema desde CLIPS con el siguiente comando:

```clips
(batch "kb-main.clp")
