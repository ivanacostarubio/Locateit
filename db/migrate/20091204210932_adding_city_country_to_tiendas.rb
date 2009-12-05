class AddingCityCountryToTiendas < ActiveRecord::Migration
  def self.up
    add_column :tiendas, :ciudad, :string
    add_column :tiendas, :estado, :string
    add_column :tiendas, :codigo_postal, :string
    add_column :tiendas, :pais, :string
  end

  def self.down
    remove_column :tiendas, :ciudad
    remove_column :tiendas, :estado
    remove_column :tiendas, :codigo_postal
    remove_column :tiendas, :pais
  end
end
