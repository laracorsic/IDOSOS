create database cuidador_idosos;
use cuidador_idosos;
create table idoso (
id int auto_increment primary key,
nome varchar(100) not null,
data_nascimento date,
senha varchar(100) not null 
);
create table familiar (
id int auto_increment primary key,
nome varchar(100) not null,
senha varchar(100) not null,
id_idoso int,

foreign key (id_idoso) references idoso(id)
);
create table remedio (
id int auto_increment primary key,
dosagem varchar(50),
horario time,
cor varchar(20),
id_idoso int,
ativo boolean default true,

foreign key (id_idoso) references idoso(id)
);
create table lembrete (
id int auto_increment primary key,
descricao varchar(200),
data_hora datetime,
confirmado boolean default false,
id_idoso int,

foreign key(id_idoso) references idoso(id)
)