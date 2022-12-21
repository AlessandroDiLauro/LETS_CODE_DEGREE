CREATE TABLE cliente (
	                  cod_cli int not null, 
	                  nome_cli varchar(40) not null, 
	                  endereco varchar(50) null,  
                      cidade varchar(20) null,
                      cep char(8) null,
                      uf char(2) null);

ALTER TABLE cliente ALTER COLUMN cep TYPE char(10);

ALTER TABLE cliente ADD PRIMARY KEY (cod_cli);

CREATE TABLE vendedor (cod_vend int not null, 
					   nome_vend varchar(40) not null,
					   sal_fixo numeric(9,2) not null, 
					   faixa_comiss char(1) not null)
ALTER TABLE vendedor ADD PRIMARY KEY (cod_vend);



CREATE TABLE pedido (num_ped int not null, 
					 prazo_entr time not null, 
					 cod_cli int not null, 
					 cod_vend int not null)

ALTER TABLE pedido ADD PRIMARY KEY (num_ped);



CREATE TABLE item_pedido (num_ped int not null, 
						  cod_prod int not null, 
						  qtd_ped int not null)

ALTER TABLE item_pedido ADD COLUMN cod_item_pedido int not null;

CREATE TABLE produto (cod_prod int not null, 
					  unid_prod int not null, 
					  desc_prod varchar(40) null, 
					  val_unit numeric(5,2) not null);	
					  
ALTER TABLE produto ADD PRIMARY KEY (cod_prod);					  
					  