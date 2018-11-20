require 'finite_machine'

module Menu
  def menu_button
    'button for open menu'
  end

  def logout
    'logout button'
  end

  def are_you?
    true
  end
end

class Page
  class << self
    def are_you?
      false
    end
  end
end


class Login < Page
  class << self
    def user
      'user field'
    end

    def pass
      'pass field'
    end

    def button
      'login button'
    end

    def are_you?
      true
    end
  end
end


class MainPage < Page

  class << self
    include Menu
    def map
      'map with images'
    end

    def order_a_cab_menu
      'menu to order a new car'
    end

    def are_you?
      true
    end
  end
end

class Execution
  def running
    @running ||= FiniteMachine.new(self) do
      initial :not_logged

      event :login_into, :not_logged => :logged, if: -> () do
        Login.are_you?
        puts "#{Login.user} -- typed 'admin'"
        puts "#{Login.pass} -- typed 'admin'"
        puts "#{Login.button} -- clicked"
        MainPage.are_you?
      end

      event :logout, :logged => :not_logged, if: -> () do
        MainPage.are_you?
        puts "#{MainPage.menu_button} -- clicked"
        puts "#{MainPage.logout} -- clicked"
        Login.are_you?
      end

      on_enter_logged {|event|
        puts "--> Logged!"
      }

      on_after_logout {|event|
        puts "--> Logout!"
      }
    end
  end
end

ex = Execution.new

ex.running.login_into
ex.running.logout
