CREATE TABLE Pessoa (
  id_pessoa INTEGER   NOT NULL ,
  nome VARCHAR(255)    ,
  endereco VARCHAR(255)    ,
  telefone VARCHAR(11)    ,
  email VARCHAR(255)      ,
PRIMARY KEY(id_pessoa));




CREATE TABLE Produto (
  id_produto INTEGER   NOT NULL ,
  nome VARCHAR(255)    ,
  quantidade INTEGER    ,
  precoVenda NUMERIC      ,
PRIMARY KEY(id_produto));




CREATE TABLE Usuário (
  id_usuario INTEGER   NOT NULL ,
  nome VARCHAR    ,
  login VARCHAR    ,
  senha VARCHAR      ,
PRIMARY KEY(id_usuario));




CREATE TABLE pessoa_juridica (
  idpessoa_juridica INTEGER   NOT NULL ,
  Pessoa_id_pessoa INTEGER   NOT NULL ,
  cnpj VARCHAR(14)   NOT NULL ,
  razao_social VARCHAR(155)   NOT NULL ,
  nome_fantasia VARCHAR(160)      ,
PRIMARY KEY(idpessoa_juridica)  ,
  FOREIGN KEY(Pessoa_id_pessoa)
    REFERENCES Pessoa(id_pessoa));


CREATE INDEX pessoa_juridica_FKIndex1 ON pessoa_juridica (Pessoa_id_pessoa);


CREATE INDEX IFK_Rel_11 ON pessoa_juridica (Pessoa_id_pessoa);


CREATE TABLE pessoa_fisica (
  idpessoa_fisica INTEGER   NOT NULL ,
  Pessoa_id_pessoa INTEGER   NOT NULL ,
  cpf VARCHAR(11)   NOT NULL ,
  nome VARCHAR(100)   NOT NULL ,
  data_nascimento DATE      ,
PRIMARY KEY(idpessoa_fisica)  ,
  FOREIGN KEY(Pessoa_id_pessoa)
    REFERENCES Pessoa(id_pessoa));


CREATE INDEX pessoa_fisica_FKIndex1 ON pessoa_fisica (Pessoa_id_pessoa);


CREATE INDEX IFK_Rel_10 ON pessoa_fisica (Pessoa_id_pessoa);


CREATE TABLE movimentos_venda (
  id_venda INTEGER   NOT NULL ,
  pessoa_fisica_idpessoa_fisica INTEGER   NOT NULL ,
  Produto_id_produto INTEGER   NOT NULL ,
  Usuário_id_usuario INTEGER   NOT NULL ,
  id_usuario INTEGER    ,
  id_produto INTEGER    ,
  id_cliente INTEGER    ,
  data_venda DATE    ,
  quantidade INTEGER    ,
  preco_venda DECIMAL      ,
PRIMARY KEY(id_venda)      ,
  FOREIGN KEY(Usuário_id_usuario)
    REFERENCES Usuário(id_usuario),
  FOREIGN KEY(Produto_id_produto)
    REFERENCES Produto(id_produto),
  FOREIGN KEY(pessoa_fisica_idpessoa_fisica)
    REFERENCES pessoa_fisica(idpessoa_fisica));


CREATE INDEX movimentos_venda_FKIndex1 ON movimentos_venda (Usuário_id_usuario);
CREATE INDEX movimentos_venda_FKIndex2 ON movimentos_venda (Produto_id_produto);
CREATE INDEX movimentos_venda_FKIndex3 ON movimentos_venda (pessoa_fisica_idpessoa_fisica);


CREATE INDEX IFK_Rel_09 ON movimentos_venda (Usuário_id_usuario);
CREATE INDEX IFK_Rel_13 ON movimentos_venda (Produto_id_produto);
CREATE INDEX IFK_Rel_15 ON movimentos_venda (pessoa_fisica_idpessoa_fisica);


CREATE TABLE movimento_compra (
  id_compra INTEGER   NOT NULL ,
  pessoa_juridica_idpessoa_juridica INTEGER   NOT NULL ,
  Produto_id_produto INTEGER   NOT NULL ,
  Usuário_id_usuario INTEGER   NOT NULL ,
  id_usuario INTEGER    ,
  id_produto INTEGER    ,
  id_fornecedor INTEGER    ,
  data_compra DATE    ,
  quanridade INTEGER    ,
  preco_unitario DECIMAL      ,
PRIMARY KEY(id_compra)      ,
  FOREIGN KEY(Usuário_id_usuario)
    REFERENCES Usuário(id_usuario),
  FOREIGN KEY(Produto_id_produto)
    REFERENCES Produto(id_produto),
  FOREIGN KEY(pessoa_juridica_idpessoa_juridica)
    REFERENCES pessoa_juridica(idpessoa_juridica));


CREATE INDEX movimento_compra_FKIndex1 ON movimento_compra (Usuário_id_usuario);
CREATE INDEX movimento_compra_FKIndex2 ON movimento_compra (Produto_id_produto);
CREATE INDEX movimento_compra_FKIndex3 ON movimento_compra (pessoa_juridica_idpessoa_juridica);


CREATE INDEX IFK_Rel_08 ON movimento_compra (Usuário_id_usuario);
CREATE INDEX IFK_Rel_12 ON movimento_compra (Produto_id_produto);
CREATE INDEX IFK_Rel_14 ON movimento_compra (pessoa_juridica_idpessoa_juridica);



