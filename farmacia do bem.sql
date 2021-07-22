create database db_farmacia_do_bem;
use db_farmacia_do_bem;
create table tb_categoria(
	id bigint auto_increment,
    tipo varchar(255),
    descricao varchar(255),
    primary key (id)
);

insert into tb_categoria(tipo,descricao)values ("cosmedico","higiene pessoal");
insert into tb_categoria(tipo,descricao)values ("medicamento","sem tarja");
insert into tb_categoria(tipo,descricao)values ("medicamento","tarja vermelha sem retenção de receita ");
insert into tb_categoria(tipo,descricao)values ("medicamento","tarja vermelha com retenção de receita");
insert into tb_categoria(tipo,descricao)values ("medicamento","tarja preta");
select*from tb_categoria ;
create table tb_produto(
	id bigint auto_increment,
    nome varchar(255),
    precoUni decimal(5,2),
    quantidade smallint,
    desconto tinyint,
    id_categoria bigint,
    primary key(id),
    foreign key(id_categoria)references tb_categoria(id)
);
insert into tb_produto(nome, precoUni, quantidade, desconto, id_categoria)
values("artane", 12.19, 400, 12,5);

insert into tb_produto(nome, precoUni, quantidade, desconto, id_categoria)
values("rivotril", 26.48, 500, 0, 5);

insert into tb_produto(nome, precoUni, quantidade, desconto, id_categoria)
values("androgel", 242.72, 300, 12, 4);

insert into tb_produto(nome, precoUni, quantidade, desconto, id_categoria)	
values("combodart", 386.76, 200, 12, 3);

insert into tb_produto(nome, precoUni, quantidade, desconto, id_categoria)	
values("Diost", 41.19, 400, 23, 3);

insert into tb_produto(nome, precoUni, quantidade, desconto, id_categoria)	
values("creme facial", 23.03, 241, 15, 1);

insert into tb_produto(nome, precoUni, quantidade, desconto, id_categoria)	
values("aczenil", 8.90, 123, 53, 1);

insert into tb_produto(nome, precoUni, quantidade, desconto, id_categoria)	
values("luva de silicone", 12.50, 129, 37, 1);

select *from  tb_produto where precoUni>50;
select *from tb_produto where precoUni between 3 and 60;
select *from tb_produto where nome like "%b%";
select tb_produto.id, tb_produto.nome, tb_produto.precoUni, tb_produto.quantidade,tb_produto.desconto, tb_categoria.descricao
from tb_produto inner join tb_categoria on tb_produto.id_categoria = tb_categoria.id and tb_categoria.id= 1;

