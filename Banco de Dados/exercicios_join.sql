SELECT a.nome AS "AUTOR", par.funcao, l.titulo, c.nome AS "CLIENTE", i.qtde_item, 
       p.dt_pedidos, i.unit_preco, i.desconto
FROM item_pedidos AS i
INNER JOIN pedidos AS p USING(id_pedido)
INNER JOIN livros AS l USING(isbn)
INNER JOIN clientes AS c USING(cpf)
INNER JOIN partecipacao AS par USING(isbn)
INNER JOIN autores AS a USING(id_autor)
WHERE par.funcao = 'autor'


SELECT i.*, c.nome
FROM item_pedidos AS i
INNER JOIN pedidos AS p USING(id_pedido)
INNER JOIN clientes AS c USING (cpf)


SELECT * FROM livros
