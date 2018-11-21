module ScreenPlay
  class Actor
    def self.named(name)
      Actor.new(name)
    end

    def initialize(name)
      @name = name
      @abilities = {}
    end

    def can(*abilities)
      # You can use it to add a driver or whatever
      self
    end

    def uses(fsm)
      @fsm = fsm.running
      self
    end

    def attemps_to(task)
      @fsm.send(task.first,*task[1..-1])
      self
    end
  end
end
