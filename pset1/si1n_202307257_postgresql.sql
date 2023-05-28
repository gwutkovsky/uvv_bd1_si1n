--Comando para excluir  o banco de dados--
DROP DATABASE IF EXISTS uvv;

--comando para excluir apagar o usuário "guilherme" caso ele exista--
DROP USER IF EXISTS guilherme;

--Comando para excluir o esquema "lojas" caso ja exista--
DROP SCHEMA IF EXISTS lojas CASCADE;

--Comando para criar o usuário "guilherme" e a senha "comoutacao@raiz"--
CREATE USER guilherme WITH PASSWORD 'computacao@raiz' CREATEDB;

--Comando para criar o banco de dados.--
CREATE DATABASE       uvv

owner                 guilherme
template              template0
encoding              'UTF8'
lc_collate            'pt_BR.UTF-8'
lc_ctype              'pt_BR.UTF-8'

allow_connections     TRUE;

--Comando para trocar o usuário para guilherme e não pedir a senha.--
\c 'dbname=uvv user=guilherme password=computacao@raiz'

--Comando para gerar o esquema--
CREATE SCHEMA lojas AUTHORIZATION guilherme;

--Comando para alterar o caminho de pesquisa (search path) do usuário "guilherme" para o esquema (schema) "lojas".--
ALTER USER guilherme SET SEARCH_PATH TO lojas;

--para comando para definir o caminho de pesquisa (search path) do usuário.--
SET SEARCH_PATH TO lojas,"$user", public;

CREATE TABLE produtos (

                produto_id                      NUMERIC(38)                     NOT NULL,
                nome                            VARCHAR(255)                    NOT NULL,
                preco_unitario                  NUMERIC(10,2),
                detalhes                        BYTEA,
                imagem                          BYTEA,
                imagem_mime_type                VARCHAR(512),
                imagem_arquivo                  VARCHAR(512),
                imagem_chatset                  VARCHAR(512),
                imagem_ultima_atualizacao       DATE,

                CONSTRAINT produtos_pk           PRIMARY KEY (produto_id)
);

COMMENT ON TABLE  produtos                             IS 'Tabela para inserir as caracteriscas dos produtos da loja';

COMMENT ON COLUMN produtos.produto_id                  IS 'Coluna para inserir o codigo de identificacao dos produtos';

COMMENT ON COLUMN produtos.nome                        IS 'Coluna para inserir os nomes de cada produto';

COMMENT ON COLUMN produtos.preco_unitario               IS 'Coluna para inserir o preco unitario de cada produto';

COMMENT ON COLUMN produtos.detalhes                     IS 'Coluna para inserir os detalhes do produto';

COMMENT ON COLUMN produtos.imagem                       IS 'Coluna para inserir a imagem do produto';

COMMENT ON COLUMN produtos.imagem_mime_type             IS 'Coluna para inserir as dimensoes das imagens dos produtos';

COMMENT ON COLUMN produtos.imagem_arquivo               IS 'Coluna para inserir o arquivo das imagens dos produtos';

COMMENT ON COLUMN produtos.imagem_chatset               IS 'Coluna para inserir a imagem codificada em formato de caracteres';

COMMENT ON COLUMN produtos.imagem_ultima_atualizacao    IS 'Coluna para inserir a data da ultima atualizacao da imagem dos produtos';


CREATE TABLE lojas (

                loja_id                           NUMERIC(38)                   NOT NULL,
                nome                              VARCHAR(255)                  NOT NULL,
                endereco_web                      VARCHAR(100),
                endereco_fisico                   VARCHAR(512),
                latitude                          NUMERIC,
                longitude                         NUMERIC,
                logo                              BYTEA,
                logo_mime_type                    VARCHAR(512),
                logo_arquivo                      VARCHAR(512),
                logo_charset                      VARCHAR(512),
                logo_ultima_atualizacao           DATE,
                
                CONSTRAINT lojas_pk                PRIMARY KEY (loja_id)
);

COMMENT ON COLUMN lojas.loja_id                 IS 'Coluna para inserir o codigo de identificacao da loja';

COMMENT ON COLUMN lojas.nome                    IS 'Coluna para inserir o nome da loja';

COMMENT ON COLUMN lojas.endereco_web            IS 'Coluna para inserir o endereco web da loja';

COMMENT ON COLUMN lojas.endereco_fisico         IS 'Coluna para inserir o endereco fisico da loja';

COMMENT ON COLUMN lojas.latitude                IS 'Coluna para inserir a latitudo em que a loja está localizada';

COMMENT ON COLUMN lojas.longitude               IS 'Coluna para inserir a longitude em que a loja esta localizada';

COMMENT ON COLUMN lojas.logo                    IS 'Coluna para inserir a logo da loja';

COMMENT ON COLUMN lojas.logo_mime_type          IS 'Coluna para inserir as dimencoes da logo da loja';

COMMENT ON COLUMN lojas.logo_arquivo            IS 'Coluna para inserir o arquivo da logo da loja';

COMMENT ON COLUMN lojas.logo_charset            IS 'Coluna para inserir a logo codificada em formato de caracteres';

COMMENT ON COLUMN lojas.logo_ultima_atualizacao IS 'Coluna pra inserir a data da ultima atualizacao da logo da loja';


CREATE TABLE estoques (

                estoque_id                         NUMERIC(38)                     NOT NULL,
                loja_id                            NUMERIC(38)                     NOT NULL,
                produto_id                         NUMERIC(38)                     NOT NULL,
                quantidade                         NUMERIC(38)                     NOT NULL,
                
                CONSTRAINT estoques_pk              PRIMARY KEY (estoque_id)
);

COMMENT ON TABLE estoques                       IS 'Tabela para inserir as informacoes de estoque dos produtos';

COMMENT ON COLUMN estoques.estoque_id           IS 'Coluna para inserir o codigo de identificacao do estoque da loja';

COMMENT ON COLUMN estoques.loja_id              IS 'Coluna para inserir o codigo de identificacao da loja';

COMMENT ON COLUMN estoques.produto_id           IS 'Coluna pra inserir o codigo de identificacao de cada produdo';

COMMENT ON COLUMN estoques.quantidade           IS 'Coluna para inserir a quantidade de cada produto no estoque da loja';


CREATE TABLE clientes (

                cliente_id                         NUMERIC(38)                    NOT NULL,
                email                              VARCHAR(255)                   NOT NULL,
                nome                               VARCHAR(255)                   NOT NULL,
                telefone1                          VARCHAR(20),
                telefone2                          VARCHAR(20),
                telefone3                          VARCHAR(20),
                
                CONSTRAINT clientes_pk           PRIMARY KEY (cliente_id)
);

COMMENT ON TABLE clientes                      IS 'Tabela para realizar cadastro de clientes';

COMMENT ON COLUMN clientes.cliente_id          IS 'Codigo de identificacao do cliente';

COMMENT ON COLUMN clientes.email               IS 'Coluna para inserir o email do cliente';
   
COMMENT ON COLUMN clientes.nome                IS 'Coluna para inserir o nome do cliente';

COMMENT ON COLUMN clientes.telefone1           IS 'Coluna para inserir o telefone do cliente';

COMMENT ON COLUMN clientes.telefone2           IS 'Coluna para inserir o telefone do cliente';

COMMENT ON COLUMN clientes.telefone3           IS 'Coluna para inserir o telefone do cliente';


CREATE TABLE envios (

                envio_id                           NUMERIC(38)                  NOT NULL,
                loja_id                            NUMERIC(38)                  NOT NULL,
                cliente_id                         NUMERIC(38)                  NOT NULL,
                endereco_entrega                   VARCHAR(512)                 NOT NULL,
                status                             VARCHAR(15)                  NOT NULL,
                
                CONSTRAINT envios_pk                PRIMARY KEY (envio_id)
);

COMMENT ON TABLE envios                            IS 'Tabela para inserir as informacoes de envio do produto';

COMMENT ON COLUMN envios.envio_id                  IS 'Coluna para inserir o codigo identificacao de envio do produto';

COMMENT ON COLUMN envios.loja_id                   IS 'Coluna para inserir o código de identificacao da loja';

COMMENT ON COLUMN envios.cliente_id                IS 'Coluna para inserir o codigo de identificacao do cliente';

COMMENT ON COLUMN envios.endereco_entrega          IS 'Coluna para inserir o endereco de entrega do produto';

COMMENT ON COLUMN envios.status                    IS 'Coluna para inserir o status do envio do produto';


CREATE TABLE pedidos (

                pedido_id                          NUMERIC(38)                 NOT NULL,
                data_hora                          TIMESTAMP                   NOT NULL,
                cliente_id                         NUMERIC(38)                 NOT NULL,
                status                             VARCHAR(15)                 NOT NULL,
                loja_id                            NUMERIC(38)                 NOT NULL,
                
                CONSTRAINT pedidos_pk               PRIMARY KEY (pedido_id)
);

COMMENT ON TABLE pedidos                        IS 'Tabela para inserir informacoes dos pedidos';

COMMENT ON COLUMN pedidos.pedido_id             IS 'Coluna para inserir o codigo didentificacao do pedido';

COMMENT ON COLUMN pedidos.data_hora             IS 'Coluna para inserir a data e hora do pedido';

COMMENT ON COLUMN pedidos.cliente_id            IS 'Coluna para inserir o codigo de identficacao do cliente';

COMMENT ON COLUMN pedidos.status                IS 'Coluna para inserir o status do pedido';

COMMENT ON COLUMN pedidos.loja_id               IS 'Coluna para inserir o codigo de identificacao da loja';



CREATE TABLE pedidos_itens (

                pedido_id                      NUMERIC(38)                   NOT NULL,
                produto_id                     NUMERIC(38)                   NOT NULL,
                numero_da_linha                NUMERIC(38)                   NOT NULL,
                preco_unitario                 NUMERIC(10,2)                 NOT NULL,
                quantidade                     NUMERIC(38)                   NOT NULL,
                envio_id                       NUMERIC(38),
                
                CONSTRAINT pedidos_itens_pk           PRIMARY KEY (pedido_id, produto_id)
);

COMMENT ON TABLE pedidos_itens                          IS 'Tabela para inserir as informacoes dos pedidos';

COMMENT ON COLUMN pedidos_itens.pedido_id               IS 'Coluna para inserir o codido de identificacao de cada pedido';

COMMENT ON COLUMN pedidos_itens.produto_id              IS 'Coluna pra inserir o codigo de identificacao de cada produto da loja';

COMMENT ON COLUMN pedidos_itens.numero_da_linha         IS 'Coluna pra inserir o numero da linha do pedido';

COMMENT ON COLUMN pedidos_itens.preco_unitario          IS 'Coluna para inserir o preco unitario de cada produto da loja';

COMMENT ON COLUMN pedidos_itens.quantidade              IS 'Coluna para inserir a quantidade de cada produto em cada pedido realizado';

COMMENT ON COLUMN pedidos_itens.envio_id                IS 'Coluna para inserir o codigo de identificacao do envio do produto';


ALTER TABLE       pedidos_itens                         ADD CONSTRAINT  produtos_pedidos_itens_fk

FOREIGN KEY       (produto_id)
REFERENCES        produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE       estoques                              ADD CONSTRAINT produtos_estoques_fk

FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE       estoques                              ADD CONSTRAINT lojas_estoques_fk

FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE       pedidos                              ADD CONSTRAINT lojas_pedidos_fk

FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE       envios                               ADD CONSTRAINT lojas_envios_fk

FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE      pedidos                              ADD CONSTRAINT clientes_pedidos_fk

FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE      envios                               ADD CONSTRAINT clientes__envios__fk

FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE      pedidos_itens                        ADD CONSTRAINT envios_pedidos_itens_fk

FOREIGN KEY (envio_id)
REFERENCES envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE     pedidos_itens                         ADD CONSTRAINT pedidos_pedidos_itens_fk

FOREIGN KEY (pedido_id)
REFERENCES pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos
ADD CONSTRAINT check_status
CHECK (status IN ('CANCELADO', 'COMPLETO', 'ABERTO', 'PAGO', 'REEMBOLSADO', 'ENVIADO'));

ALTER TABLE     envios                                ADD CONSTRAINT check_status
CHECK (status IN ('CRIADO', 'ENVIADO', 'TRANSITO', 'ENTREGUE'));

ALTER TABLE     produtos                              ADD CONSTRAINT check_preco_unitario
CHECK (preco_unitario >=0);

ALTER TABLE     pedidos_itens                         ADD CONSTRAINT check_quantidade
CHECK (quantidade >=0);

ALTER TABLE     estoques                              ADD CONSTRAINT check_quatidade
CHECK (quantidade >=0);

ALTER TABLE     lojas                                     ADD CONSTRAINT endereco_preenchido
CHECK (endereco_web IS NOT NULL OR endereco_fisico IS NOT NULL);
