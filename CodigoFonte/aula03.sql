CREATE DATABASE curso_sql;

USE curso_sql;/*como selecionado no workbench - todas as vezes que abrir tem que fazer*/
/*ou botar no edit connections -> default schema -> coloca o nome do banco*/

CREATE TABLE funcionarios
(
	id int unsigned not null auto_increment,
    nome varchar(45) not null,
    salario double not null default '0',
    departamento varchar(45) not null,
    PRIMARY KEY (id)
);

CREATE TABLE veiculos
(
	id int unsigned not null auto_increment,
    funcionario_id int unsigned default null,/* not null OPCIONAL*/
    veiculo varchar(45) not null default '',
	placa varchar(10) not null default '',
    PRIMARY KEY (id),
    CONSTRAINT fk_veiculos_funcionarios FOREIGN KEY (funcionario_id) REFERENCES funcionarios (id)
);

CREATE TABLE salarios
(
	faixa varchar(45) not null,
    inicio double not null,
    fim double not null,
    PRIMARY KEY (faixa)
);
/*Cuidado com a 'troca de tipos' int - string por exemplo*/
ALTER TABLE funcionarios CHANGE COLUMN nome nome_func varchar(45) not null;
ALTER TABLE funcionarios CHANGE COLUMN nome_func nome varchar(45) not null;

DROP TABLE salarios;

CREATE INDEX departamentos ON funcionarios (departamento);
/*campo 'departamento' otimizado no sql para ordenamento e agrupamento de registros*/
CREATE INDEX nomes ON funcionarios (nome(6));/*com os 6 primeiros caracteres*/

/*file save script as-> guarda comandos para usar em outro dia*/



