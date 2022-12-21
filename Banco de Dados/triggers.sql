-- **************************
-- **************************
-- Cria a função

-- função que checa se tem estoque suficiente
-- para a quantidade de livros informados no pedido.
-- caso não tenha, aborta a operação de compra.
CREATE OR REPLACE FUNCTION checa_estoque_trg() RETURNS trigger AS $checa_estoque_trg$
    BEGIN
        -- verifica o estodo
		PERFORM 1 FROM livros
		 WHERE id_livro = NEW.id_livro
		   AND qtd_estoque - NEW.qtd >= 0;

		IF NOT FOUND THEN
			RAISE EXCEPTION 'Estoque insuficiente!';
		END IF;

        RETURN NEW;
    END;
$checa_estoque_trg$ LANGUAGE plpgsql;

-- função que atualiza o estoque após a venda.
CREATE OR REPLACE FUNCTION atualiza_estoque_trg() RETURNS trigger AS $atualiza_estoque_trg$
    BEGIN
		UPDATE livros
		    SET qtd_estoque = qtd_estoque - 1
		  WHERE id_livro = NEW.id_livro;

        RETURN NEW;
    END;
$atualiza_estoque_trg$ LANGUAGE plpgsql;




-- **************************
-- **************************
-- Cria a triggers


-- trigger na tabela pedidos para evitar que
-- seja vendido um livro com a quantidade
-- maior que tem no estoque
DROP TRIGGER trg_pedido_after_insert ON pedidos;
DROP TRIGGER trg_pedido_before_insert ON pedidos;

CREATE TRIGGER trg_pedido_after_insert AFTER INSERT OR UPDATE ON pedidos
FOR EACH ROW EXECUTE PROCEDURE atualiza_estoque_trg();

CREATE TRIGGER trg_pedido_before_insert BEFORE INSERT OR UPDATE ON pedidos
FOR EACH ROW EXECUTE PROCEDURE checa_estoque_trg();