class AddDtadmissaoToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :dtadmissao, :date
  end
end
