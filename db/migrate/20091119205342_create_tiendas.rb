class CreateTiendas < ActiveRecord::Migration
  def self.up
    create_table :tiendas do |t|
      t.string :nombre
      t.string :direccion
      t.integer :lat
      t.integer :lng
      t.timestamps
    end
  end

  def self.down
    drop_table :tiendas
  end
end
