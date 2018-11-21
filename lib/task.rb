require 'finite_machine'
require_relative 'abilities'
require_relative 'actions'
require_relative 'questions'

module ScreenPlay
  class Task
    class << self
      def login_into(user,pass)
        puts "\nINFO: Trying to login into"
        [:login_into, user, pass]
      end

      def logout
        puts "\nINFO: Trying to logout"
        [:logout]
      end
    end
  end
end
