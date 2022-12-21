SELECT *
FROM item_pedido

ALTER TABLE item_pedido 
   ADD FOREIGN KEY (cod_prod) REFERENCES produto (cod_prod);
   
ALTER TABLE item_pedido 
   ADD FOREIGN KEY (num_ped) REFERENCES pedido (num_ped);  
   
ALTER TABLE pedido 
   ADD FOREIGN KEY (cod_cli) REFERENCES cliente (cod_cli);
   
ALTER TABLE pedido
DROP FOREIGN KEY cod_cli;

ALTER TABLE pedido 
   ADD FOREIGN KEY (cod_vend) REFERENCES vendedor (cod_vend);
   
   