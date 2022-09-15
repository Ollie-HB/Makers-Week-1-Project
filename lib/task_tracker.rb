def task_tracker(text)
  fail "Error: No sentence entered." if text.empty?
  text.include?("#TODO")
end