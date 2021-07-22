create database db_pizzaria_legal;
use db_pizzaria_legal;
create table tb_categoria(
    id bigint auto_increment,
    tamanho varchar(30) NOT NULL,
    tipo varchar(8),
    primary key(id)
);
insert into tb_categoria(tamanho,tipo) values("broto","salgada");
insert into tb_categoria(tamanho, tipo) values("normal", "salgada");
insert into tb_categoria(tamanho, tipo) values("normal", "doce");
insert into tb_categoria(tamanho, tipo) values("grande","salgada");
select *from tb_categoria;
create table tb_pizza(
	id bigint auto_increment,
    nome varchar(25),
    delivery boolean NOT NULL,
    sabor varchar(25) NOT null,
    bebida  varchar(15),
	preco decimal(5,2)NOT NULL,
    id_categoria bigint,
    primary key(id),
    foreign key(id_categoria)REFERENCES tb_categoria(id)
);
insert into tb_pizza(nome,delivery,sabor,bebida,preco,id_categoria)values("Walmir", 1,"portuguesa","dolly",56.80, 2);
insert into tb_pizza(nome,delivery,sabor,bebida,preco,id_categoria)values("Willy", 1,"calabresa","Coca",56.80, 2);
insert into tb_pizza(nome,delivery,sabor,bebida,preco,id_categoria)values("Rogerio", 0,"marguerita","guarana",56.80, 2);
insert into tb_pizza(nome,delivery,sabor,bebida,preco,id_categoria)values("Marta", 1,"brigadeiro","sprite",56.80, 3);
insert into tb_pizza(nome,delivery,sabor,bebida,preco,id_categoria)values("Vitor", 0,"atum",0,0, 2);
update tb_pizza set preco = 58.80 where id= 5;
update tb_pizza set bebida = "nenhuma" where id =5;

insert into tb_pizza(nome,delivery,sabor,bebida,preco,id_categoria)values("Tataba", 1,"mussarela","Tutabaina", 26.80, 2);
insert into tb_pizza(nome,delivery,sabor,bebida,preco,id_categoria)values("Yasmim", 1,"calabresa","Guarana",25.80, 1);
insert into tb_pizza(nome,delivery,sabor,bebida,preco,id_categoria)values("Clara", 0,"camarao","Coca",25.60, 4);
select *from tb_pizza ;
select*from tb_pizza where preco between 29 and 60;
select*from tb_pizza where 	sabor like "%c%";

select tb_pizza.nome, tb_pizza.delivery, tb_pizza.sabor, tb_pizza.bebida, tb_pizza.preco, tb_categoria.tamanho
from tb_pizza inner join tb_categoria 
on tb_pizza.id_categoria = tb_categoria.id ; 

select tb_pizza.nome, tb_pizza.delivery, tb_pizza.sabor, tb_pizza.bebida, tb_pizza.preco, tb_categoria.tamanho
from tb_pizza inner join tb_categoria 
on tb_pizza.id_categoria = tb_categoria.id and tb_categoria.id = 3; 