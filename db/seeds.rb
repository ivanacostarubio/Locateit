# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

tiendas = Tienda.create([
  { :nombre => "900 Store", :direccion => "900 biscayne bay", :ciudad => "Miami", :estado => "Florida", :pais => "USA", :codigo_postal => "33132"},
  { :nombre => "50 Store", :direccion => "50 biscayne bay", :ciudad => "Miami", :estado => "Florida", :pais => "USA", :codigo_postal => "33132"}
])