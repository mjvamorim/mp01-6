class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.string :matricula
      t.string :nome
      t.string :endereco
      t.string :telefone
      t.float :salario

      t.timestamps null: false
    end
  end
end
