<h1 align="center">
  <strong>Project News Events</strong>
</h1>

<p align="center">
 <a href="#about">Sobre</a> |
 <a href="#features">Features</a> | 
 <a href="#requirements">Requisitos</a> | 
 <a href="#executable">Execução</a>
</p>

<h2 id="about">Sobre</h2>
Project News Events é um projeto para praticar a integração do Flutter com  o Node.js  

<h2 id="features">Features</h2>

1. ☑ Listar Notícias
1. ☑ Listar Eventos (com Autenticação)
1. ☑ Login
1. ☑ Logout
1. ☑ Dados mockados e fictícios

<h2 id="requirements">Requisitos</h2>

  * 📘 Flutter 🏷 2.0.6

 
  * 📗 Nodejs 🏷 12.16.1


<h2 id="executable">Execução</h2>

* Backend
  ```
  $ cd ./backend
  ```

  * 🔽 Instalar as dependências

    ```
    $ npm install
    ```
  * ▶ Executar o Backend

    ```
    $ npm start
    ```

* Mobile
  ```
  $ cd ./mobile
  ```
  * 🔽 Instalar as dependências

    ```
    $ flutter pub get
    ```
  * Alterar o IP do arquivo "lib/config/api.dart" na variável API_URL.

    ```
    Example: static const API_URL = 'http://192.168.0.10:3333';
    ```
  * ▶ Executar o mobile

    ```
    $ flutter run
    ```
<h2 id="test">Teste</h2>

* Crendeciais do usuário cadastrado para testes

  ```
  user: userTeste
  password: 123456
  ```
