# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Filial.create(nomefilial: 'Campos Centro',uf: 'RJ', telefone: '(22)2726-2861')
Filial.create(nomefilial: 'Guarus',uf: 'RJ', telefone: '(22)2726-2861')

Setor.create(codsetor:1, nomesetor: 'Administração', filial_id: 1)
Setor.create(codsetor:2, nomesetor: 'Operacional', filial_id: 1)
Setor.create(codsetor:3, nomesetor: 'Financeiro', filial_id: 2)

Cargo.create(codcargo:1, nomecargo: 'Gerente', salariobase: 1000.0)
Cargo.create(codcargo:2, nomecargo: 'Analista', salariobase: 3000.0)
Cargo.create(codcargo:3, nomecargo: 'Professor', salariobase: 900.0)
Cargo.create(codcargo:4, nomecargo: 'Analista Senior', salariobase: 7000.0)

Funcionario.create(matricula: '1111.1.111.1111', nome: 'Fernanda', 
	endereco: 'Rua 11', telefone: '(011) 1111-1111',
	salario: 1000, sexo: 'F', dtadmissao: '2016-03-01', 
	foto: 'FernandaAmorim-00114110216.jpg' , setor_id: 3, cargo_id: 2)
Funcionario.create(matricula: '2222.2.222.2222', nome: 'Mauricio', 
	endereco: 'Rua 22', telefone: '(022) 2222-2222',
	salario: 900, sexo: 'M', dtadmissao: '2016-04-01', 
	foto: '' , setor_id: 1, cargo_id: 4)
Funcionario.create(matricula: '3333.3.333.3333', nome: 'Amanda', 
	endereco: 'Rua 33', telefone: '(033) 3333-3333',
	salario: 1900, sexo: 'F', dtadmissao: '2016-04-01', 
	foto: '' , setor_id: 1, cargo_id: 2)
Funcionario.create(matricula: '4444.4.444.4444', nome: 'Rui', 
	endereco: 'Rua 44', telefone: '(044) 4444-4444',
	salario: 2200, sexo: 'M', dtadmissao: '2016-04-01', 
	foto: '' , setor_id: 3, cargo_id: 4)

Usuario.delete_all

u=Usuario.new
u.email = 'mjvamorim@gmail.com'
u.password= '12345678'
if u.valid?
	u.save
else
	p u.errors
end




