create database db_generation_game_online;
use  db_generation_game_online;

create table tb_classes(
	id bigint auto_increment,
    descricao varchar(255),
    classe varchar(255),
    primary key (id)
);
insert into tb_classes(descricao, classe) value("suporte","tank");
insert into tb_classes(descricao, classe) value("suporte","encantador");
insert into tb_classes(descricao, classe) value("lutador","colosso");
insert into tb_classes(descricao, classe) value("carregador","mago de controle");
insert into tb_classes(descricao, classe) value("carregador","atirador");
update tb_classes set classe = "arqueiro" where id =5;

select*from tb_classes;
create table tb_personagem(
	id bigint auto_increment,
	nome varchar(255),
    nivel tinyint,
    poderDeDefesa smallint,
    poderDeAtaque smallint,
    vida smallint,
    mana  smallint,
	id_classe bigint,
    primary key(id),
	FOREIGN KEY (id_classe) REFERENCES tb_classes (id)
   );
   alter table tb_personagem  change nome  nome varchar(30)NOT NULL;
   select *from tb_personagem;
insert into tb_personagem(nome,nivel,poderDeDefesa,poderDeAtaque,vida,mana, id_classe)values("vanyel",15,400, 2300, 1800, 800,5);
insert into tb_personagem(nome,nivel,poderDeDefesa,poderDeAtaque,vida,mana, id_classe)values("Dark oblivion", 18, 3000, 600, 3200,400,3);
insert into tb_personagem(nome,nivel,poderDeDefesa, poderDeAtaque,vida,mana, id_classe)values("Bubble", 18, 3200, 300,3000,700,1);
insert into tb_personagem(nome,nivel,poderDeDefesa, poderDeAtaque,vida,mana, id_classe)values("Kshaway", 7, 200, 1300,300,1200,4);
insert into tb_personagem(nome,nivel,poderDeDefesa, poderDeAtaque,vida,mana, id_classe)values("lord paulistinha", 3, 150, 400,200,500,2);
insert into tb_personagem(nome,nivel,poderDeDefesa, poderDeAtaque,vida,mana, id_classe)values("Cachero", 13, 400, 2300,3000,700,4);
insert into tb_personagem(nome,nivel,poderDeDefesa, poderDeAtaque,vida,mana, id_classe)values("Rudimentar", 13, 2600, 100 ,3000,700,1);
insert into tb_personagem(nome,nivel,poderDeDefesa, poderDeAtaque,vida,mana, id_classe)values("TRIPIDA", 3, 70, 300,130,700,4);
-- nerf no pilantra
update tb_personagem set vida = 1300 where id =7;
select *from tb_personagem where poderDeAtaque >2000;
select *from tb_personagem where nome  like "c%";
select  tb_personagem.nome, tb_personagem.nivel, tb_classes.descricao, tb_classes.classe
from tb_personagem inner join tb_classes on tb_personagem.id_classe = tb_classes.id;