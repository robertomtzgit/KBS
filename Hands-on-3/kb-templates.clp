;; kb-templates.clp - Plantillas del sistema recomendador

;; Plantillas de productos
(deftemplate product
  (slot name)
  (slot category)
  (slot part-number)
  (slot price)
  (slot stock (default 10)))

(deftemplate smartphone
  (slot marca)
  (slot modelo)
  (slot color)
  (slot precio)
  (slot stock))

(deftemplate compu
  (slot marca)
  (slot modelo)
  (slot color)
  (slot precio)
  (slot stock))

(deftemplate accesorio
  (slot tipo)
  (slot nombre)
  (slot precio)
  (slot stock (default 5)))

;; Plantillas de clientes y órdenes
(deftemplate customer
  (slot customer-id)
  (slot name)
  (slot address)
  (slot phone)
  (slot type (default "regular")))

(deftemplate order
  (slot order-number)
  (slot customer-id)
  (slot date (default "01/01/2023"))
  (slot status (default "pending")))

(deftemplate line-item
  (slot order-number)
  (slot customer-id)
  (slot part-number)
  (slot quantity))

(deftemplate cliente
  (slot id)
  (slot nombre)
  (slot tipo)) ;; mayorista o menudista

(deftemplate tarjeta
  (slot banco)
  (slot grupo)
  (slot exp-date)
  (slot cliente-id))

(deftemplate vale
  (slot cliente-id)
  (slot monto))

(deftemplate orden
  (slot cliente-id)
  (multislot productos)
  (slot metodo-pago)
  (slot total)
  (slot qty-total))

;; Plantillas para marketing
(deftemplate text-customer
  (slot name)
  (slot phone)
  (slot message))

(deftemplate call-customer
  (slot name)
  (slot phone)
  (slot message))

(deftemplate recomendacion
  (slot cliente-id)
  (slot producto)
  (slot razon))

(deftemplate promocion
  (slot tipo)
  (slot descuento)
  (slot producto)
  (slot mensaje))
  