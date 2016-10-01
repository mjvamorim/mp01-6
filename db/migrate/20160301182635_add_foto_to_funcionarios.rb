class AddFotoToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :foto, :string
  end
end
