class AddSexoToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :sexo, :string
  end
end
