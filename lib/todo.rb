 class Todo
    def initialize(task)
      @task = task
      @task_done = ""
    end
  
    def task
      return @task
    end
  
    def mark_done!
        fail "No task provided." if @task.empty?
        @task_done = "#{@task} #done"
    end
  
    def done?
      @task_done.end_with? "#done"
    end
  end

  
  