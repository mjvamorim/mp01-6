class CreateSetores < ActiveRecord::Migration
  def change
    create_table :setores do |t|
      t.integer :codsetor
      t.string :nomesetor

      t.timestamps null: false
    end
  end
end
