class AddFilialToSetores < ActiveRecord::Migration
  def change
    add_reference :setores, :filial, index: true, foreign_key: true
  end
end
