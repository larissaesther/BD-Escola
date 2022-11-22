CREATE DATABASE tbEscola
GO 

use tbescola
CREATE TABLE tbPeriodo(
codPeriodo INT PRIMARY KEY IDENTITY(1,1)
,nomePeriodo VARCHAR (40) not null
)
CREATE TABLE tbCurso(
codCurso INT PRIMARY KEY IDENTITY(1,1)
,nomeCurso VARCHAR (40) not null UNIQUE
,cargaHorariaCurso VARCHAR (40) not null
,codPeriodo INT FOREIGN KEY REFERENCES tbPeriodo(codPeriodo)
)
CREATE TABLE tbAluno(
codAluno INT PRIMARY KEY IDENTITY(100,2)
,nomeAluno VARCHAR (60) not null
,dataNascAluno SMALLDATETIME CHECK(dataNascAluno < GETDATE())

-- ,dataNascAluno SMALLDATETIME check(dataNascAluno < GETDATE())

,ruaAluno VARCHAR (60) not null
,numCasaAluno VARCHAR (60) not null
,bairroAluno VARCHAR (60) not null
,telefoneAluno VARCHAR (60) not null UNIQUE
)
CREATE TABLE tbMatricula(
codMatricula VARCHAR (40) not null UNIQUE
,dataMatricula SMALLDATETIME DEFAULT GETDATE()
,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
,codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso)
,codPeriodo INT FOREIGN KEY REFERENCES tbPeriodo(codPeriodo)
)