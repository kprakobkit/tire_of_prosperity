require_relative 'config/application'
require_relative 'app/models/app_class'
require_relative 'app/controllers/controller'
require_relative 'app/views/view'


puts "Put your application code in #{File.expand_path(__FILE__)}"

controller = Controller.new
controller.play
