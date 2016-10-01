class CreateFiliais < ActiveRecord::Migration
  def change
    create_table :filiais do |t|
      t.string :nomefilial
      t.string :uf
      t.string :telefone

      t.timestamps null: false
    end
  end
end
