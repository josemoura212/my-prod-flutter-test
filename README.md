# Teste para vaga dev. Freelancer Flutter - MyProd

Entrega do teste dev MyProd.

## Instruções de instalação

1. instalar o [fvm](https://fvm.app/docs/getting_started/installation/) usando o codigo `dart pub global activate fvm`
2. rode o comando `fvm install 3.7.0` para instalar a versão do flutter compativel com o dart 2.19
3. dentro do diretorio do projeto rode `fvm use 3.7.0`
4. crie uma pasta chamado **./vscode** nele crie um arquivo **settings.json**
5. cole dentro de **settings**

```
{
  "dart.flutterSdkPath": ".fvm/flutter_sdk",
  // Remove .fvm files from search
  "search.exclude": {
    "**/.fvm": true
  },
  // Remove from file watching
  "files.watcherExclude": {
    "**/.fvm": true
  }
}
```

6. use `dart --version` para verificar a verção instalada

## obs

Se rodar a verção web, link dynamico esta funcionando basta colocar o nomde de qualquer usuario do github que ira puxar automaticamente
