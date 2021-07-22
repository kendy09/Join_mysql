create database db_construindo_a_nossa_vida;
use db_contruindo_a_nossa_vida;
create table tb_categoria(
	id bigint auto_increment,
    tipo varchar(255),
    ativo boolean not null,
    primary key(id)
);
insert into tb_categoria(tipo, ativo) values("hidraulica",true);
insert into tb_categoria(tipo, ativo) values("contrução",true);
insert into tb_categoria(tipo, ativo) values("eletrica",true);
select*from tb_categoria;
create table tb_produtos(
	id bigint auto_increment,
    nome varchar(255),
    preco decimal(5,2),
    quantidade int (3),
	desconto int (3),
    categoria_id bigint,
    primary key(id),
    foreign key (categoria_id)references tb_categoria(id)
);
select *from tb_produtos;

	insert into tb_produtos(nome,preco, qtd,desconto,categoria_id)  values("união paracalhas da agua 28 cinza", 10.90,123, 8, 1);
    insert into tb_produtos(nome,preco, qtd,desconto,categoria_id)  values("Telha Brasilit Ondulada de Fibrocimento", 44.90,320, 0, 2);
    insert into tb_produtos(nome,preco, qtd,desconto,categoria_id)  values("Tubo para esgoto 6 metros 100mm Tigre", 144.90,112, 0, 1);
    insert into tb_produtos(nome,preco, qtd,desconto,categoria_id)  values("Eletroduto roscável antichama 1polegada 3 metros Tigre",27.81,213, 12, 3);
    insert into tb_produtos(nome,preco, qtd,desconto,categoria_id)  values("Conduíte corrugado flexível 25mm 50 metros amarelo Tigre", 129.89,82, 18, 3);
    insert into tb_produtos(nome,preco, qtd,desconto,categoria_id)  values("Bloco Cerâmico Nova Conquista 11,5x14x24cm Vermelhoinsert ", 1.09,800, 0,2);
    insert into tb_produtos(nome,preco, qtd,desconto,categoria_id)  values("Janela Veneziana Ecosul de Alumínio 3 Folhas 100x120cm Branca", 639.90,120, 0, 2);
    insert into tb_produtos(nome,preco, qtd,desconto,categoria_id)  values("Caixa d'água com tampa 500 litros polietileno Fortlev", 144.90,112, 0, 1);
    
    select *from tb_produtos where preco>50;
    select *from tb_produtos where preco between 3 and 60;
    select *from tb_produtos where nome like "c%";
    select tb_produtos.nome, tb_produtos.preco, tb_produtos.qtd, tb_produtos.desconto,tb_categoria.tipo
    from tb_produtos inner join tb_categoria on tb_produtos.categoria_id = tb_categoria.id and tb_categoria.id = 1;