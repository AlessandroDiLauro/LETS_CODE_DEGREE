---criando as Tables

CREATE TABLE clientes (
  cpf numeric(11)  NOT NULL PRIMARY KEY,
  nome varchar(45) NOT NULL,
  tel_cliente numeric(12) NOT NULL,
  tel_cliente2 numeric(12),
  email_cliente varchar(45) NOT NULL,
  estado char(2) NOT NULL);

CREATE TABLE editoras (
  id_editora SERIAL PRIMARY KEY,
  nome varchar(65) NOT NULL,
  nome_contato varchar(45) NOT NULL,
  tel_contato numeric(12) NOT NULL,
  tel_contato2 numeric(12),
  email_editora varchar(45) NOT NULL,
  estado char(2) NOT NULL);

CREATE TABLE autores(
               id_autor SERIAL  NOT NULL PRIMARY KEY,
               nome varchar(45) NOT NULL,
               dt_nascimento date,
               dt_falecimento date);
			   
CREATE TABLE categorias(
                id_categoria int NOT NULL PRIMARY KEY,
                nome_cat varchar(30), 
                descricao_cat varchar(150));


CREATE TABLE livros(
               isbn char(13) NOT NULL PRIMARY KEY,
               unit_estoque int NOT NULL,
               titulo varchar NOT NULL,
               unit_valor decimal NOT NULL, 
               id_categoria int NOT NULL REFERENCES categorias(id_categoria),
               id_editora int NOT NULL REFERENCES editoras(id_editora));

CREATE TABLE partecipacao(
                id_part SERIAL NOT NULL PRIMARY KEY,
                isbn char(13)  REFERENCES livros(isbn),
                id_autor int NOT NULL REFERENCES autores(id_autor));
				
CREATE TABLE pedidos(
                id_pedido SERIAL NOT NULL PRIMARY KEY,
                cep numeric(8) NOT NULL,
                cpf numeric(11) NOT NULL REFERENCES clientes(cpf),
                dt_entega date NOT NULL);
				
CREATE TABLE item_pedidos(
                id_item SERIAL NOT NULL PRIMARY KEY,
                id_pedido int NOT NULL REFERENCES pedidos(id_pedido),
                isbn char(13) NOT NULL REFERENCES livros(isbn),
                unit_preco decimal(8,2),
                qtde_item int NOT NULL);
				
ALTER TABLE pedidos
ADD COLUMN dt_pedidos date NOT NULL;



---Insert into Tables

INSERT INTO autores(
	nome, dt_nascimento, dt_falecimento)
	VALUES ('Emanuele Severino', '1929/02/26', '2020/01/17');

INSERT INTO autores(
	nome, dt_nascimento, dt_falecimento)
	VALUES ('Roberto Calasso', '1941/05/30', '2021/07/28');

INSERT INTO autores(
	nome, dt_nascimento)
	VALUES ('Giorgio Agamben', '1942/04/22');
	
	
INSERT INTO autores(
	nome, dt_nascimento)
	VALUES ('Giuseppe Barzaghi', '1958/03/05');	
	
INSERT INTO autores(
	nome, dt_nascimento)
	VALUES ('Slavoj Žižek', '1949/03/21');	


SELECT * FROM autores;

INSERT INTO categorias(
	id_categoria, nome_cat, descricao_cat)
	VALUES ('10', 'Filosofia', 'Pensiero Occidentale');
	
INSERT INTO categorias(
	id_categoria, nome_cat, descricao_cat)
	VALUES ('20', 'Religione', 'Cristianesimo');	
	
INSERT INTO categorias(
	id_categoria, nome_cat, descricao_cat)
	VALUES ('30', 'Saggistica', 'Pensiero Occidentale');
	
	
INSERT INTO categorias(
	id_categoria, nome_cat, descricao_cat)
	VALUES ('40', 'Scienze Sociali', 'Pensiero Occidentale');
	
SELECT * FROM categorias;

INSERT INTO clientes(
	cpf, nome, tel_cliente, tel_cliente2, email_cliente, estado)
	VALUES (85200379504, 'Alessandro', 27992831073, 2731201165, 'alex@gmail', 'ES');
	
INSERT INTO clientes(
	cpf, nome, tel_cliente, email_cliente, estado)
	VALUES (85200379578, 'Teresa', 27992831122, 'teri@gmail', 'RJ');

INSERT INTO clientes(
	cpf, nome, tel_cliente, email_cliente, estado)
	VALUES (85200379678, 'Leonardo', 27992837823, 'leo@gmail', 'ES');
	
INSERT INTO clientes(
	cpf, nome, tel_cliente, email_cliente, estado)
	VALUES (85200312345, 'Luciana', 27999837823, 'luci@gmail', 'SP');	
	
INSERT INTO clientes(
	cpf, nome, tel_cliente,tel_cliente2, email_cliente, estado)
	VALUES (12300312345, 'Mario', 31999837823, 069304992, 'mario@gmail', 'MG');

SELECT * FROM clientes;

INSERT INTO editoras(
    nome, nome_contato, tel_contato, tel_contato2, email_editora, estado)
    VALUES ('Adelphi','Adriana', 3131201168, 3131201123, 'adelphi@gmail', 'RJ');
	
INSERT INTO editoras(
    nome, nome_contato, tel_contato, tel_contato2, email_editora, estado)
	VALUES ('Meltemi','Julien', 3123401168, 32731201123, 'meltemi@gmail', 'RJ');

	
INSERT INTO editoras(
    nome, nome_contato, tel_contato, email_editora, estado)
	VALUES ('Astrolabio','Alex', 6789401168, 'meltemi@gmail', 'ES');


SELECT * FROM livros	

INSERT INTO livros(
	isbn, unit_estoque, titulo, unit_valor, id_categoria, id_editora)
	VALUES (9788845911095, 10, 'Essenza del nichilismo', 399.35, 10, 1);
	
INSERT INTO livros(
	isbn, unit_estoque, titulo, unit_valor, id_categoria, id_editora)
	VALUES ( 9788570418296, 5, 'Homo Sacer', 580, 40, 2);

INSERT INTO livros(
	isbn, unit_estoque, titulo, unit_valor, id_categoria, id_editora)
	VALUES ( 9788845919855, 2, 'La follia che viene dalle Ninfe', 146.99, 30, 1);

INSERT INTO livros(
	isbn, unit_estoque, titulo, unit_valor, id_categoria, id_editora)
	VALUES ( 9780415255325, 1, 'On Belief', 169.86, 10, 3);

INSERT INTO livros(
	isbn, unit_estoque, titulo, unit_valor, id_categoria, id_editora)
	VALUES ( 9780415255333, 1, 'La fuga. Esercizi di filosofia e di anagogia', 133.89, 20, 2);


SELECT * FROM livros;	


INSERT INTO public.partecipacao(
	 isbn, id_autor)
	VALUES (9788845911095, 1);
	
ALTER TABLE partecipacao
ADD COLUMN funcao VARCHAR;

UPDATE partecipacao
SET funcao = 'autor' 
WHERE id_part = 1;

INSERT INTO partecipacao(
	 isbn, id_autor, funcao)
	VALUES (9788845911095, 4, 'prefacio');

INSERT INTO public.partecipacao(
	 isbn, id_autor, funcao)
	VALUES (9788570418296, 3, 'autor');


INSERT INTO public.partecipacao(
	 isbn, id_autor, funcao)
	VALUES (9788845919855, 2, 'autor');


INSERT INTO public.partecipacao(
	 isbn, id_autor, funcao)
	VALUES (9780415255325, 5, 'autor');

INSERT INTO public.partecipacao(
	 isbn, id_autor, funcao)
	VALUES (9780415255333, 4, 'autor');

INSERT INTO public.partecipacao(
	 isbn, id_autor, funcao)
	VALUES (9780415255333, 1, 'postfacio');

SELECT * FROM partecipacao;


INSERT INTO pedidos(
	cep, cpf, dt_entega, dt_pedidos)
	VALUES ( 29703610, 85200379678, '2022/03/18', '2022/03/14'),
	       ( 12345678, 85200379578, '2022/03/16', '2022/03/13'),
	       (29706812, 85200379504,'2022/03/20', '2022/03/11'),
           (29703618, 12300312345,'2022/03/18', '2022/03/09');
		    
INSERT INTO pedidos(
	cep, cpf, dt_entega, dt_pedidos)			
	VALUES (29706812, 85200379504,'2022/03/22', '2022/03/15');
	


SELECT * FROM pedidos

ALTER TABLE item_pedidos
ADD COLUMN desconto decimal;


-- Criar a funções

-- função que checa se tem estoque suficiente

CREATE OR REPLACE FUNCTION checa_estoque_trg() RETURNS trigger AS $checa_estoque_trg$
    BEGIN
		PERFORM 1 FROM livros
		 WHERE isbn = NEW.isbn
		   AND unit_estoque - NEW.qtde_item >= 0;

		IF NOT FOUND THEN
			RAISE EXCEPTION 'Estoque insuficiente!';
		END IF;

        RETURN NEW;
    END;
$checa_estoque_trg$ LANGUAGE plpgsql;


-- função que atualiza o estoque
CREATE OR REPLACE FUNCTION atualiza_estoque_trg() RETURNS trigger AS $atualiza_estoque_trg$
    BEGIN
		UPDATE livros
		    SET unit_estoque = unit_estoque - NEW.qtde_item
		  WHERE isbn = NEW.isbn;

        RETURN NEW;
    END;
$atualiza_estoque_trg$ LANGUAGE plpgsql;


-- Criar a triggers
-- trigger na tabela item_pedidos  evitar que
-- quantidade seja maior que tem no estoque e atualizar 

CREATE TRIGGER trg_pedido_after_insert AFTER INSERT OR UPDATE ON item_pedidos
FOR EACH ROW EXECUTE PROCEDURE atualiza_estoque_trg();

CREATE TRIGGER trg_pedido_before_insert BEFORE INSERT OR UPDATE ON item_pedidos
FOR EACH ROW EXECUTE PROCEDURE checa_estoque_trg();

SELECT isbn, titulo, unit_estoque FROM livros;

---Insert item_pedidos
INSERT INTO item_pedidos(
	id_pedido, isbn, unit_preco, qtde_item, desconto)
	VALUES (1, 9788845911095, 399.35, 2, 0.10), 
	       (1, 9788570418296, 580, 2, 0.08),
	       (1, 9788845919855, 146.99, 1, 0.05),
		   (2, 9780415255333, 133.89, 1, 0),
		   (3, 9780415255325, 169.86, 1, 0.02),
		   (3, 9788845911095, 399.35, 1, 0.10),
		   (4, 9788570418296, 580, 1, 0.10),
		   (5, 9788570418296, 580, 1, 0.10),
		   (5, 9788845919855, 146.99, 1, 0.03);

SELECT * FROM item_pedidos

SELECT isbn, titulo, unit_estoque FROM livros;

