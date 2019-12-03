create database reserva_de_salas;

use reserva_de_salas;

create table tipo_usuario(
	id_tipo_usuario int not null auto_increment,
	nome varchar(30) not null,
	primary key(id_tipo_usuario)
);

create table usuario(
	id_usuario int not null auto_increment,
	id_tipo_usuario int not null,
	nome varchar(200) not null,
	usuario varchar(200) not null,
	senha varchar(32) not null,
	primary key(id_usuario),
	foreign key(id_tipo_usuario) references tipo_usuario(id_tipo_usuario)
);

create table tipo_sala(
	id_tipo_sala int not null auto_increment,
	tipo int not null,
	primary key(id_tipo_sala)
);

create table sala(
	id_sala int not null auto_increment,
	id_tipo_sala int not null,
	numeracao int not null,
	status_reserva boolean not null,
	primary key(id_sala),
	foreign key(id_tipo_sala) references tipo_sala(id_tipo_sala) 
);

create table reserva(
	id_reserva int not null auto_increment,
	id_sala int not null,
	id_usuario int not null,
	data_reserva date not null,
	data_fim_reserva date not null,
	primary key(id_reserva),
	foreign key(id_sala) references sala(id_sala),
	foreign key(id_usuario) references usuario(id_usuario)
);

insert into tipo_usuario (nome) values ("diretor");
insert into tipo_usuario (nome) values ("professor");

insert into usuario (id_tipo_usuario, nome, usuario, senha) values (2, "Deymes", "dey05", "professor");
insert into usuario (id_tipo_usuario, nome, usuario, senha) values (1, "Athanio", "ath05", "diretor");

insert into tipo_sala (tipo) values ("Laboratório");
insert into tipo_sala (tipo) values ("Sala de aula");
insert into tipo_sala (tipo) values ("Sala de reunião");
insert into tipo_sala (tipo) values ("Auditório");

insert into sala (id_tipo_sala, numeracao, status_reserva) values (1, 1, 0);
insert into sala (id_tipo_sala, numeracao, status_reserva) values (2, 1, 0);
insert into sala (id_tipo_sala, numeracao, status_reserva) values (3, 1, 0);
insert into sala (id_tipo_sala, numeracao, status_reserva) values (4, 1, 0);

insert into reserva (id_sala, id_usuario, data_reserva, data_fim_reserva) values (1, 1, "2019-12-05", "2019-12-07");
insert into reserva (id_sala, id_usuario, data_reserva, data_fim_reserva) values (2, 1, "2019-12-05", "2019-12-07");
insert into reserva (id_sala, id_usuario, data_reserva, data_fim_reserva) values (3, 1, "2019-12-05", "2019-12-07");