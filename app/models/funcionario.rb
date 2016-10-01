class Funcionario < ActiveRecord::Base
	validates_presence_of :nome, message: "O nome deve ser preenchido"
  	validates_presence_of :endereco, message: "O Endereço deve ser preenchido"
  	validates_presence_of :telefone, message: "O telephone deve ser preenchido"

 	validates_uniqueness_of :nome, message: "Matricula já cadastrado"
  
  	validates_size_of :nome, :minimum => 3, :maximun=>50, message: "Muito pequeno ou muito grande, mínimo de 3 e máximo de 50 caracteres"
  
  	validates_numericality_of :salario, message: "O salário deve ser numérico"


	mount_uploader :foto, FotoFuncionarioUploader
	belongs_to :cargo
	belongs_to :setor


end
