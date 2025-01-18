# ifood

Projeto de ifood layout com flutter e firebird

## Firebird download

```bash
flutter pub add fbdb
```

## Iniciar projeto

Para inicar o projeto precisa antes inciar o database e verificar as conexões.

- Criando e iniciando database
    - Em um terminal:
    ```bash
    isql -u 'SYSDBA' -p 'masterkey'
    ```
    >>> Se a senha não for 'masterkey', altere para a senha correta
    - Em outro terminal:
    ```bash
    node ./scripts/createDb.js
    node ./scripts/insertRestauratns.js
    ```
    - Iniciando servidor do database:
    ```bash
    node ./db/server.js
    ```

- Iniciando flutter
```bash
    flutter pub get
    flutter run
```