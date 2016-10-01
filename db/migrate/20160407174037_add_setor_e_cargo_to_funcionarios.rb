class AddSetorECargoToFuncionarios < ActiveRecord::Migration
  def change
    add_reference :funcionarios, :setor, index: true, foreign_key: true
    add_reference :funcionarios, :cargo, index: true, foreign_key: true
  end
end
