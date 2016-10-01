class CreateCargos < ActiveRecord::Migration
  def change
    create_table :cargos do |t|
      t.integer :codcargo
      t.string :nomecargo
      t.float :salariobase

      t.timestamps null: false
    end
  end
end
