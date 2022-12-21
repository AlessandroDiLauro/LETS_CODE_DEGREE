SELECT *
FROM cliente
INSERT INTO cliente(
	cod_cli, nome_cli, cidade, cep, uf)
	VALUES ('001', 'Alessandro', 'Colatina', '29703610', 'ES');
	
INSERT INTO cliente(
	cod_cli, nome_cli, endereco, cidade, cep, uf)
	VALUES ('002', 'Luciana','Rua Antonio Sabaine 10', 'Colatina', '29703610', 'ES');
	
INSERT INTO cliente(
	cod_cli, nome_cli, endereco, cidade, cep, uf)
	VALUES ('003', 'Lenardo','Rua Antonio Sabaine 10', 'Colatina', '29703610', 'ES');
	
INSERT INTO cliente(
	cod_cli, nome_cli, endereco, cidade, cep, uf)
	VALUES ('004', 'Roberto','Via Puccini 70', 'Albano Laziale', '00041', 'RM');
	
INSERT INTO cliente(
	cod_cli, nome_cli, endereco, cidade, cep, uf)
	VALUES ('005', 'Teresa','Via Puccini 70','Albano Laziale', '00041', 'RM');



SELECT *
FROM produto
INSERT INTO public.produto(
	cod_prod, unid_prod, desc_prod, val_unit)
	VALUES ('0001', '10', '5', '25');
	
INSERT INTO public.produto(
	cod_prod, unid_prod, desc_prod, val_unit)
	VALUES ('0002', '14', '15', '103.50');
	
INSERT INTO public.produto(
	cod_prod, unid_prod, desc_prod, val_unit)
	VALUES ('0003', '3', '5', '25.60');
	
INSERT INTO public.produto(
	cod_prod, unid_prod, desc_prod, val_unit)
	VALUES ('0004', '10', '5', '25');
	
INSERT INTO public.produto(
	cod_prod, unid_prod, val_unit)
	VALUES ('0005', '1','250');


SELECT *
FROM vendedor
INSERT INTO vendedor(
	cod_vend, nome_vend, sal_fixo, faixa_comiss)
	VALUES ('1', 'Jessica', '1500', '4');
	
INSERT INTO vendedor(
     cod_vend, nome_vend, sal_fixo, faixa_comiss)
	 VALUES ('2', 'Mirko', '1600', '1')
	 
INSERT INTO vendedor(
     cod_vend, nome_vend, sal_fixo, faixa_comiss)
	 VALUES ('3', 'Miranda', '1600', '1')
	 
INSERT INTO vendedor(
     cod_vend, nome_vend, sal_fixo, faixa_comiss)
	 VALUES ('4', 'Gustavo', '1300', '3')
	 
INSERT INTO vendedor(
     cod_vend, nome_vend, sal_fixo, faixa_comiss)
	 VALUES ('5', 'Tatiana', '1600', '5')

SELECT *
FROM pedido
INSERT INTO pedido(
	num_ped, prazo_entr, cod_cli, cod_vend)
	VALUES ('1', '15:00', '001', '1');
	
INSERT INTO pedido(
	num_ped, prazo_entr, cod_cli, cod_vend)
	VALUES ('2', '00:25', '003', '5');
	
INSERT INTO pedido(
	num_ped, prazo_entr, cod_cli, cod_vend)
	VALUES ('3', '01:25', '003', '5');
	
INSERT INTO pedido(
	num_ped, prazo_entr, cod_cli, cod_vend)
	VALUES ('4', '00:45', '005', '2');	
	
INSERT INTO pedido(
	num_ped, prazo_entr, cod_cli, cod_vend)
	VALUES ('5', '02:00', '002', '4');

SELECT *
FROM item_pedido
INSERT INTO item_pedido(
	num_ped, cod_prod, qtd_ped, cod_item_pedido)
	VALUES ('1', '0003', '3', '01');
	
INSERT INTO item_pedido(
	num_ped, cod_prod, qtd_ped, cod_item_pedido)
	VALUES ('2', '0001', '2', '02');
	
INSERT INTO item_pedido(
	num_ped, cod_prod, qtd_ped, cod_item_pedido)
	VALUES ('3', '0002', '1', '03');
	
INSERT INTO item_pedido(
	num_ped, cod_prod, qtd_ped, cod_item_pedido)
	VALUES ('3', '0002', '1', '03');	
	
INSERT INTO item_pedido(
	num_ped, cod_prod, qtd_ped, cod_item_pedido)
	VALUES ('4', '0005', '5', '04');
	
INSERT INTO item_pedido(
	num_ped, cod_prod, qtd_ped, cod_item_pedido)
	VALUES ('5', '4', '1', '5');				