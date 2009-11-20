class CreateTiendas < ActiveRecord::Migration
  def self.up
    create_table :tiendas do |t|
      t.string :nombre
      t.string :direccion
      t.float :lat
      t.float :lng
      t.timestamps
    end
  end

  def self.down
    drop_table :tiendas
  end
end
