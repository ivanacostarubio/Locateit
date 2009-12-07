Given /^there is a Tienda called "([^\"]*)"$/ do |nombre|
  Factory.create(:tienda, :nombre => nombre)
end

Given /^there is a Tienda called "([^\"]*)" with id "([^\"]*)"$/ do |nombre, id|
  Factory.create(:tienda, :nombre => nombre, :id => id)
end


When /^I browse to tienda "([^\"]*)" page like an admin$/ do |id|
  visit '/tiendas/' + id.to_s + '?admin=yes'
end
