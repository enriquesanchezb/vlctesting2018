require_relative 'lib/actor'
require_relative 'lib/task'
require_relative 'lib/abilities'

include ScreenPlay

actor = Actor.named('enrique').can(UseDriver.new(nil)).uses(UseFSM.new)

puts "\n------------"
puts "First test:\n\n"
actor.attemps_to(Task.logout)
puts "\n------------"
puts "Second test:\n\n"
actor.attemps_to(Task.login_into('admin', 'admin'))
    .attemps_to(Task.logout)
