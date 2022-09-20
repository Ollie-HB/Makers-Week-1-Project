class TrackTasks

    def initialize
        @list = []  
    end 

    def add_task(text)
        fail "Error: No string added" if text.empty?
        @list << text
    end

    def list
        @list
    end

    def mark_complete(task)
        fail "Error: No such task exists" unless @list.include? task
        @list.delete(task)
    end
end