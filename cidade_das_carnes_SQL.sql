create database db_cidade_das_carnes;

use db_cidade_das_carnes;

create table tb_categoria(
id bigint auto_increment,
descricao varchar(255) not null,
ativo boolean not null,
primary key (id)
);

insert into tb_categoria (descricao, ativo) values ("Bovino",true);
insert into tb_categoria (descricao, ativo) values ("Suino",true);
insert into tb_categoria (descricao, ativo) values ("Aves",true);
insert into tb_categoria (descricao, ativo) values ("pertence feijoada",true);
insert into tb_categoria (descricao, ativo) values ("imbutidos",true);
insert into tb_categoria (descricao, ativo) values ("soja",true);
insert into tb_categoria (descricao, ativo) values ("outros",true);

select * from tb_categoria;

create table tb_produtos (
id bigint auto_increment,
nome varchar (255) not null,
preco decimal(6,2) not null,
qtproduto int not null,
dtvalidade date,
categoria_id bigint,
primary key (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id)
);

insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("ASA",40.00,30, "2021-11-07", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Picanha",20.00,30, "2021-11-08", 1);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("coxa de frango",20.00,30, "2021-11-07", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Bacon",30.00,30, "2021-11-09", 1);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("hamburguer",60.00,30, "2021-09-07", 5);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Cupim",20.00,30, "2021-11-10", 1);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Peito de frango",25.00,30, "2021-11-09", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Orelha de porco",20.00,30, "2021-11-07", 4);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Salame",18.00,30, "2021-11-21", 5);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("medalhao",50.00,30, "2021-11-15", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("mocoto",20.00,30, "2021-10-05", 2);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("chuleta",20.00,30, "2021-10-07", 1);
insert into tb_produtos (nome, preco, qtProduto) values ("acendedor de churrasqueira",20.00,30);
insert into tb_produtos (nome, preco, qtProduto) values ("soprador de churrasqueira",35.00,30);

select * from tb_produtos;

select nome, preco, categoria_id from tb_produtos;


-- ele vai buscar o que começa com "ha"
select *from tb_produtos where nome like "ha%";
-- ele vai buscar o que terminar com "ha"
select *from tb_produtos where nome like "%ha";
-- ele vai buscar o tudo o que tem "ha"
select *from tb_produtos where nome like "%ha%";


-- ele vai buscar os produtos de 20, 30 e 40 reais 
select *from tb_produtos where preco in (20.00,30.00,40.00);
-- ele vai buscar os produtos de 20, 30 e 40 do maior para o menor
select *from tb_produtos where preco in (20.00,30.00,40.00) order by preco desc;
-- ele vai buscar os produtos de 20, 30 e 40 do menor para o menor 
select *from tb_produtos where preco in (20.00,30.00,40.00) order by preco ASC;

-- ele vai buscar os produtos entre 20 e 30 reais
select *from tb_produtos where preco between 20.00 and 30.00;
-- ele vai mostras os produtos com a validade entre as datas estipuladas e ordenadas po data de validade e nome
select *from tb_produtos where dtvalidade between "2021-11-07" and "2021-11-15" order by dtvalidade, nome ;


-- ele vai contar todos os produtos 
select count(*) from tb_produtos;
 -- ele vai contar todos produtos da categoria_id, mas tem dois a menos pq tem produtos sem categorias
select count(categoria_id)from tb_produtos;

-- ele vai somar os produtos 
select sum(preco) from tb_produtos;
-- ele vai fazer a media dos produtos
select avg(preco) as Media  from tb_produtos;
-- ao inves de dar um media geral ele vai dar um media por semelhanças
select categoria_id, avg(preco) as Media from tb_produtos group by categoria_id;
-- ele vai selecionar o menor preço
select max(preco) as Preço_Maximo from tb_produtos;
-- ele vai selecionar o maior preço
select min(preco) as Preço_Minimo from tb_produtos;
-- ele vai fazer uma consulta em cima de uma consulta
select *from tb_produtos where preco = (select max(preco) as Preço_Maximo from tb_produtos);
 
 -- inner join é interceção 
 select tb_produtos.nome, tb_produtos.preco, tb_categoria.descricao as Categoria
 from tb_produtos inner join tb_categoria on tb_categoria.id = tb_produtos.categoria_id;
 -- vai pegar tudo do lado esquerdo
  select tb_produtos.nome, tb_produtos.preco, tb_categoria.descricao as Categoria
 from tb_produtos left join tb_categoria on tb_categoria.id = tb_produtos.categoria_id;
   -- vai pegar tudo do lado direito
   select tb_produtos.nome, tb_produtos.preco, tb_categoria.descricao as Categoria
 from tb_produtos right join tb_categoria on tb_categoria.id = tb_produtos.categoria_id;