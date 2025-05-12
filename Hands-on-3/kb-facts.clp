;; kb-facts.clp - Hechos iniciales del sistema recomendador

(deffacts initial-facts
  ;; Productos
  (product (name "USBMem") (category "storage") (part-number 1234) (price 199.99) (stock 15))
  (product (name "Amplifier") (category "electronics") (part-number 2341) (price 399.99) (stock 8))
  (product (name "Rubber duck") (category "mechanics") (part-number 3412) (price 99.99) (stock 20))
  (product (name "Keyboard") (category "electronics") (part-number 4123) (price 299.99) (stock 12))
  (product (name "Mouse") (category "electronics") (part-number 5123) (price 149.99) (stock 18))

  ;; Clientes
  (customer (customer-id 101) (name "Joe") (address "Calle Principal 123") (phone 3313073905) (type "regular"))
  (customer (customer-id 102) (name "Mary") (address "Avenida Central 456") (phone 333222345) (type "premium"))
  (customer (customer-id 103) (name "Bob") (address "Boulevard Norte 789") (phone 331567890) (type "regular"))

  ;; Órdenes
  (order (order-number 300) (customer-id 102) (date "05/10/2023") (status "completed"))
  (order (order-number 301) (customer-id 103) (date "05/11/2023") (status "processing"))

  ;; Artículos comprados
  (line-item (order-number 300) (customer-id 102) (part-number 1234) (quantity 1))
  (line-item (order-number 301) (customer-id 103) (part-number 2341) (quantity 10))
  (line-item (order-number 300) (customer-id 102) (part-number 3412) (quantity 2))
)

(deffacts additional-facts
  ;; Smartphones
  (smartphone (marca "Apple") (modelo "iPhone 13") (color "rojo") (precio 15999.99) (stock 2))
  (smartphone (marca "Samsung") (modelo "Galaxy S22") (color "azul") (precio 13999.99) (stock 5))
  (smartphone (marca "Xiaomi") (modelo "Redmi Note 11") (color "negro") (precio 5999.99) (stock 0))
  
  ;; Computadoras
  (compu (marca "Dell") (modelo "XPS 13") (color "plateado") (precio 25999.99) (stock 3))
  (compu (marca "HP") (modelo "Pavilion") (color "negro") (precio 18999.99) (stock 7))
  
  ;; Accesorios
  (accesorio (tipo "Funda") (nombre "Funda iPhone 13") (precio 499.99) (stock 10))
  (accesorio (tipo "Cargador") (nombre "Cargador rápido USB-C") (precio 399.99) (stock 15))
  (accesorio (tipo "Auriculares") (nombre "AirPods Pro") (precio 4999.99) (stock 4))
  
  ;; Clientes
  (cliente (id 201) (nombre "Carlos") (tipo "mayorista"))
  (cliente (id 202) (nombre "Ana") (tipo "menudista"))
  (cliente (id 203) (nombre "Luis") (tipo "mayorista"))
  
  ;; Tarjetas
  (tarjeta (banco "Bancomer") (grupo "Visa") (exp-date "12/25") (cliente-id 201))
  (tarjeta (banco "HSBC") (grupo "Mastercard") (exp-date "08/24") (cliente-id 202))
  (tarjeta (banco "Santander") (grupo "Visa") (exp-date "03/26") (cliente-id 203))
  
  ;; Vales
  (vale (cliente-id 201) (monto 500))
  (vale (cliente-id 202) (monto 0))
  (vale (cliente-id 203) (monto 250))
  
  ;; Órdenes
  (orden (cliente-id 201) (productos "USBMem" "Amplifier") (metodo-pago "tarjeta") (total 1500) (qty-total 6))
  (orden (cliente-id 202) (productos "USBMem") (metodo-pago "efectivo") (total 800) (qty-total 3))
  (orden (cliente-id 203) (productos "Rubber duck" "Amplifier") (metodo-pago "tarjeta") (total 2000) (qty-total 8))
)
