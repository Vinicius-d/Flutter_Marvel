# Marvel app Flutter

Este projeto tem como objetivo consumir a API da MARVEL disponibilizando os dados em telas por meio de um projeto Flutter.

## Sobre o projeto

A página inicial lista os personagens, com thumbnail, nome e uma breve descrição, é possível caminhar entre as paginações rolando para baixo onde a lista vai sendo incrementada de 20 em 20

Ao clicar no card de um personagem você será redirecionado para a página que detalha o respectivo personagem. Lá será possível visualizar mais informações, logo abaixo existe uma lista de quadrinhos, séries e hitórias, em que o personagem teve sua participação.

### Tecnologias utilizadas

- [Flutter](https://flutter.dev/)
- [Dart](hhttps://dart.dev/)

## Instalação do projeto

Após clonar o projeto do repositório Github, navegue até a raiz e execute os seguintes comandos no terminal:

```
flutter clean
```

logo após

```
flutter pub get
```

Esses comandos irão instalar todas as dependências necessárias do projeto.

## Buildar o projeto

Com o emulador rodando digite no terminal:

```
flutter run
```

## Estrutura de diretórios do projeto

### lib

Este diretório armazena todo o código desenvolvido ou seja, lógica da aplicação, componentes, páginas, rotas, serviços e etc.

### app

contém todo desenvolvimento que o usuario final irá visualizar

### screens

Onde contém as pastas das paginas do app, seus respecitovos models, adapters, services e controllers

### assets

contém as imagens do app
