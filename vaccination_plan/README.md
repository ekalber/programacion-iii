# Pasos realizados

Terminal:

rails new vaccination_plan

Agregar en Gemfile:

gem 'devise'
gem 'kaminari'

Terminal:

cd vaccination_plan
bundle
rails generate devise:install
rails generate devise User
rails g devise:views

rails g scaffold Nurse user:references first_name:string last_name:string 
rails g scaffold Children first_name:string last_name:string birthday:date sex:integer dni_number:integer
rails g scaffold Vaccine name:string
rails g scaffold VaccineApplication vaccine:references nurse:references child:references date:date dosis:integer

rake db:migrate

rails s