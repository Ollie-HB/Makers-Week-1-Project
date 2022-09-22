class TodoList
    def initialize
        @task_arr = []
    end
  
    def add(todo)
      @task_arr << todo
    end
  
    def incomplete
        @task_arr.select do |check|
        !check.done?
        end
    end
  
    def complete
        @task_arr.select do |check|
        check.done?
        end
    end
  
    def give_up!
      not_complete = @task_arr.select {|check|!check.done?}
      not_complete.map {|change| "#{change} #done"}
      complete = @task_arr.select {|check| check.done?}
      complete + not_complete
    end
end
  
 