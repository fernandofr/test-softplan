## Sobre

Projeto desenvolvido para realizar downloads via http, com processamento multithread, destinado à avaliação de contratação. 

## Tecnologias Utilizadas
  
O projeto foi desenvolvido utilizando as seguintes tecnologias:
 - Delphi: Tokyo 10.3
 - Firedac
 - SQLite
 - Indy


## Como usar

 1. Clone o projeto utilizando o comando abaixo:

```sh
  $ git clone https://github.com/fernandofr/test-softplan.git
```
 
 2. Configurando a database.
   - Na pasta do projeto contem uma pasta chamada `Database` que possui uma base `SQLite` já     criada, que pode ser utilizada.
   - Caso deseje criar uma nova base a estrutura da tabela é a seguinte:
   ```
     CREATE TABLE LOGDOWNLOAD (
       ID    INTEGER       PRIMARY KEY AUTOINCREMENT NOT NULL,
       URL        VARCHAR (600) NOT NULL,
       START_DATE DATETIME      NOT NULL,
       END_DATE   DATETIME      NOT NULL
    );
   ```

 3. Executando a Aplicação:
    - Execute o .exe que esta pasta `Win32`, caso tenha o Delphi intalado também pode ser executado através dele.


 ## Aplicação Rodando

Na tela principal informe a `URL` para download e o diretório aonde deseja salvar o arquivo após término.

 - **Botão Iniciar Download**: Inicia o download do arquivo. Clicando no botão iniciar Download, será exibido o botão `Cancelar` e `Mostrar Informações`
 - **Botão Cancelar Download**: Cancela o download do arquivo.
 - **Botão Exibir informações**: Mostra a porcentagem já baixada do arquivo.
 - **Botão Histórico Download**: Abre uma nova tela listando todos downloads realizados.
 
