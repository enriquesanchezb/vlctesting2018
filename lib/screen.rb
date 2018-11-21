module ScreenPlay
  class Screen

  end

  class LoginScreen < Screen
    class << self
      def user_input
        "DEBUG: user input"
      end

      def pass_input
        "DEBUG: pass input"
      end

      def login_button
        "DEBUG: pass button"
      end
    end
  end

  class MainScreen < Screen
    class << self
      def user_map
        "DEBUG: map"
      end

      def logout
        "DEBUG: logout button"
      end
    end
  end
end