require_relative 'screen'

module ScreenPlay
  class Actions

  end

  class LoginActions < Actions
    class << self
      def login_into(username, pass)
        puts "#{LoginScreen.user_input} -- #{username}"
        puts "#{LoginScreen.pass_input} -- #{pass}"
        puts "#{LoginScreen.login_button} clicked"
      end
    end
  end

  class MainActions < Actions
    class << self
      def logout
        puts "#{MainScreen.logout} clicked"
      end
    end
  end
end