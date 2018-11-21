require_relative 'screen'

module ScreenPlay
  class Questions

  end

  class LoginQuestions
    class << self
      def are_you?
        #!(LoginScreen.user_input + LoginScreen.login_button + LoginScreen.pass_input).nil?
        true
      end
    end
  end

  class MainQuestions
    class << self
      def are_you?
        #!("#{MainScreen.user_map}#{MainScreen.logout}".nil?)
        true
      end
    end
  end
end