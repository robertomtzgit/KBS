;; kb-main.clp - Archivo principal para cargar y ejecutar el sistema

;; Cargar archivos del sistema
(clear)
(load "kb-templates.clp")
(load "kb-facts.clp")
(load "kb-rules.clp")
(load "kb-run.clp")

;; Mensaje de bienvenida
(printout t crlf)
(printout t "==================================================" crlf)
(printout t "          SISTEMA RECOMENDADOR DE MERCADO         " crlf)
(printout t "          Sistemas Basados en el Conocimiento     " crlf)
(printout t "==================================================" crlf)
(printout t crlf)

;; Ejecutar el sistema
(reset)
(execute-all)
