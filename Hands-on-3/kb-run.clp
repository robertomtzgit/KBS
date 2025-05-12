;; kb-run.clp - Archivo para ejecutar y probar el sistema

;; Función para mostrar todos los hechos
(deffunction show-all-facts ()
   (printout t crlf)
   (printout t "==================================================" crlf)
   (printout t "             MOSTRANDO TODOS LOS HECHOS           " crlf)
   (printout t "==================================================" crlf)
   (facts)
   (printout t crlf))

;; Función para ejecutar el sistema y mostrar resultados
(deffunction run-system ()
   (printout t crlf)
   (printout t "==================================================" crlf)
   (printout t "          INICIANDO SISTEMA RECOMENDADOR          " crlf)
   (printout t "==================================================" crlf)
   (printout t "Ejecutando reglas..." crlf crlf)
   (run)
   (printout t crlf)
   (printout t "==================================================" crlf)
   (printout t "              EJECUCIÓN COMPLETADA                " crlf)
   (printout t "==================================================" crlf crlf))

;; Función para probar escenarios específicos
(deffunction test-scenarios ()
   (printout t crlf)
   (printout t "==================================================" crlf)
   (printout t "          PROBANDO ESCENARIOS ESPECÍFICOS         " crlf)
   (printout t "==================================================" crlf crlf)
   
   ;; Escenario 1: Cliente nuevo realiza compra
   (printout t "ESCENARIO 1: Cliente nuevo realiza compra" crlf)
   (printout t "-------------------------------------------------" crlf)
   (assert (customer (customer-id 104) (name "Laura") (address "Calle Nueva 123") (phone 3315678901)))
   (assert (order (order-number 302) (customer-id 104)))
   (assert (line-item (order-number 302) (customer-id 104) (part-number 1234) (quantity 3)))
   (run)
   (printout t crlf)
   
   ;; Escenario 2: Compra con tarjeta HSBC
   (printout t "ESCENARIO 2: Compra con tarjeta HSBC" crlf)
   (printout t "-------------------------------------------------" crlf)
   (assert (cliente (id 205) (nombre "Elena") (tipo "menudista")))
   (assert (tarjeta (banco "HSBC") (grupo "Visa") (exp-date "10/26") (cliente-id 205)))
   (assert (orden (cliente-id 205) (productos "USBMem") (metodo-pago "tarjeta") (total 500) (qty-total 2)))
   (run)
   (printout t crlf)
   
   ;; Escenario 3: Stock agotado
   (printout t "ESCENARIO 3: Stock agotado" crlf)
   (printout t "-------------------------------------------------" crlf)
   (assert (smartphone (marca "Motorola") (modelo "G60") (color "verde") (precio 7999.99) (stock 0)))
   (run)
   (printout t crlf)
   
   ;; Escenario 4: Compra mayor a $1000
   (printout t "ESCENARIO 4: Compra mayor a $1000" crlf)
   (printout t "-------------------------------------------------" crlf)
   (assert (cliente (id 206) (nombre "Roberto") (tipo "mayorista")))
   (assert (orden (cliente-id 206) (productos "Amplifier") (metodo-pago "efectivo") (total 1200) (qty-total 1)))
   (run)
   (printout t crlf)
   
   ;; Escenario 5: Cliente mayorista con vale
   (printout t "ESCENARIO 5: Cliente mayorista con vale" crlf)
   (printout t "-------------------------------------------------" crlf)
   (assert (cliente (id 207) (nombre "Patricia") (tipo "mayorista")))
   (assert (vale (cliente-id 207) (monto 300)))
   (assert (orden (cliente-id 207) (productos "Keyboard" "Mouse") (metodo-pago "efectivo") (total 800) (qty-total 2)))
   (run)
   (printout t crlf)
)

;; Ejecutar todo
(deffunction execute-all ()
   (reset)
   (show-all-facts)
   (run-system)
   (test-scenarios)
)
