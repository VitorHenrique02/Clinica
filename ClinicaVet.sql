create database X05;
use X05;

create table cliente(
id_cliente int not null auto_increment,
cod_consulta int,
cod_animal int,
nome varchar (50),
cpf varchar (50),
endereço varchar (50),
primary key (id_cliente)
);



create table animal(
id_animal int not null auto_increment,
cod_enfermidade int,
nome varchar(50),
raça varchar(50),
sexo varchar(50),
primary key (id_animal)
);



create table enfermidade(
id_enfermidade int not null auto_increment,
nome varchar(50),
tratamento varchar (50),
primary key (id_enfermidade)
);

create table consulta(
id_consulta int not null auto_increment,
cod_vet int,
data_consulta date,
primary key (id_consulta)
);


create table veterinario(
id_vet int not null auto_increment,
nome varchar (50),
cpf varchar (50),
especialidade varchar (50),
primary key (id_vet)
);

alter table consulta add constraint FK_vet foreign key(cod_vet) references veterinario(id_vet);
alter table cliente add constraint FK_animal foreign key(cod_animal) references animal(id_animal);
alter table cliente add constraint FK_consulta foreign key(cod_consulta) references consulta(id_consulta);
alter table animal add constraint FK_enfermidade foreign key(cod_enfermidade) references enfermidade(id_enfermidade);


insert into veterinario(nome,cpf,especialidade)values
('Dra. Karla','345789012','Cirurgiã');
insert into veterinario(nome,cpf,especialidade)values
('Dr. Nicolas','65490743123','Clinico Geral');


insert into enfermidade(nome,tratamento)values
('Cisto','Injeção');
insert into enfermidade(nome,tratamento)values
('Hematoma','Anti-inflamatorio');


insert into consulta(cod_vet,data_consulta)values
('1','2023-05-16');
insert into consulta(cod_vet,data_consulta)values
('2','2023-04-29');


insert into animal(cod_enfermidade,nome,raça,sexo)values
('1','Bob','Pastor Alemão','Macho');
insert into animal(cod_enfermidade,nome,raça,sexo)values
('2','Olinda','Gato Siames','Femea');


insert into cliente(cod_consulta,cod_animal,nome,cpf,endereço)values
('1','1','Helena','10812073040','Rua Alberto Ferreira');
insert into cliente(cod_consulta,cod_animal,nome,cpf,endereço)values
('2','2','Jussara','23456790743','Rua das Dores');


select * from cliente;
select * from vet;
select * from animal;
select * from doença;
select * from consulta;


select consulta.data_consulta as DataDaConsulta, veterinario.nome as NomeDoVeterinario, animal.nome as NomeDoAnimal, 
enfermidade.nome as Enfermidade from animal
inner join cliente on animal.id_animal = cliente.cod_animal
inner join consulta on consulta.id_consulta = cliente.cod_consulta
inner join enfermidade on enfermidade.id_enfermidade = animal.cod_enfermidade
inner join veterinario on veterinario.id_vet = consulta.cod_vet

