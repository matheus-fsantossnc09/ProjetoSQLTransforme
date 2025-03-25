-- apagar o banco de dados
drop database dbLoja;

-- criar o banco de dados
create database dbLoja;

-- acessar o banco de dados
use dbLoja;

-- criando as tabelas do banco de dados
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
cpf char(14) not null unique,
tel char(10),
dataNasc date,
sexo char(1),
salario decimal(9,2),
logradouro varchar(100),
numero char(10),
cep char(9),
bairro varchar(100),
cidade varchar(100),
estado varchar(100),
siglaEst char(2),
complemento varchar(100),
primary key(codFunc)
);



create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(50)not null,
email varchar(100),
cnpj char(18) not null unique,
primary key(codForn)
);

create table tbClientes(
codClien int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCel char(9),
cpf char(14) not null unique,
primary key(codClien)
);

create table tbUsuario(
codUsu int not null auto_increment,
nome varchar(30) not null unique,
senha varchar(12) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc)references tbFuncionarios(codFunc)
);

create table tbProdutos(
codProd int not null auto_increment,
nome varchar(100) not null,
valor decimal(9,2),
quantidade int,
dataEnt date,
validade date,
codForn int not null,
primary key(CodProd),
foreign key(codForn)references tbFornecedores(codForn)
);

create table tbVendas(
codVend int not null auto_increment,
dataVenda date,
horaVenda time,
quantidade int,
valorTotal decimal(9,2),
codProd int not null,
codUsu int not null,
codClien int not null,
primary key(CodVend),
foreign key(CodProd)references tbProdutos(codProd),
foreign key(codUsu)references tbUsuario(codUsu),
foreign key(codClien)references tbClientes(codClien)
);

-- visualizando a estrutura da tabela
desc tbFuncionarios;
desc tbUsuario;
desc tbFornecedores;
desc tbProdutos;
desc tbClientes;
desc tbVendas;

-- inserindo registro nas tabelas

insert into tbFuncionarios(nome,email,cpf,tel,dataNasc,sexo,
	salario,logradouro,numero,cep,bairro,cidade,estado,siglaEst,complemento)
values('Matheus Ferreira','matheusf090424@gmail.com','511.745.568-12','95217-1219','2004/04/09',
'Masculino',4500.55,'Carlos Barbosa Santos','1500','04852-110','Jardim Noronha','
Sao Paulo','Sao Paulo','SP','Bloco 12 apto 303');

-- visualizando os registros das tabelas

select * from tbFuncionarios;