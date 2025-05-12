;; kb-rules.clp - Reglas del sistema recomendador (exactamente 20 reglas)

;; -------- REGLAS DE ANÁLISIS DE COMPRAS --------

;; Regla 1: Detecta clientes que no han comprado nada
(defrule cust-not-buying
   (customer (customer-id ?id) (name ?name))
   (not (order (customer-id ?id)))
   =>
   (printout t "ALERTA: " ?name " no ha realizado ninguna compra todavía." crlf))

;; Regla 2: Muestra productos que han sido comprados
(defrule prods-bought
   (order (order-number ?order))
   (line-item (order-number ?order) (part-number ?part))
   (product (part-number ?part) (name ?pn))
   =>
   (printout t "REGISTRO: El producto " ?pn " fue comprado." crlf))

;; Regla 3: Muestra cantidad de productos comprados
(defrule prods-qty-bgt
   (order (order-number ?order))
   (line-item (order-number ?order) (part-number ?part) (quantity ?q))
   (product (part-number ?part) (name ?p))
   =>
   (printout t "CANTIDAD: Se compraron " ?q " unidades de " ?p "." crlf))

;; Regla 4: Muestra qué cliente compró qué producto
(defrule customer-shopping
   (customer (customer-id ?id) (name ?cn))
   (order (order-number ?order) (customer-id ?id))
   (line-item (order-number ?order) (part-number ?part))
   (product (part-number ?part) (name ?pn))
   =>
   (printout t "COMPRA: El cliente " ?cn " compró " ?pn "." crlf))

;; Regla 5: Identifica clientes que compraron más de 5 productos
(defrule cust-5-prods
   (customer (customer-id ?id) (name ?cn))
   (order (order-number ?order) (customer-id ?id))
   (line-item (order-number ?order) (part-number ?part) (quantity ?q&:(> ?q 5)))
   (product (part-number ?part) (name ?pn))
   =>
   (printout t "COMPRA MAYOR: " ?cn " compró más de 5 unidades de " ?pn "." crlf))

;; -------- REGLAS DE MARKETING --------

;; Regla 6: Envía mensaje de texto a clientes sin compras
(defrule text-cust
   (customer (customer-id ?cid) (name ?name) (phone ?phone))
   (not (order (customer-id ?cid)))
   =>
   (assert (text-customer (name ?name) (phone ?phone) (message "Tienes 25% desc. en tu próxima compra")))
   (printout t "SMS ENVIADO: A " ?name " (" ?phone ") - Mensaje: Tienes 25% desc. en tu próxima compra" crlf))

;; Regla 7: Programa llamada a clientes sin compras
(defrule call-cust
   (customer (customer-id ?cid) (name ?name) (phone ?phone))
   (not (order (customer-id ?cid)))
   =>
   (assert (call-customer (name ?name) (phone ?phone) (message "Tienes 25% desc. en tu próxima compra")))
   (printout t "LLAMADA PROGRAMADA: A " ?name " (" ?phone ") - Mensaje: Tienes 25% desc. en tu próxima compra" crlf))

;; -------- REGLAS DE PROMOCIONES --------

;; Regla 8: Aplica descuento a clientes mayoristas
(defrule promo-mayorista
   (cliente (id ?id) (nombre ?n) (tipo "mayorista"))
   =>
   (assert (promocion (tipo "mayorista") (descuento 15) (producto "todos") 
                     (mensaje (str-cat "Cliente mayorista " ?n " recibe descuento del 15%"))))
   (printout t "PROMOCIÓN: Cliente mayorista " ?n " recibe descuento del 15% en toda la tienda." crlf))

;; Regla 9: Programa de puntos para clientes menudistas
(defrule promo-menudista
   (cliente (id ?id) (nombre ?n) (tipo "menudista"))
   =>
   (printout t "PUNTOS: Cliente menudista " ?n " acumula puntos por su compra actual." crlf))

;; Regla 10: Descuento especial para tarjetas Bancomer
(defrule tarjeta-bancomer
   (orden (cliente-id ?id) (metodo-pago "tarjeta"))
   (tarjeta (banco "Bancomer") (grupo "Visa") (cliente-id ?id))
   (cliente (id ?id) (nombre ?n))
   =>
   (printout t "DESCUENTO BANCARIO: " ?n " pagó con tarjeta Bancomer Visa: aplica 10% descuento adicional." crlf))

;; Regla 11: Aplica vale de descuento a la compra
(defrule promo-vale
   (orden (cliente-id ?cid) (total ?t))
   (vale (cliente-id ?cid) (monto ?m&:(> ?m 0)))
   (cliente (id ?cid) (nombre ?n))
   =>
   (bind ?nuevo-total (- ?t ?m))
   (printout t "VALE APLICADO: Para " ?n " - Vale por $" ?m ". Nuevo total: $" ?nuevo-total crlf))

;; Regla 12: Promoción especial para productos de color rojo
(defrule compra-multicolor
   (smartphone (marca ?marca) (modelo ?modelo) (color "rojo") (precio ?p))
   =>
   (assert (promocion (tipo "color") (descuento 8) (producto ?modelo) 
                     (mensaje (str-cat "¡" ?modelo " en rojo! Aplica 8% de descuento."))))
   (printout t "PROMO COLOR: ¡" ?marca " " ?modelo " en rojo! Aplica promoción especial del 8%." crlf))

;; Regla 13: Descuento por cantidad de artículos
(defrule descuento-por-cantidad
   (orden (cliente-id ?id) (qty-total ?qty&:(>= ?qty 5)))
   (cliente (id ?id) (nombre ?n))
   =>
   (printout t "DESCUENTO CANTIDAD: " ?n " compró " ?qty " artículos. Aplica descuento del 5%." crlf))

;; -------- REGLAS DE INVENTARIO --------

;; Regla 14: Alerta de stock bajo para smartphones
(defrule advertencia-stock-bajo
   (smartphone (marca ?marca) (modelo ?m) (stock ?s&:(< ?s 3)&:(> ?s 0)))
   =>
   (printout t "STOCK BAJO: Quedan solo " ?s " unidades del modelo " ?marca " " ?m ". Programar reabastecimiento." crlf))

;; Regla 15: Alerta de producto agotado
(defrule agotado
   (smartphone (marca ?marca) (modelo ?m) (stock 0))
   =>
   (printout t "AGOTADO: El modelo " ?marca " " ?m " está agotado. Prioridad alta de reabastecimiento." crlf))

;; -------- REGLAS DE PAGOS Y FINANCIAMIENTO --------

;; Regla 16: Descuento especial para banco HSBC
(defrule descuento-por-banco
   (orden (cliente-id ?id) (metodo-pago "tarjeta"))
   (tarjeta (banco "HSBC") (cliente-id ?id))
   (cliente (id ?id) (nombre ?n))
   =>
   (printout t "PROMO BANCARIA: " ?n " recibe 5% de descuento por pagar con HSBC." crlf))

;; Regla 17: Programa de lealtad para clientes frecuentes
(defrule cliente-fiel
   (customer (customer-id ?id) (name ?name) (type "premium"))
   (order (customer-id ?id))
   =>
   (printout t "CLIENTE PREMIUM: " ?name " es cliente premium. Aplicar promoción de lealtad y envío gratuito." crlf))

;; Regla 18: Validación y actualización de stock
(defrule validacion-stock
   (line-item (part-number ?part) (quantity ?q))
   (product (part-number ?part) (name ?pname) (stock ?s&:(>= ?s ?q)))
   =>
   (bind ?newstock (- ?s ?q))
   (printout t "ACTUALIZACIÓN STOCK: Se descontaron " ?q " unidades de " ?pname ". Stock restante: " ?newstock crlf))

;; -------- REGLAS DE RECOMENDACIÓN --------

;; Regla 19: Oferta especial para compras de productos complementarios
(defrule oferta-combo
   (orden (cliente-id ?id) (productos $?p1&:(member$ "USBMem" ?p1)))
   (orden (cliente-id ?id) (productos $?p2&:(member$ "Amplifier" ?p2)))
   (cliente (id ?id) (nombre ?n))
   =>
   (printout t "COMBO ESPECIAL: " ?n " compró USBMem + Amplifier. Aplica precio especial y 12% de descuento." crlf))

;; Regla 20: Regalo sorpresa para compras grandes
(defrule regalo-sorpresa
   (orden (cliente-id ?id) (total ?t&:(> ?t 1000)))
   (cliente (id ?id) (nombre ?n))
   =>
   (assert (recomendacion (cliente-id ?id) (producto "Auriculares inalámbricos") 
                         (razon "Compra mayor a $1000")))
   (printout t "REGALO VIP: " ?n " realizó compra mayor a $1000. Incluye regalo sorpresa y envío prioritario." crlf))
   