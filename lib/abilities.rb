require_relative 'task'

module ScreenPlay
  class Abilities
  end

  class UseDriver < Abilities
    def initialize(caps)

    end
  end

  class UseFSM < Abilities
    def running
      @running ||= FiniteMachine.new(self) do
        initial :not_logged

        # Events
        event :login_into, :not_logged => :logged, if: -> (_, username, pass) do
          LoginActions.login_into(username, pass)
          true
        end
        event :login_into, :logged => :logged

        event :logout, :not_logged => :not_logged
        event :logout, :logged => :not_logged, if: -> () do
          MainActions.logout
          true
        end

        # Callbacks
        on_before_login_into do |event|
          LoginQuestions.are_you?
        end

        on_before_logout do |event|
          MainQuestions.are_you?
        end

        on_enter_logged do |event|
          MainQuestions.are_you?
          puts "INFO: Logged"
        end

        on_enter_not_logged do |event|
          LoginQuestions.are_you?
          puts "INFO: Logout"
        end
      end
    end
  end
end