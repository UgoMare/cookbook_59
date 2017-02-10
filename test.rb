require 'pry-byebug'
require_relative 'recipe'
require_relative 'cookbook'
require_relative 'controller'


new_instance_of_cookbook = Cookbook.new
controller = Controller.new(new_instance_of_cookbook)

controller.list
controller.add_recipe
controller.add_recipe
controller.list
controller.delete_recipe
controller.list
