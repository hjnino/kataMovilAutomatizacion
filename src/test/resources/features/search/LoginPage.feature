@all
Feature: Autenticación de usuario

  Background:
    Given que "Usuario" abre la aplicación
    And el usuario deberia ver el titulo "Products"

  Scenario: Autenticación exitosa
    When el usuario ingresa con  el username "bod@example.com" y  password "10203040"
    Then el usuario deberia ver la opcion de "Log Out" en el menu

  Scenario: Usuario blqueado
    When el usuario ingresa con  el username "alice@example.com" y  password "10203040"
    Then el usuario  vera el mensaje "Sorry this user has been blocked"

  Scenario: Usuario tiene un producto en el carrito
    When el usuario autenticado con user "bod@example.com" y password "10203040" agrega un producto al carrito
    Then el usuario deberia ver el titulo "My Cart" y el nombre  "Sauce Labs Backpack" del producto en el carrito

    Scenario: Usuario completa la compra de producto
     When el usuario logeado con user "bod@example.com" y password "10203040" ingresa los datos de compra:
            | name        | address         | city   | country   | zip     | numbercard | expirationdate | code |
            | Juan Perez  | Calle Falsa 123 | Bogota | Colombia  | 111911  | 123456789   | 12/25          | 123  |
    Then el usuario compra el producto vera el mensaje "Checkout completed"